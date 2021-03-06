//********************************************************************
//********************************************************************
//************************ Table View Section ************************
//********************************************************************
//********************************************************************

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //建立兩個類別的資料，存在陣列裡面，之後用來顯示
    let animalArray = ["cat","dog","elephant","rabbit"]
    let fruitArray = ["apple","banana","mango","watermelon"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        //要顯示幾個Section，範例中顯示2個sections
        return 2
    }
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        //Section裡面要顯示的列數，
        //第0個Section要顯示animalArray的列數；
        //不是第0個Section的話，要顯示fruitArray的列數
        if section == 0{
            return animalArray.count
        }else{
            return fruitArray.count
        }
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //設定Cell的文字，第0個Section要顯示animalArray的資料；
        //不是第0個Section的話，要顯示fruitArray的資料
        if indexPath.section == 0{
            cell.textLabel?.text = animalArray[indexPath.row]
        }else{
            cell.textLabel?.text = fruitArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //設定每個section中title的文字
        if section == 0{
            return "ANIMAL"
        }else{
            return "FRUIT"
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //設定每個header的高度
        return 60
    }
}