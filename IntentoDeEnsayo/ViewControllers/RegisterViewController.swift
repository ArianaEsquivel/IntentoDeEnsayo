//
//  RegisterViewController.swift
//  IntentoDeEnsayo
//
//  Created by Ariana Esquivel on 03/03/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var users:[User] = []
    var exists:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SaveUser(_ sender: UIButton) {
        self.users = User.getUsers()
        if !tfUsername.text!.isEmpty && !tfCorreo.text!.isEmpty && !tfPassword.text!.isEmpty{
            for user in self.users {
                if user.username == tfUsername.text!{
                    self.exists = true
                }
            }
            if !self.exists{
                let user = User(tfUsername.text!, tfCorreo.text!, tfPassword.text!)
                user.store(ve: self)
            }else{
                sender.shake()
                self.alertDefault(with: "Usuario Existente", andWithMsg: "El usuario ya existe agrega otro wey")
            }
            self.exists = false
        }else{
            self.alertDefault(with: "Usuario no registrado", andWithMsg: "Rellena los campos completamente")
        }
    }

}

