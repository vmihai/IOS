//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Victor Mihaita on 16/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSound : AVAudioPlayer!
    var runningNumber = ""
    
    enum Operations: String {
        case Divide = "/"
        case Multiply =  "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operations.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path (forResource: "btn", ofType: "wav")
        let soundURL = URL (fileURLWithPath: path!)
        
        do {
            
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    @IBAction func onDividePressed (sender: AnyObject) {
        processOperation(operation: .Divide)
    }
    @IBAction func onMultiplyPressed (sender: AnyObject) {
        processOperation(operation: .Multiply)
    }
    @IBAction func onSubstractPressed (sender: AnyObject) {
        processOperation(operation: .Subtract)
    }
    @IBAction func onAddPressed (sender: AnyObject) {
        processOperation(operation: .Add)
    }
    @IBAction func onEqualPressed (sender:AnyObject){
        processOperation(operation: currentOperation)
    }
    @IBAction func onClearPressed(sender: AnyObject) {
        runningNumber = ""
        outputLabel.text = runningNumber
        currentOperation = Operations.Empty
        leftValStr = ""
        rightValStr = ""
        result = ""
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func processOperation(operation: Operations){
        if currentOperation != Operations.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operations.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operations.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operations.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operations.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLabel.text = result
            }
            
            currentOperation = operation
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

