//
//  PhotoListViewController.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {
    
    let photos = ["01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03", "01", "02", "03"]
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.photoCollectionView?.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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

extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Cell はストーリーボードで設定したセルのID
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell",
                                               for: indexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        imageView.image = cellImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize: CGFloat = self.view.frame.size.width / 3 - 1.5
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
}
