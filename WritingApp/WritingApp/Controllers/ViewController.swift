//
//  ViewController.swift
//  WritingApp
//
//  Created by Richard Wang on 7/23/18.
//  Copyright © 2018 Richard Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func unwindWithSegue (_ segue: UIStoryboardSegue) {
        print("cancel button1")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

