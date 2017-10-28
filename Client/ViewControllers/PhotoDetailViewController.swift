//
//  PhotoDetailViewController.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/29.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedImg
        imageView.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func downloadImage(_ sender: UIBarButtonItem) {
        UIImageWriteToSavedPhotosAlbum(selectedImg, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "保存完了"
        var message = "カメラロールに保存しました"
        
        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }
        
        UIAlertController(title: title, message: message, preferredStyle: .alert)
            .addAction(title: "OK")
            .show()
        
    }
}
