//
//  APIHelper.swift
//  ExpandDemo
//
//  Created by RamiReddy on 20/03/21.
//  Copyright © 2021 RamiReddy. All rights reserved.
//

import Foundation
 
import Alamofire
import SVProgressHUD



class APICallHelper: NSObject {


let appDelegate = UIApplication.shared.delegate as! AppDelegate

var request : URLRequest?
var session : URLSession?

static let sharedInstance = APICallHelper()

//MARK:- GET SERVICE CALL
func featchDataServiceCall(url:String,postDict:[String:AnyObject], completionHandler : @escaping (Dictionary<String, Any>, NSError?) -> ())
{
     
    
    SVProgressHUD.setDefaultStyle(.custom)
    SVProgressHUD.setDefaultMaskType(.custom)
    SVProgressHUD.setForegroundColor(UIColor.black)           //Ring Color
    SVProgressHUD.setBackgroundColor(#colorLiteral(red: 0.9926139712, green: 0.8786385655, blue: 0, alpha: 1))        //HUD Color
    SVProgressHUD.setBackgroundLayerColor(UIColor.clear)    //Background Color
    SVProgressHUD.show()
    
     Alamofire.request(url, method: .get, parameters: postDict).responseJSON { response in
        
        print("url ",url)
        print(response)
        
        switch response.result {
        case .failure:
            SVProgressHUD.dismiss()
          case .success:
            SVProgressHUD.dismiss()
            // handle success here
            completionHandler(((response.result.value as? Dictionary<String, Any>)!), response.result.error as NSError?)
         }
         
        #if DEBUG
        
        #endif
    }
}



//MARK:- POST SERVICE CALL
func postServiceCall(url:String,PostDetails: [String:AnyObject], completionHandler : @escaping (Dictionary<String, Any>, NSError?) -> ()){
    print("API ",url)
    print("API Params",PostDetails)
     SVProgressHUD.setDefaultStyle(.custom)
     SVProgressHUD.setDefaultMaskType(.custom)
     SVProgressHUD.setForegroundColor(UIColor.black)           //Ring Color
     SVProgressHUD.setBackgroundColor(#colorLiteral(red: 0.9926139712, green: 0.8786385655, blue: 0, alpha: 1))         //HUD Color
     SVProgressHUD.setBackgroundLayerColor(UIColor.clear)    //Background Color
     SVProgressHUD.show()
    let headers = [ "Content-Type" : "application/x-www-form-urlencoded"]
    Alamofire.request(url, method: .post, parameters: PostDetails, encoding: URLEncoding.default, headers: headers).responseJSON { response in
        print(response)
        switch response.result {
        case .failure:
            SVProgressHUD.dismiss()
        case .success:
            // handle success here
            SVProgressHUD.dismiss()
            completionHandler(((response.result.value as? Dictionary<String, Any>)!), response.result.error as NSError?)
        }
        //completionHandler(response.result.value as! Dictionary<String, Any>, response.result.error as NSError?)
    }
}

    
}
