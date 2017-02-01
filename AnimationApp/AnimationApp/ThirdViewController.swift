//
//  ThirdViewController.swift
//  AnimationApp
//
//  Created by Grace Matuszyk on 1/25/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {

//    @IBOutlet weak var dismissButton2: UIButton!
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDesc: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAddTask(_ sender: UIButton) {
        taskMGR.addTask(name: textName.text!, desc: textDesc.text!)
        

        
        self.view.endEditing(true)
        textName.text = ""
        textDesc.text = ""
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

//    @IBAction func dismissThirdVC(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }



}
