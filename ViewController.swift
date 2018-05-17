//
//  ViewController.swift
//  ConverterV2
//
//  Created by Pranav on 5/16/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flag:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let neVc:SecondViewController = segue.destination as! SecondViewController
        
        neVc.convType =  flag
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        flag = sender.title(for: .normal)!
        //print(flag)
    }
    
    
    
}

