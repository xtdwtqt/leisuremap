//
//  loginViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit
import SwiftyJSON

class loginViewController: UIViewController,UITextFieldDelegate, AsyncResponseDelegate, fileworkerdelegate{
    func fileworkwritecompleted(_ sender: fileworker, filename: String, tag: Int) {
        
    }
    
    func fileworkreadcompleted(_ sender: fileworker, filename: String, tag: Int) {
        
    }
    

    @IBOutlet weak var txtaccount: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var btmlogin: UIButton!
    
    var requestWorker:AsyncRequestWorker?
    var fileworkerdelegate:fileworkerdelegate?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //http://score.azurewebsites.net/api/login/acc/pwd
        
        requestWorker=AsyncRequestWorker()
        
        requestWorker?.responseDelegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    
    @IBAction func btnloginclicked(_ sender: Any) {
        
        let  account=txtaccount.text!
        let  password=txtpassword.text!
        
        
        
        let from = "https://score.azurewebsites.net/api/login/\(account)/\(password)"
        
        self.requestWorker?.getResponse(from: from, tag: 1)
        
    }
    
    func readservicecategory(){
        
        let from = "https://score.azurewebsites.net/api/servicecategory"
        self.requestWorker?.getResponse(from: from, tag: 2)
    }
    func    readstore(){
        let from = "https://score.azurewebsites.net/api/store"
        self.requestWorker?.getResponse(from: from, tag: 3)
    
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        //
        let accept = "abcdeABCDE"
        
        let cs=NSCharacterSet(charactersIn: accept).inverted
        //['a','b','c',]
        let filtered = string.components(separatedBy: cs).joined(separator: "")
        
        //["a","b","c"]
        
        if(string != filtered){
            
            return false
        }
        
        
        
        
        
        // max length
        var maxlength:Int=0
        
        if textField.tag==1{
            maxlength = 4
            
        }
        if textField.tag==2{
            maxlength = 5
            
        }
        
        let currentstring : NSString=textField.text! as NSString
        
        let newstring:NSString=currentstring.replacingCharacters(in: range, with: string)as NSString
        
        return newstring.length<=maxlength
        
        
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag==1{
            textField.resignFirstResponder()
            txtpassword.becomeFirstResponder()
        }
        if textField.tag==2{
            textField.resignFirstResponder()
        }
        return true
    }
    // MARK:AsyncResponseDelegate
    
    
    func receivedResponse(_ sender: AsyncRequestWorker, responseString responsetring: String, tag: Int) {
        //print(responsetring)
        //print("\(tag):\(responsetring)")
        switch tag{
            
        case 1:
            self.readservicecategory()
            break
        case 2:
            do{
                if let dataFromString = responsetring.data(using: .utf8, allowLossyConversion: false) {
                    
                    let json = try JSON(data: dataFromString)
                    
                    for (index,subJson):(String, JSON) in json {
                        
                        let index : Int = subJson["index"].intValue
                        let name : String = subJson["name"].stringValue
                        let imagePath : String = subJson["imagePath"].stringValue
                        print("\(index ):\(name)")

                    }
                }
            }catch{
                print(error)
            }
            
            
            self.readstore()
            break
        case 3:
            //store
            //print("\(tag):\(responsetring)")
            //{"serviceIndex":0,"name":"Cafe00","location":{"address":"","latitude":0.0,"longitude":0.0},"index":0,"imagePath":""}
            do{
                if let dataFromString = responsetring.data(using: .utf8, allowLossyConversion: false) {
                    
                    let json = try JSON(data: dataFromString)
                    
                    for (index,subJson):(String, JSON) in json {
                        let serviceIndex: Int = subJson["serviceIndex"].intValue
                        let name : String = subJson["name"].stringValue
                        let index : Int = subJson["index"].intValue
                        let imagePath : String=subJson["imagePath"].stringValue
                        let location : JSON = subJson["location"]
                        let latitude : Double=location["latitude"].doubleValue
                        let longitude : Double=location["longitude"].doubleValue
                      
                        print("\(index ):\(name):longitude:\(latitude)")
                        
                    }
                }
            }catch{
                print(error)
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "movetodetailviewcontroller", sender: self)            }
        default:
            break
        }
        
//        defaults.synchronize()
//        
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "movetologinviewcontroller", sender: self)
//        }
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
