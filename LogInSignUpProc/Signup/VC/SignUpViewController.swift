
// SignUpVC
import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var rePwdTF: UITextField!{
        didSet{
            rePwdTF.delegate = self
        }
    }
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var signupView: UIView!
    
    // MARK: Property
    lazy var reference = Database.database().reference()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    // MARK: 회원가입 -> 로그인으로 돌아가는 버튼
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: 가입버튼
    @IBAction func singUpBtn(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "이메일을 입력해주세요,",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let pwd = pwdTF.text, !pwd.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호를 입력해주세요.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
        guard let rePwd = rePwdTF.text, !rePwd.isEmpty else{
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호를 다시 입력해주세요.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
            return
        }
       
        if pwd != rePwd {
            UIAlertController.presentAlertController(target: self,
                                                     title: "비밀번호가 다릅니다.",
                                                     massage: nil,
                                                     cancelBtn: false,
                                                     completion: nil)
        }else{
            Auth.auth().createUser(withEmail: email, password: pwd, completion: { [weak self] (user, error) in
                guard let `self` = self else { return }
                if error == nil, let user = user{
                    let userDictionary : [String: Any] = ["user":["email": user.email]]
                    self.reference.child(user.uid).setValue(userDictionary)
                    UIAlertController.presentAlertController(target: self,
                                                             title: "가입축하",
                                                             massage: "가입을 축하드립니다.",
                                                             actionStyle: .default,
                                                             cancelBtn: false,
                                                             completion: { _ in
//                                                                self.performSegue(withIdentifier: self.segueSignUpToMain, sender: nil)
                    })
                }
            })
        }
    }
    
}
// MARK: UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    
    // MARK: textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pwdTF.resignFirstResponder()
        return true
    }
}

