// LoginViewController
import UIKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var kakaoBtn: UIButton!
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius  = loginBtn.frame.size.height / 2
        facebookBtn.layer.cornerRadius  = facebookBtn.frame.size.height / 2
        kakaoBtn.layer.cornerRadius  = kakaoBtn.frame.size.height / 2
    }
    
    @IBAction func kakaoBtnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func facebookBtnAction(_sender: UIButton) {
        
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        
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
            Auth.auth().signIn(with: credential) { (user, error) in
                if error == nil, user != nil {
                    
                }
            }
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
