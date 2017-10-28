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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func changeView() {
        performSegue(withIdentifier: "toComplete", sender: nil)
    }
}
