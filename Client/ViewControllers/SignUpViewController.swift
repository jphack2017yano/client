//
//  SignUpViewController.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailAddressTextField: UITextField!
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        mailAddressTextField.delegate = self
        userNameTextField.addBorderBottom(height: 1.0, color: UIColor.gray)
        mailAddressTextField.addBorderBottom(height: 1.0, color: UIColor.gray)
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        User().setUserInfo(name: userNameTextField.text!, address: mailAddressTextField.text!)
        UIAlertController(title: "完了", message: "ユーザ登録を完了しました", preferredStyle: .alert)
            .addAction(title: "OK") { _ in
                self.performSegue(withIdentifier: "backToTop", sender: nil)
            }
            .show()
    }
    
    @IBAction func selectMyImage(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension SignUpViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage]
        myImage.image = image as? UIImage
    }
    
}

extension SignUpViewController: UITextFieldDelegate {    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
