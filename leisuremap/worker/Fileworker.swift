//
//  Fileworker.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation
protocol fileworkerdelegate {
    func fileworkwritecompleted(_ sender:fileworker,filename:String, tag:Int)
    func fileworkreadcompleted(_ sender:fileworker,filename:String, tag:Int)

}
class fileworker {
    
    var fileworkerdelegate : fileworkerdelegate?
    
    func writetofile(content:String,filename:String,tag:Int)  {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            let  fileURL = dir.appendingPathComponent(filename)
            
            do{
                try content.write(to: fileURL, atomically: false, encoding: .utf8)
                self.fileworkerdelegate?.fileworkreadcompleted(self, filename: fileURL.absoluteString, tag: tag)
        
            }
            catch{ print(error)}
        }
        
        
    }
    func readfromfile(filename:String,tag:Int) ->String {
        var result:String = ""
        return result
    }
    
    
}

