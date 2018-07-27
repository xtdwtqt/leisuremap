//
//  store.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/27.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation

class store {
    
    var ServiceIndex : Int = 0
    var Name : String?
    var storelocation : Locationdesc?
    var Index : Int = 0
    var ImagePath : String?
    
    
}

class Locationdesc {
    ///  地址
    var Address : String?
       ///  纬度
    var Latitude : Double?
       ///  经度
    var longitude : Double?
    
}
