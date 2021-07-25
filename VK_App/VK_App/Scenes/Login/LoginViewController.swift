//
//  ViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 19.07.21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var singInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singInButton.layer.cornerRadius = 11
        loginField.layer.cornerRadius = 11
        passwordField.layer.cornerRadius = 11
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
   @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        scrollView.scrollRectToVisible(singInButton.frame, animated: true)
    }
    
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    //проверяем авторизацию
    func checkAuth() -> Bool {
        return (loginField.text == "aaa") && (passwordField.text == "000")
    }
    
   //сообщение об ошибке авторизации
    func showAuthError() {
        let alertVC = UIAlertController(title: "Ошибка", message: "Введите корректные логин и пароль", preferredStyle: .alert)
        let okAktion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertVC.addAction(okAktion)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "mainScreenID" && checkAuth(){
            return true
        } else {
            showAuthError()
            return false
        }
    }
}
    


