//
//  ServiceViewCell.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/27.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit
import SDWebImage


class ServiceViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    func updateContent(service : ServiceCategory) ->Void{
        lbName.text = service.Name
        
        bgImageView.sd_setImage(with: URL(string: service.ImagePath!), placeholderImage: UIImage(named: "placeholder"))

    }
}
