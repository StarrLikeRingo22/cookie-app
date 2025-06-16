//
//  LoginViewController.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              StoreManager.shared.login(username: username, password: password) else {
            let alert = UIAlertController(title: "Login Failed", message: "Invalid credentials", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }

        if let mainTabBar = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") {
            mainTabBar.modalPresentationStyle = .fullScreen
            present(mainTabBar, animated: true)
        }
    }
}

