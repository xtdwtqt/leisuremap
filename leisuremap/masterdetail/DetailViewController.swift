//
//  DetailViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedStore : store?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = selectedStore?.Name
    }
    
    @IBAction func BtnMapClicked(_ sender: Any) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "movetomap", sender: self)            }
    }
    
    @IBAction func btnWebClicked(_ sender: Any) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "movetonote", sender: self)            }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "movetomap":
            
            
            
            break
            
        case "movetonote":
            
            break
        default:
            break
        }
    }
 

}
