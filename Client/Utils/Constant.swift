//
//  Constant.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import Foundation

struct Constant {
    
    struct UserKeys {
        let name = "name"
        let address = "address"
    }
    
    struct URL {
        let baseURL = "http://ec2-18-216-61-164.us-east-2.compute.amazonaws.com/"
        let getPhotoURI =  "image/download?id=jphacks2017"
        let photoURI = "photos/"
    
        func getPhotoListURL() -> String {
            return baseURL + getPhotoURI
        }
        
        func getPhotoURL() -> String {
            return baseURL + photoURI
        }
    }
    
}
