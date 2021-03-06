//
//  iniciarSessionViewController.swift
//  Snapchat
//
//  Created by Mac Tecsup on 13/11/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class iniciarSessionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func iniciarSessionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in print("Intentamos iniciar session")
            if error != nil {
                print("Tenemos el siguiente error: \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in print("Intentamos crear un usuario")
                    if error != nil {
                        print("Tenemosel siguiente error: \(error)")
                    }else {
                       print("El usuario fue creado existosamente")
                        Database.database().reference().child("usuarios").child(user!.uid).child("email").setValue(user!.email)
                        
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Inicio sesion exitosos")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }


}

