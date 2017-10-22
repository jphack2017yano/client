//
//  User.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import Foundation

struct User {
    
    let userInfoDefaults = UserDefaults.standard
    
    func setUserInfo(name: String, address: String) {
        userInfoDefaults.set(name, forKey: Constant.UserKeys().name)
        userInfoDefaults.set(address, forKey: Constant.UserKeys().address)
    }
    
    func getUserInfo() -> [String: String] {
        
        return [Constant.UserKeys().name: userInfoDefaults.string(forKey: Constant.UserKeys().name)!,
                Constant.UserKeys().address: userInfoDefaults.string(forKey: Constant.UserKeys().address)!]
    }
    
    func clearUserInfo() {
        userInfoDefaults.set("", forKey: Constant.UserKeys().name)
        userInfoDefaults.set("", forKey: Constant.UserKeys().address)
    }
    
    func isUserSignedIn() -> Bool {
        
        if (isKeyPresentInUserDefaults(key: Constant.UserKeys().name))
            || (isKeyPresentInUserDefaults(key: Constant.UserKeys().address)) {
            
            return true
        }
        return false
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return userInfoDefaults.object(forKey: key) != nil
    }
}
