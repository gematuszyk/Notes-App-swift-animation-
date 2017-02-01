//
//  TaskManager.swift
//  AnimationApp
//
//  Created by Grace Matuszyk on 1/26/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import UIKit

var taskMGR: TaskManager = TaskManager()

struct task{
    var name = "unnamed"
    var desc = "undescribed"
}

class TaskManager: NSObject {
    
   var tasks = [task]()
    
    func addTask(name: String, desc: String) {
        tasks.append(task(name: name, desc: desc))
    }
    
}
