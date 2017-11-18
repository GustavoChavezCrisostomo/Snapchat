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
            }else{
                print("Inicio sesion exitosos")
            }
        })
    }


}

