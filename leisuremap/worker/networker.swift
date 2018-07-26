//
//  networker.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation
protocol AsyncResponseDelegate {
    func receivedResponse (_ sender:AsyncRequestWorker,responseString:String,tag:Int)->Void
}
class AsyncRequestWorker{
    
    var responseDelegate : AsyncResponseDelegate?
    
    func getResponse(from:String,tag:Int)->Void{
        let url=URL(string: from)!
        
        let request = URLRequest(url: url)
        
        let config=URLSessionConfiguration.default
        let session=URLSession(configuration:config)
        
        let task=session.dataTask(with: request, completionHandler: {(data,response,error)in
            
            let httpresponse = response as! HTTPURLResponse
            let statusCode = httpresponse.statusCode
            
            
            if(200 == statusCode){
                let datastring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                let responsestring=String(datastring!)

                self.responseDelegate?.receivedResponse(self, responseString: responsestring, tag: tag)
                
            }
            
        })
        task.resume()
        
    }
    
}
//import UIKit
//
//class splashViewController: UIViewController,AsyncResponseDelegate {
//
//
//
//    var appversion : String=""
//    @IBOutlet weak var lbversion: UILabel!
//
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//        let defaults: UserDefaults = UserDefaults.standard
//
//        defaults.synchronize()
//
//        appversion = ""+(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as?String)!
//        lbversion.text=appversion
//
//        //
//        requestWorker =
//
//
//        let from : String = "https://score.azurewebsites.net/api/version/\(String(describing: appversion))"
//
//
//    }
//
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    // MARK:AsyncResponseDelegate
//    func receivedResponse(_ sender: AsyncRequestWorker, responsetring: String, tag: Int) {
//        print(responsetring)
//    }
//
//}
