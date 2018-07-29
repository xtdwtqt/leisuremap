//
//  noteViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class noteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
  
    @IBAction func btnPhotoClicked(_ sender: Any) {
        
       showActionSheet()
        
    }
    
    func showActionSheet() {
    
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment:"camera"), style: .default, handler: { (alert:UIAlertAction!) -> Void in
    self.camera()
    }))
    
    actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Gallery", comment:"gallery"), style: .default, handler: { (alert:UIAlertAction!) -> Void in
    self.photoLibrary()
    }))
    
    actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Cancel",comment: "cancel"), style: .cancel, handler: nil))
    
    self.present(actionSheet, animated: true, completion: nil)
    }
    
    func camera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self ;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
        
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
