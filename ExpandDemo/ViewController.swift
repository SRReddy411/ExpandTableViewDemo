//
//  ViewController.swift
//  ExpandDemo
//
//  Created by RamiReddy on 20/03/21.
//  Copyright © 2021 RamiReddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var servicesTable: UITableView!
    var servicesDataArray = [ServicesModel]()
    private var sectionIsExpanded = [Bool]()
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
        getServiceCall()
    }
    
    
    
    func getServiceCall(){
        if ReachabilityFile .isConnectedToNetwork() {
            
            let parameters = ["lang":"en","API-KEY":"630950"] as [String:AnyObject]
            print(parameters)
            
            APICallHelper.sharedInstance.postServiceCall(url: "http://maplenestinc.com/alandlus_mall/mobile/services", PostDetails: parameters) { (responseData, error) in
                let status:String =   String(responseData["status"] as! Int)
                print(responseData)
                self.servicesDataArray.removeAll()
                if status == "1"{
                    if let listArrya = responseData["data"] as? [[String: Any]] {
                        
                        for list in listArrya {
                            let object = ServicesModel(data: list as NSDictionary)
                            self.sectionIsExpanded.append(false)
                            self.servicesDataArray.append(object)
                        }
                        
                    }
                    DispatchQueue.main.async {
                        self.servicesTable.reloadData()
                    }
                    
                    
                    
                }else  {
                    
                }
                
            }
        }
            
            
        else{
            
        }
    }
    
    
}



extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
     func numberOfSections(in tableView: UITableView) -> Int {
           return servicesDataArray.count
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // First will always be header
           return sectionIsExpanded[section] ? (1+1) : 1
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if indexPath.row == 0 {
                    let cell = servicesTable.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            cell.serviceName_lbl.text =    servicesDataArray[indexPath.section].title
 // for image change
                    if sectionIsExpanded[indexPath.section] {
                       // cell.setExpanded()
                    } else {
                       // cell.setCollapsed()
                    }
                    return cell
                } else {
                    let cell =  servicesTable.dequeueReusableCell(withIdentifier: "ExpandTableViewCell", for: indexPath) as! ExpandTableViewCell
            cell.description_lbl.text = servicesDataArray[indexPath.section].description
                    return cell
                }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 80
        }else{
            return UITableView.automaticDimension
         }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if indexPath.row == 0 {
             sectionIsExpanded[indexPath.section] = !sectionIsExpanded[indexPath.section]

             servicesTable.reloadSections([indexPath.section], with: .automatic)
         }
    }
}
