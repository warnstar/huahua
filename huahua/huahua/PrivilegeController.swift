


//
//  PrivilegeController.swift
//  huahua
//
//  Created by 黄伟昌 on 16/2/17.
//  Copyright © 2016年 黄伟昌. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import CryptoSwift

class Privilege{
     static let login_url:String = SERVER_URL + "/privilege/login/"
     static var user:User = User()
    
     static func login(log_account:String,log_password:String)->String{
        //登录请求
        var log_flag:Bool = false
        var log_error:String = ""
        
        //账户密码数据处理
        let my_account = log_account
        let my_password = log_password.md5()
        
        
        //构造提交数据
        let req_data = [
            "phone"     :my_account,
            "password"  :my_password
        ]
        
        //请求网络
        Alamofire.request(.POST,Privilege.login_url, parameters: req_data).validate().responseJSON{
            response in
            
            if let value = response.result.value {
                let result = JSON(value).dictionary
                
                if result!["code"] == 0{
                    //获取token
                    user.rawDictionary["token"] = result!["token"]?.stringValue
                    
                    //获取用户数据
                    for (k,v_json) in (result!["info"])!{
                        user.rawDictionary[k] =  v_json.stringValue
                    }
                    
                }else{
                    //请求错误（服务器判定）
                    if (result!["error"] != nil) {
                        log_error = result!["error"]!.stringValue
                    }else{
                        log_error = ERRORINFO["DEFAULT"]!
                    }
                }
            }else{
                //请求错误
                log_flag = false
                log_error = ERRORINFO["NETWORK"]!
            }
            
        }//网络请求结束
        
        if log_flag {
            
            return "SUCCESS"
        }else{
            return log_error
        }
        
        
    }
    
}