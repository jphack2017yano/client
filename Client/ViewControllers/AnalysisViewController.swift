//
//  CalibrationViewController.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/28.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class AnalysisViewController: UIViewController {

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 5.0,
            target: self,
            selector: #selector(AnalysisViewController.changeView),
            userInfo: nil,
            repeats: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeView() {
        performSegue(withIdentifier: "toComplete", sender: nil)
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
