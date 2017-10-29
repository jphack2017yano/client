//
//  SignUpViewController.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addScroll: UIScrollView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var txtActiveField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillShowNotification), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillHideNotification), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createAccountButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toAnalysis", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() // Returnキーを押したときにキーボードを下げる
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
    
    @objc func handleKeyboardWillShowNotification(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardRect.size.height
        if txtLimit >= kbdLimit {
            addScroll.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    @objc func handleKeyboardWillHideNotification(notification: NSNotification) {
        addScroll.contentOffset.y = 0
    }
}
