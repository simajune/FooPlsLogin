// LoginViewController
import UIKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

let userAccount = "account"

class LoginViewController: UIViewController {
    
    // MARK: 프로퍼티
   
    
    // @IBOutlet
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var kakaoBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var faceBookBtn: FBSDKLoginButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius  = loginBtn.frame.size.height / 2
        facebookBtn.layer.cornerRadius  = facebookBtn.frame.size.height / 2
        kakaoBtn.layer.cornerRadius  = kakaoBtn.frame.size.height / 2
        faceBookBtn.delegate = self
    }
    // MARK: IBAction
    @IBAction func kakaoBtnAction(_ sender: UIButton) {
        
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
                let account = Account(email: email, password: pwd)
                do{
                    let data = try JSONEncoder().encode(account)
                    KeychainWrapper.standard.set(data, forKey: userAccount)
//                    self.performSegue(withIdentifier: self.LoginToMain, sender: nil)
                }catch (let error){
                    print("\(error.localizedDescription)")
                }
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
    
    //MARK: - request firebase custom token
    private func requestCustomToken(accessToken: String) {
        let url = URL(string: String(format: "%@/verifyToken", Bundle.main.object(forInfoDictionaryKey: "VALIDATION_SERVER_URL") as! String))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let token = KOSession.shared().accessToken
        let parameter = ["token": token]
        do {
            let jsonParams = try JSONSerialization.data(withJSONObject: parameter, options: [])
            urlRequest.httpBody = jsonParams
        }catch {
            print("Error in adding token as a parameter: \(error)")
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, urlRequest, error) in
            guard let data = data, error == nil else {
                print("Error in request token verify: \(error!)")
                return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
                let firebaseToken = jsonResponse["firebase_token"]!
                self.signInToFirebaseWithToken(firebaseToken: firebaseToken)
            }catch let error {
                print("Error in parsing token: \(error)")
            }
        }.resume()
    }
    
    func signInToFirebaseWithToken(firebaseToken: String) {
        print(firebaseToken)
        Auth.auth().signIn(withCustomToken: firebaseToken) { (user, error) in
            if let authError = error {
                print("authError",authError)
            } else {
                self.performSegue(withIdentifier: "mainSegue", sender: self)
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
