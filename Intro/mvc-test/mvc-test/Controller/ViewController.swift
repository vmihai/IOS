//
//  ViewController.swift
//  mvc-test
//
//  Created by Victor Mihaita on 21/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var renameField: UITextField!
    
    let person = Person(first: "Tom", last: "Jerry")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = person.fullName
    }
    @IBAction func renameBtnPressed(_ sender: Any) {
        if let txt = renameField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
    }
}

