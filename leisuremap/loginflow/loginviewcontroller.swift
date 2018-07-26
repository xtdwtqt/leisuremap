//
//  loginViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate ,AsyncResponseDelegate{

    @IBOutlet weak var txtaccount: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var btmlogin: UIButton!
    
    var requestWorker:AsyncRequestWorker?

    override func viewDidLoad() {
        super.viewDidLoad()
        //http://score.azurewebsites.net/api/login/acc/pwd
        
        requestWorker=AsyncRequestWorker()
        
        requestWorker?.responseDelegate=self

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
        print(responsetring)
        
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
