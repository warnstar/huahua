//
//  UserModel.swift
//  huahua
//
//  Created by 黄伟昌 on 16/2/17.
//  Copyright © 2016年 黄伟昌. All rights reserved.
//

import Foundation
class User{
    var token:String = ""
    
    var phone = ""
    var password = ""
    var nickname = ""
    var headicon = ""
    var birth = ""
    var sex = ""
    var last_log_time  = ""
    var rawDictionary:Dictionary<String,String> = [
        "token":"",
        "phone":"",
        "password":"",
        "nickname":"",
        "headicon":"",
        "birth":"",
        "sex":"",
        "last_log_time":"",
        ] {
        willSet{
            self.token = newValue["token"]!
            self.phone = newValue["phone"]!
            self.password = newValue["password"]!
            self.nickname = newValue["nickname"]!
            self.headicon = newValue["headicon"]!
            self.birth = newValue["birth"]!
            self.sex = newValue["sex"]!
            self.last_log_time = newValue["last_log_time"]!
        }
    }
    
}