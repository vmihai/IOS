//
//  ViewController.swift
//  ProgressBar-Test
//
//  Created by Victor Mihaita on 21/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBarView: ProgressBarView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func SliderMoved(_ sender: Any) {
        progressBarView.progress = CGFloat(slider.value)
    }
    
}

