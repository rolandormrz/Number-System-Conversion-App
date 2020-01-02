//
//  ViewController.swift
//  NumberSystemConversion
//
//  Created by Rolando Ramirez on 12/30/19.
//  Copyright © 2019 Rolando Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    var currentMode: String = "decimal"                         // current active mode
    
    // controls the background and available actions for each mode
    @IBOutlet weak var decimalMode: UIButton!
    @IBOutlet weak var binaryMode: UIButton!
    @IBOutlet weak var octalMode: UIButton!
    @IBOutlet weak var hexMode: UIButton!
    
    // controls state for A-F buttons (whether or not they can be used based on the current mode)
    
    @IBOutlet weak var AState: UIButton!
    
    @IBOutlet weak var BState: UIButton!
    
    @IBOutlet weak var CState: UIButton!
    
    @IBOutlet weak var DState: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decimalMode.backgroundColor = .black
    }
    
    // switches the current mode's background to indicate it is no longer the active mode
    func switchMode() {
        switch currentMode {
        case "decimal":
            decimalMode.backgroundColor = .darkGray
        case "binary":
            binaryMode.backgroundColor = .darkGray
        case "octal":
            octalMode.backgroundColor = .darkGray
        case "hex":
            hexMode.backgroundColor = .darkGray
        default:
            print("Error! Something has gone horribly wrong with the switchMode function!")
        }
    }

    // number base buttons
    @IBAction func decimalButton(_ sender: Any) {
        if currentMode != "decimal" {
            switchMode()
            currentMode = "decimal"
            decimalMode.backgroundColor = .black
        }
    }
    
    @IBAction func binaryButton(_ sender: Any) {
        if currentMode != "binary" {
            switchMode()
            currentMode = "binary"
            binaryMode.backgroundColor = .black
        }
    }
    
    @IBAction func octalButton(_ sender: Any) {
        if currentMode != "octal" {
            switchMode()
            currentMode = "octal"
            octalMode.backgroundColor = .black
        }
    }
    
    @IBAction func hexButton(_ sender: Any) {
        if currentMode != "hex" {
            switchMode()
            currentMode = "hex"
            hexMode.backgroundColor = .black
        }
    }
    
    
    // undo and clear operation buttons
    @IBAction func undoButton(_ sender: Any) {
        // if only a single number is displayed and that number is not 0, set the display to 0
        if displayLabel.text!.count == 1 && displayLabel.text != "0" {
            displayLabel.text = "0"
        }
        // if more than one number is displayed, remove the number at then end of the display text
        else if displayLabel.text!.count > 1 {
            displayLabel.text!.removeLast()
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        if displayLabel.text != "0" {
            displayLabel.text! = "0"
        }
    }
    

    // decimal number buttons
    @IBAction func zeroButton(_ sender: Any) {
        if !(displayLabel.text == "0") {
            displayLabel.text = displayLabel.text! + "0"
        }
    }
    
    @IBAction func oneButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "1") : (displayLabel.text = displayLabel.text! + "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "2") : (displayLabel.text = displayLabel.text! + "2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "3") : (displayLabel.text = displayLabel.text! + "3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "4") : (displayLabel.text = displayLabel.text! + "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "5") : (displayLabel.text = displayLabel.text! + "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "6") : (displayLabel.text = displayLabel.text! + "6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "7") : (displayLabel.text = displayLabel.text! + "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "8") : (displayLabel.text = displayLabel.text! + "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "9") : (displayLabel.text = displayLabel.text! + "9")
    }
    
    // hexagonal number buttons
    @IBAction func AButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "A") : (displayLabel.text = displayLabel.text! + "A")
    }
    
    @IBAction func BButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "B") : (displayLabel.text = displayLabel.text! + "B")
    }
    
    @IBAction func CButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "C") : (displayLabel.text = displayLabel.text! + "C")
    }
    
    @IBAction func DButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "D") : (displayLabel.text = displayLabel.text! + "D")
    }
    
    @IBAction func EButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "E") : (displayLabel.text = displayLabel.text! + "E")
    }
    
    @IBAction func FButton(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "F") : (displayLabel.text = displayLabel.text! + "F")
    }
    
    
}

