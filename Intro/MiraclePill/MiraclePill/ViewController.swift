//
//  ViewController.swift
//  MiraclePill
//
//  Created by Victor Mihaita on 14/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var statePicker: UIPickerView!
    
    let states = ["Alaska","Arkansas","California","New York","Maine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        buyBtn.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        buyBtn.isHidden = false
    }
}

