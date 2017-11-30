
// SignUpVC
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var signupView: UIView!
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

