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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
