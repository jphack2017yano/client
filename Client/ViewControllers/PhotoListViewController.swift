//
//  PhotoListViewController.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PhotoListViewController: UIViewController {
    
    var photos: [JSON] = []
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoCollectionView?.backgroundColor = UIColor.clear
        reloadShowPhotoList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadShowPhotoList() {
        Alamofire.request(Constant.URL().getPhotoListURL())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    let jsonObj = JSON(response.result.value ?? "null")
                    if let data = jsonObj.arrayValue as [JSON]? {
                        self.photos = data
                        self.photoCollectionView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
}

extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell",
                                               for: indexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        let photoInfo = photos[(indexPath as NSIndexPath).row]
        let url = URL(string: Constant.URL().getPhotoURL() + photoInfo["url"].string!)
        let data = try? Data(contentsOf: url!)
        let cellImage = UIImage(data: data!)
        imageView.image = cellImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize: CGFloat = self.view.frame.size.width / 3 - 1.5
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let url = URL(string: Constant.URL().getPhotoURL() + photos[(indexPath as NSIndexPath).row].string!)
        let data = try? Data(contentsOf: url!)
        selectedImage = UIImage(data: data!)
        if selectedImage != nil {
            performSegue(withIdentifier: "toDetail", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "toDetail" {
            let photoDetailViewController: PhotoDetailViewController = (segue.destination as? PhotoDetailViewController)!
            photoDetailViewController.selectedImg = selectedImage
        }
    }
}
