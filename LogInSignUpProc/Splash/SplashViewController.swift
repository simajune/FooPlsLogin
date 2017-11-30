//
//  SplashViewController.swift
//  LogInSignUpProc
//
//  Created by SIMA on 2017. 11. 29..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit


class SplashViewController: UIViewController {

    @IBOutlet weak var fooplsLoadingView: FOOPLSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fooplsLoadingView.addLoadingAnimation { [weak self] (action) in
            print("End")
            self?.performSegue(withIdentifier: "loginSegue", sender: self)
        }
        
        
    }
    
}
