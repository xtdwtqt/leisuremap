//
//  loginViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtaccount: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var btmlogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//
//        
//
//    }
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
