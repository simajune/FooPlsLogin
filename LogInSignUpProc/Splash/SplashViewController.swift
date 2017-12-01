//
//  SplashViewController.swift
//  LogInSignUpProc

import UIKit
import Firebase

class SplashViewController: UIViewController {
    
    // MARK: property
    let loginSegue = "loginSegue"
    
    @IBOutlet weak var fooplsLoadingView: FOOPLSView!

    // MARK: Life Cycle
    override func viewDidLoad() {        
        super.viewDidLoad()
        try! Auth.auth().signOut()
        fooplsLoadingView.addLoadingAnimation { [weak self] (action) in
            guard let `self` = self else { return }
            if let _ = Auth.auth().currentUser {
                self.performSegue(withIdentifier: "mainSegue", sender: self)
            }else {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        }
    }
}
