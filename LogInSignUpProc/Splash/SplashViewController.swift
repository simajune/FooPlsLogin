//
//  SplashViewController.swift
//  LogInSignUpProc
//
//  Created by SIMA on 2017. 11. 29..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {

    @IBOutlet weak var fooplsLoadingView: FOOPLSView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
