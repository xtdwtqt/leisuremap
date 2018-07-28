//
//  masterViewController.swift
//  leisuremap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit
import SwiftyJSON

class masterViewController: UIViewController,fileworkerdelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let store = displayStore[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCellView", for: indexPath)as! StoreCellView
        
        cell.updateContent(store : store)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category = categories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceViewCell", for: indexPath)as!ServiceViewCell
        cell.updateContent(service: category)
        
        return cell
        
        
        
    }
    
    func fileworkwritecompleted(_ sender: fileworker, filename: String, tag: Int) {
        
    }
    
    func fileworkreadcompleted(_ sender: fileworker, filename: String, tag: Int) {
        
    }
    
    
    var fileWorker:fileworker?
    let storefilename : String = "store.json"

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    
    var categories: [ServiceCategory] = []
    var stores : [store] = []
    var displayStore : [store]=[]
    var selectedStore : store?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        let sqliteContext = SQLiteWorker()
        let categoriesInSQLite = sqliteContext.readData()
        categories = categories + categoriesInSQLite
        
        //
        fileWorker = fileworker()
        fileWorker?.fileworkerdelegate = self
        
        let content = fileWorker?.readfromfile(filename: "store.json", tag: 1)
        
        do{
               if let dataFromString = content?.data(using: .utf8, allowLossyConversion: false) {
            
               let json = try JSON(data: dataFromString)
            
                  for (_ ,subJson):(String, JSON) in json {
                            let Store : store = store()
                            
                            let serviceIndex: Int = subJson["serviceIndex"].intValue
                            let name : String = subJson["name"].stringValue
                            let index : Int = subJson["index"].intValue
                            let imagePath : String=subJson["imagePath"].stringValue
                            
                            let location : JSON = subJson["location"]
                            let address : String = location["address"].stringValue
                            let latitude : Double=location["latitude"].doubleValue
                            let longitude : Double=location["longitude"].doubleValue
                            
                            Store.ServiceIndex = serviceIndex
                            Store.Name = name
                            Store.Index = index
                            Store.ImagePath = imagePath
                            Store.storelocation = Locationdesc()
                            Store.storelocation?.Address = address
                            Store.storelocation?.Latitude = latitude
                            Store.storelocation?.longitude = longitude
                            
                            stores.append( Store )
            
                    //print("\(index ):\(name):longitude:\(latitude)")
            
                        }
            }
                    }catch{
                            print(error)
                     }
        
        displayStore = displayStore + stores
        
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
