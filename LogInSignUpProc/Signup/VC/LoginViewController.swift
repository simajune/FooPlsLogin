// LoginViewController
import UIKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
