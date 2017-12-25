//
//  ViewController.swift
//  animateCell
//
//  Created by ShKhan on 12/25/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

import UIKit

let CellIdentifier1 = "casxcasxcs"

class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate , UITextFieldDelegate {

    @IBOutlet weak var mytextF: UITextField!
    @IBOutlet weak var areaSettTable: UITableView!
    var animationRunning:Bool!
    
    var arr = [person]()
    
    var itemNum:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animationRunning = false
        
        itemNum = 3
        
        areaSettTable.register(UINib(nibName: "mainTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier1)
        
        arr.append(person.init(name: "item1", age: 5 ,animate:false))
        
        arr.append(person.init(name: "item2", age: 10,animate:false))
        
        areaSettTable.delegate=self
        
        areaSettTable.dataSource=self
        
        areaSettTable.backgroundColor = UIColor.white
        
        areaSettTable.separatorColor = UIColor.clear
        
        areaSettTable.separatorStyle = .none
        
        areaSettTable.showsVerticalScrollIndicator = false
        
        areaSettTable.estimatedRowHeight = 400;
        
        areaSettTable.rowHeight = UITableViewAutomaticDimension;
        
        
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
                let cell = self.areaSettTable.dequeueReusableCell(withIdentifier:CellIdentifier1) as! mainTableViewCell
        
                let df = arr[indexPath.row]
        
                cell.leftLb.text = df.name
        
        cell.cellIndex = indexPath.row
        
        cell.animate = df.animate
        
             if(df.animate)
             {
               cell.contentView.backgroundColor = UIColor.blue
                
             }
          else
             {
                
                  cell.contentView.backgroundColor = UIColor.red
                
                cell.labeltopCon.constant = 20
                
                 cell.layoutSubviews()
                
                 cell.layoutIfNeeded()
                
           }
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none;
            
                return cell
                
      
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        
        
        if(tableView == areaSettTable)
        {
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
       return arr.count
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func sendClicked(_ sender: Any)
    {
        
        if(animationRunning)
        {
            
            return
        }
        
        animationRunning = true
        
          arr.append(person.init(name: "item\(itemNum!)", age: 5,animate: true))
        
        itemNum = itemNum + 1
        
        self.areaSettTable.reloadData()
        
        self.doAnimate()
        
        print("asdssdl;ofm;sdfdffz")
        
    }
    
    func doAnimate()
    {
      
        for i in 0..<arr.count   {
            
            let cell = self.areaSettTable.cellForRow(at: IndexPath.init(row: i, section: 0)) as? mainTableViewCell
            
            let bol = arr[i]
            
            if(cell == nil)
            {
                bol.animate = false
                
                if(i == arr.count - 1)
                {
                    animationRunning = false
                }
                
                if(self.arr.count >= 1 )
                {
                    self.areaSettTable.scrollToRow(at: IndexPath.init(row: self.arr.count - 1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
                }
                
                
                continue
            }
            
            if(cell?.animate)!
            {
              UIView.animate(withDuration: 0.4, animations: {
                
                cell?.labeltopCon.constant = 20
                
                cell?.layoutSubviews()
                
                cell?.layoutIfNeeded()
                
              }, completion: { (finished) in
                
                let re = self.arr[(cell?.cellIndex)!]
                
                re.animate = false
              
                self.areaSettTable.reloadData()
                
                if(self.arr.count >= 1 )
                {
                    self.areaSettTable.scrollToRow(at: IndexPath.init(row: self.arr.count - 1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
                }
                
                self.animationRunning = false
                
              })
                
            }
              
            
        
            
        }
        
        
    }
}

class person:NSObject
{
    var name:String!
    var age:Int!
    var animate:Bool!
    
    init(name:String,age:Int,animate:Bool) {
        
        self.name = name
        
        self.age = age
        
        self.animate = animate
        
        
    }
}

