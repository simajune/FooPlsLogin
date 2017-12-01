// LoginViewController
import UIKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper


class LoginViewController: UIViewController {
    
    // MARK: 프로퍼티
    
    // @IBOutlet
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var faceBookBtn: FBSDKLoginButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faceBookBtn.delegate = self
    }
    // MARK: IBAction
    //MARK: - 카카오 버튼 눌렀을 때
    @IBAction func kakaoBtnAction(_ sender: UIButton) {
        //유효 토큰 제거
        KOSession.shared().close()
        KOSession.shared().presentingViewController = self.navigationController
        KOSession.shared().open { (error) in
            KOSession.shared().presentingViewController = nil
            if KOSession.shared().isOpen() {
                self.requestFirebaseJwt(accessToken: KOSession.shared().accessToken)
            } else {
                print("login failed: \(error!)")
            }
        }
    }
    
    //    @IBAction func facebookBtnAction(_sender: UIButton) {
    //
    //    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else {
            UIAlertController.presentAlertController(target: self,
                                                     title: "이메일을 입력해 주세요.",
                                                     massage: nil,
                                                     actionStyle: .default,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let pwd = pwdTF.text, !pwd.isEmpty else {
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호를 입력해 주세요.",
                                                     massage: nil,
                                                     actionStyle: .default,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        Auth.auth().signIn(withEmail: email, password: pwd) { [weak self] (user, error) in
            guard let `self` = self else { return }
            if error == nil, user != nil{
//                self.performSegue(withIdentifier: self.LoginToMain, sender: nil)
            }else{
                UIAlertController.presentAlertController(target: self,
                                                         title: "이메일 또는 비밀번호가\n 잘못되었습니다.",
                                                         massage: nil,
                                                         actionStyle: .default,
                                                         cancelBtn: false,
                                                         completion: nil)
            }
        }
    }
    /**
     Request firebase token from the validation server.
     */
    func requestFirebaseJwt(accessToken: String) {
        let url = URL(string: String(format: "%@/verifyToken", Bundle.main.object(forInfoDictionaryKey: "VALIDATION_SERVER_URL") as! String))!
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let token = KOSession.shared().accessToken!
        let parameters: [String: String] = ["token": token]
        do {
            let jsonParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.httpBody = jsonParams
        } catch {
            print("Error in adding token as a parameter: \(error)")
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error in request token verifying: \(error!)")
                return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
                let firebaseToken = jsonResponse["firebase_token"]!
                self.signInToFirebaseWithToken(firebaseToken: firebaseToken)
            } catch let error {
                print("Error in parsing token: \(error)")
            }
        }.resume()
    }
    
    /**
     Sign in to Firebse with the custom token generated from the validation server.
     
     Performs segue if signed in successfully.
     */
    func signInToFirebaseWithToken(firebaseToken: String) {
        print(firebaseToken)
        Auth.auth().signIn(withCustomToken: firebaseToken) { (user, error) in
            if let authError = error {
                print("authError",authError)
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        }
    }
}

// MARK: FBSDKLoginButtonDelegate
extension LoginViewController: FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult?, error: Error!) {
        if result?.token == nil {
            return
        }else{
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            Auth.auth().signIn(with: credential) { [weak self] (user, error) in
                guard let `self` = self else { return }
                if error == nil, user != nil {
                    //                    self.performSegue(withIdentifier: <#T##String#>, sender: self)
                }
            }
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
