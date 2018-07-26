//
//  splashViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class splashViewController: UIViewController {
    
    var appversion : String=""
    @IBOutlet weak var lbversion: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults: UserDefaults = UserDefaults.standard
        
        defaults.synchronize()
        
        appversion = ""+(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as?String)!
        lbversion.text=appversion
        
        
        
        let from : String = "https://score.azurewebsites.net/api/version/\(String(describing: appversion))"
        let url=URL(string: from)!
        
        let request = URLRequest(url: url)
        
        let config=URLSessionConfiguration.default
        let session=URLSession(configuration:config)
        
        let task=session.dataTask(with: request, completionHandler: {(data,response,error)in
            
            if( nil == error){
                
                let httpresponse = response as! HTTPURLResponse
                let statusCode = httpresponse.statusCode
                
                
                if(200 == statusCode){
                    let datastring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    
                    let responsestring=String(datastring!)
                    print(responsestring)
                }
                
            }
            else{
                print(error)
            }
            
            
            
            
            
        })
        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
