//
//  SplashViewController.swift
//  LogInSignUpProc

import UIKit
import SwiftKeychainWrapper
import Firebase

class SplashViewController: UIViewController {
    
    // MARK: property
    let loginSegue = "loginSegue"
    
    @IBOutlet weak var fooplsLoadingView: FOOPLSView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fooplsLoadingView.addLoadingAnimation { [weak self] _ in
            guard let `self` = self else{ return }
            if let keyData = KeychainWrapper.standard.data(forKey: userAccount), let account = try? JSONDecoder().decode(Account.self, from: keyData){
                Auth.auth().signIn(withEmail: account.email, password: account.password, completion: {[weak self] (user, error) in
                    guard let `self` = self else { return }
                    if error == nil, user != nil{
                        self.performSegue(withIdentifier: self.loginSegue, sender: self)
                    }else{
                        KeychainWrapper.standard.removeObject(forKey: userAccount)
                        // 키체인에서 삭제하고 난 후 To Do
                        //                            self.performSegue(withIdentifier: self.segueSplashToLogin, sender: nil)
                    }
                })
//            }else if Auth.auth().currentUser{
                //
                //                        self.performSegue(withIdentifier: self.segueSplashToLogin, sender: nil)
            }
            
        }

    }
    
}
