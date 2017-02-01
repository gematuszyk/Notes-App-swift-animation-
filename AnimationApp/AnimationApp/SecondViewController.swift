//
//  SecondViewController.swift
//  AnimationApp
//
//  Created by Grace Matuszyk on 1/25/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var myTableView: UITableView!
    
    var nameArray: [String] = []
    var descArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        myTableView.tableFooterView = UIView()
    }

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath)
    {

//        if (indexPath.row % 2 == 0)
//        {
//            cell.backgroundColor = UIColor(red: 15.0/255.0, green: 73.0/255.0, blue: 92.0/255.0, alpha: 1.0)
          cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.textColor = UIColor.white
//        }
        
//        else
//        {
            cell.backgroundColor = UIColor.clear
        //}
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            taskMGR.tasks.remove(at: indexPath.row)
            
                    //myTableView.deleteRows(at: [indexPath], with: .fade)
            myTableView.reloadData()
        }
    }
    
    @IBAction func dismissSecondVS(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        myTableView.reloadData()
        animateTable()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskMGR.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "test")
        
        
        cell.textLabel?.text = taskMGR.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMGR.tasks[indexPath.row].desc
        

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func animateTable() {
        myTableView.reloadData()
        let cells = myTableView.visibleCells
        
        let tableViewHeight = myTableView.bounds.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
        
    }
}
