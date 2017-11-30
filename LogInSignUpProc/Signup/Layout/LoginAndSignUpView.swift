//
//  LoginAndSignUpView.swift
//  LogInSignUpProc

import UIKit

class LoginAndSignUpView: UIView {
    // MARK: View Layer
    @IBOutlet weak var logInView: UIView?
    @IBOutlet weak var signUpView: UIView?
    @IBOutlet weak var loginStackView: UIStackView?
    
    // MARK: Button
    @IBOutlet weak var signUpBtn: UIButton?
    @IBOutlet weak var logInBtn: UIButton?
    
    // MARK: TextField
    @IBOutlet weak var emailTF: UITextField?
    @IBOutlet weak var passwordTF: UITextField?
    @IBOutlet weak var newEmailTF: UITextField?
    @IBOutlet weak var newPasswordTF: UITextField?
    @IBOutlet weak var rePasswordTF: UITextField?
    @IBOutlet weak var nickNameTF: UITextField?
    
    // MARK: Login + SignUp View Setting
    override func awakeFromNib() {
      
    }
    
    // MARK: Login + SignUp View Setting
    override func layoutSubviews() {
        for view in loginStackView!.arrangedSubviews {
            (view as! UITextField).addUnderLine(height: 1, color: UIColor.black)
           
        }
        
    }
    
}
