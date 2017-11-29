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
        
        self.fooplsLoadingView.addLoadingAnimation()
        
        
        
    }
    
}
