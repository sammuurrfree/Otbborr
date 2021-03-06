//
//  LoginViewController.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import UIKit
import Foundation

var globalUser:AuthModel? = nil

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func hidenKeyboard(_ sender: UITextField) {
        
        view.endEditing(true)
    }
    
    @IBAction func startEditing(_ sender: UITextField) {
        
        sender.text = ""
    }
    
    @IBAction func siginButtonMethod(_ sender: UIButton) {
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if Reachability.isConnectedToNetwork() {
            if emailTextField.hasText && passwordTextField.hasText{
                
                var flag = false
                for charakter in email!{
                    if charakter == "@"{
                        flag = true
                    }
                }
                if flag {
                    let requests = Authorization().auth(login: email!, password: password!)
                    if requests != nil{
                        if requests!.error != nil{
                            let alert = UIAlertController(title: "Error", message: "\(requests!.error!)", preferredStyle: .alert)
                            
                            alert.addAction(UIAlertAction(title: "ok", style: .default))
                            self.present(alert, animated: true)
                        }else{
                            let vc = storyboard?.instantiateViewController(withIdentifier: "main")
                            globalUser = requests
                            
                            present(vc!, animated: true)
                        }
                    }else{
                        let alert = UIAlertController(title: "Error", message: "Ошибка подключения к серверу", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "ok", style: .default))
                        self.present(alert, animated: true)
                    }
                }else{
                    let alert = UIAlertController(title: "Error", message: "В поле EMAIL нет '@' ", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "ok", style: .default))
                    self.present(alert, animated: true)
                }
            }else{
                let alert = UIAlertController(title: "Error", message: "Заполните все поля", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                self.present(alert, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "Error conection", message: "Ошибка подключения к серверу", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}
