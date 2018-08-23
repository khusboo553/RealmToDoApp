//
//  ViewController.swift
//  RealmToDoApp
//
//  Created by GLB-311-PC on 22/08/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var noteListTableView: UITableView!
    var currentItem: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         let item = Item()
//        item.textString="IT works!!"
//        DBManager.sharedInstance.addData(object:item)
        
       
        //
    }
    func showAlert(){
        let alert = UIAlertController(title: "Note", message: "Please enter your Note name!!", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            print("User click Ok button")
            let text = alert.textFields?.first?.text
            //For Item Table
//            self.savetoDb(text:text!)
            
            //For Route table
            self.saveToRouteTable(text:text!)
            print(text ?? "")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    @IBAction func addNotebuttonAction(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    
    func configurationTextField(textField: UITextField!){
        textField.text = ""
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        noteListTableView.reloadData()
//    }
    
    //Mark: Tableview delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return DBManager.sharedInstance.getDataFromDB().count
        
        //for route table
//        return DBManager.sharedInstance.getDataFromRoute().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! noteTableViewCell
        let index = Int(indexPath.row)
        let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
        cell.noteName.text=item.textString
        
         //for route table
//        let item = DBManager.sharedInstance.getDataFromRoute()[index] as ItemRoute
//        cell.noteName.text=item.noteName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let completeAction = UITableViewRowAction(style:UITableViewRowActionStyle.normal, title: "Edit", handler:{(action:UITableViewRowAction!,indexPath:IndexPath!) -> Void in
            self.markCompletedTaskIn(indexPath)
        })
        
        let deleteAction = UITableViewRowAction(style:UITableViewRowActionStyle.destructive, title: "Delete", handler:{(action:UITableViewRowAction!,indexPath:IndexPath!) -> Void in
            self.deleteTaskIn(indexPath)
        })
        
        return [deleteAction,completeAction]
    }
    
    func tableView (_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func markCompletedTaskIn(_ indexPath:IndexPath){
        let index = Int(indexPath.row)
        currentItem = DBManager.sharedInstance.getDataFromDB()[index] as Item
        if let item = currentItem {
            print(item)
            let alert = UIAlertController(title: "Note", message: "Please Edit your note name!!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addTextField(configurationHandler: configurationTextField)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
                let text = alert.textFields?.first?.text
                self.updatetoDb(text:text!,indexpath:(self.currentItem?.ID)!)
                print(text ?? "")
            }))
            
            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
    }
    
    func updatetoDb(text:String,indexpath:Int)
    {
        let item = Item()
        item.ID = indexpath
        item.textString = text
        DBManager.sharedInstance.addData(object: item)
        noteListTableView.reloadData()
    }
    //for route table
    func saveToRouteTable(text:String){
        let item = ItemRoute()
        item.ID = DBManager.sharedInstance.getDataFromRoute().count+1
        item.noteName = text
        DBManager.sharedInstance.addDataFromRoute(object: item)
        noteListTableView.reloadData()
    }
    
    func savetoDb(text:String){
        let item = Item()
        item.ID = DBManager.sharedInstance.getDataFromDB().count+1
        item.textString = text
        DBManager.sharedInstance.addData(object: item)
        noteListTableView.reloadData()
    }
    
    func deleteTaskIn(_ indexPath:IndexPath){
        let index = Int(indexPath.row)
        let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
        DBManager.sharedInstance.deleteFromDb(object: item)
        noteListTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

