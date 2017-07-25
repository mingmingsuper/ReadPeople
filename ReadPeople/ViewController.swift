//
//  ViewController.swift
//  ReadPeople
//
//  Created by liumingming on 2017/7/14.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func fetchDataClick(_ sender: Any)
    {
        self.performSegue(withIdentifier: "fetchData", sender: nil)
    }
    
    @IBAction func contactUIClick(_ sender: Any)
    {
        
    }
    
}

