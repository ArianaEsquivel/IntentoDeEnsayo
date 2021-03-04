//
//  ViewController.swift
//  IntentoDeEnsayo
//
//  Created by Ariana Esquivel on 03/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var users:[User] = []
    var exists:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.users = User.getUsers()
        for user in self.users {
        }
    }
    @IBAction func login(_ sender: UIButton) {
        self.users = User.getUsers()
        if !tfUsername.text!.isEmpty && !tfPassword.text!.isEmpty{
            for user in self.users {
                if user.username == tfUsername.text! && user.password == tfPassword.text!{
                    self.alertDefault(with: "Te has logueado", andWithMsg: "Usuario logeado")
                    return
                }
            }
            self.exists = false
        }else{
            self.alertDefault(with: "Usuario no registrado", andWithMsg: "Rellena los campos completamente")
        }
    }
}

extension UIViewController{
    func alertDefault(with title:String, andWithMsg description:String){
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(a) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
}


extension UIView{
    func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0){
        self.transform = CGAffineTransform(translationX: xValue, y: yValue)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

