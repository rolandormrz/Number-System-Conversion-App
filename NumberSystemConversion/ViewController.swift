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
    
    // current active mode
    var currentMode: String = "decimal"
    
    // controls the background and available actions for each mode
    @IBOutlet weak var decimalBtn: UIButton!
    @IBOutlet weak var binaryBtn: UIButton!
    @IBOutlet weak var octalBtn: UIButton!
    @IBOutlet weak var hexBtn: UIButton!
    
    // controls state for A-F buttons (whether or not they can be used based on the current mode)
    @IBOutlet weak var A_Btn: UIButton!
    @IBOutlet weak var B_Btn: UIButton!
    @IBOutlet weak var C_Btn: UIButton!
    @IBOutlet weak var D_Btn: UIButton!
    @IBOutlet weak var E_Btn: UIButton!
    @IBOutlet weak var F_Btn: UIButton!
    
    // number button variables
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decimalBtn.backgroundColor = .black
        letterBtnsState("not active")
    }
    
    // switches the current mode's background to indicate it is no longer the active mode
    func switchMode(_ newMode: String) {
        switch currentMode {
        case "decimal":
            decimalBtn.backgroundColor = .darkGray
            
            if newMode == "binary" {
                numBtnsState("active binary")
                currentMode = "binary"
                binaryBtn.backgroundColor = .black
                
                displayLabel.text = decimalToBinary(displayLabel.text!)
            }
            else if newMode == "octal" {
                currentMode = "octal"
                octalBtn.backgroundColor = .black
            }
            else {
                letterBtnsState("active")
                currentMode = "hex"
                hexBtn.backgroundColor = .black
            }
            
        case "binary":
            binaryBtn.backgroundColor = .darkGray
            
            if newMode == "decimal" {
                numBtnsState("active")
                currentMode = "decimal"
                decimalBtn.backgroundColor = .black
                
                displayLabel.text = binaryToDecimal(displayLabel.text!)
            }
            else if newMode == "octal" {
                numBtnsState("active")
                currentMode = "octal"
                octalBtn.backgroundColor = .black
            }
            else {
                letterBtnsState("active")
                currentMode = "hex"
                hexBtn.backgroundColor = .black
            }
            
        case "octal":
            octalBtn.backgroundColor = .darkGray
            
            if newMode == "decimal" {
                currentMode = "decimal"
                decimalBtn.backgroundColor = .black
            }
            else if newMode == "binary" {
                numBtnsState("active binary")
                currentMode = "binary"
                binaryBtn.backgroundColor = .black
            }
            else if newMode == "hex" {
                numBtnsState("active binary")
                letterBtnsState("active")
                
                currentMode = "hex"
                hexBtn.backgroundColor = .black
            }

        case "hex":
            hexBtn.backgroundColor = .darkGray
            
            if newMode == "decimal" {
                numBtnsState("active")
                letterBtnsState("not active")
                currentMode = "decimal"
                decimalBtn.backgroundColor = .black
            }
            else if newMode == "binary" {
                letterBtnsState("not active")
                currentMode = "binary"
                binaryBtn.backgroundColor = .black
            }
            else {
                letterBtnsState("not active")
                numBtnsState("active")
                currentMode = "octal"
                octalBtn.backgroundColor = .black
            }
            
        default:
            print("Error! Something has gone horribly wrong with the switchMode function!")
        }
    }
    
    func letterBtnsState(_ state: String) {
        if state == "not active" {
            A_Btn.setTitleColor(.lightGray, for: .normal)
            A_Btn.isEnabled = false
            
            B_Btn.setTitleColor(.lightGray, for: .normal)
            B_Btn.isEnabled = false
            
            C_Btn.setTitleColor(.lightGray, for: .normal)
            C_Btn.isEnabled = false
            
            D_Btn.setTitleColor(.lightGray, for: .normal)
            D_Btn.isEnabled = false
            
            E_Btn.setTitleColor(.lightGray, for: .normal)
            E_Btn.isEnabled = false
            
            F_Btn.setTitleColor(.lightGray, for: .normal)
            F_Btn.isEnabled = false
        }
        else if state == "active" {
            A_Btn.setTitleColor(.black, for: .normal)
            A_Btn.isEnabled = true
            
            B_Btn.setTitleColor(.black, for: .normal)
            B_Btn.isEnabled = true
            
            C_Btn.setTitleColor(.black, for: .normal)
            C_Btn.isEnabled = true
            
            D_Btn.setTitleColor(.black, for: .normal)
            D_Btn.isEnabled = true
            
            E_Btn.setTitleColor(.black, for: .normal)
            E_Btn.isEnabled = true
            
            F_Btn.setTitleColor(.black, for: .normal)
            F_Btn.isEnabled = true
        }
    }
    
    func numBtnsState(_ state: String) {
        if state == "active" {
            zeroBtn.setTitleColor(.black, for: .normal)
            zeroBtn.isEnabled = true
            
            oneBtn.setTitleColor(.black, for: .normal)
            oneBtn.isEnabled = true
            
            twoBtn.setTitleColor(.black, for: .normal)
            twoBtn.isEnabled = true
            
            threeBtn.setTitleColor(.black, for: .normal)
            threeBtn.isEnabled = true
            
            fourBtn.setTitleColor(.black, for: .normal)
            fourBtn.isEnabled = true
            
            fiveBtn.setTitleColor(.black, for: .normal)
            fiveBtn.isEnabled = true
            
            sixBtn.setTitleColor(.black, for: .normal)
            sixBtn.isEnabled = true
            
            sevenBtn.setTitleColor(.black, for: .normal)
            sevenBtn.isEnabled = true
            
            eightBtn.setTitleColor(.black, for: .normal)
            eightBtn.isEnabled = true
            
            nineBtn.setTitleColor(.black, for: .normal)
            nineBtn.isEnabled = true
        }
        else if state == "active binary" {
            zeroBtn.setTitleColor(.black, for: .normal)
            zeroBtn.isEnabled = true
            
            oneBtn.setTitleColor(.black, for: .normal)
            oneBtn.isEnabled = true
            
            twoBtn.setTitleColor(.lightGray, for: .normal)
            twoBtn.isEnabled = false
            
            threeBtn.setTitleColor(.lightGray, for: .normal)
            threeBtn.isEnabled = false
            
            fourBtn.setTitleColor(.lightGray, for: .normal)
            fourBtn.isEnabled = false
            
            fiveBtn.setTitleColor(.lightGray, for: .normal)
            fiveBtn.isEnabled = false
            
            sixBtn.setTitleColor(.lightGray, for: .normal)
            sixBtn.isEnabled = false
            
            sevenBtn.setTitleColor(.lightGray, for: .normal)
            sevenBtn.isEnabled = false
            
            eightBtn.setTitleColor(.lightGray, for: .normal)
            eightBtn.isEnabled = false
            
            nineBtn.setTitleColor(.lightGray, for: .normal)
            nineBtn.isEnabled = false
        }
    }
    
    func decimalToBinary(_ number: String) -> String {
        // convert the argument passed into an integer value
        var decimalValue: Int = Int(number) ?? 0
        
        if decimalValue == 0 {
            return String(decimalValue)
        }
        else if decimalValue == 1 {
            return String(decimalValue)
        }
        
        // stores the binary equivalent of the value passed in
        var binaryValue = [Int]()
        
        while (decimalValue > 0) {
            binaryValue.append(decimalValue % 2)
            decimalValue /= 2
        }
        
        binaryValue.reverse()
        
        var result = ""
        for value in binaryValue {
            result += String(value)
        }
        
        return result
    }
    
    
    func binaryToDecimal(_ value: String) -> String {
        var result: Double = 0.0
        var power: Int = 0
        
        let binaryValue: String = String(value.reversed())
        
        for char in binaryValue {
            if char != "0" {
                result = result + pow(Double(2), Double(power))
            }
            power += 1
        }
        
        return String(Int(result))
    }
    

    // number base buttons
    @IBAction func decimalBtnPress(_ sender: Any) {
        if currentMode != "decimal" {
            switchMode("decimal")
        }
    }
    
    @IBAction func binaryBtnPress(_ sender: Any) {
        if currentMode != "binary" {
            switchMode("binary")
        }
    }
    
    @IBAction func octalBtnPress(_ sender: Any) {
        if currentMode != "octal" {
            switchMode("octal")
        }
    }
    
    @IBAction func hexBtnPress(_ sender: Any) {
        if currentMode != "hex" {
            switchMode("hex")
        }
    }

    
    // undo and clear operation buttons
    @IBAction func undoBtnPress(_ sender: Any) {
        // if only a single number is displayed and that number is not 0, set the display to 0
        if displayLabel.text!.count == 1 && displayLabel.text != "0" {
            displayLabel.text = "0"
        }
        // if more than one number is displayed, remove the number at then end of the display text
        else if displayLabel.text!.count > 1 {
            displayLabel.text!.removeLast()
        }
    }
    
    @IBAction func clearBtnPress(_ sender: Any) {
        if displayLabel.text != "0" {
            displayLabel.text! = "0"
        }
    }
    
    
    // decimal number buttons
    @IBAction func zeroBtnPress(_ sender: Any) {
        if !(displayLabel.text == "0") {
            displayLabel.text = displayLabel.text! + "0"
        }
    }
    
    @IBAction func oneBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "1") : (displayLabel.text = displayLabel.text! + "1")
    }
    
    @IBAction func twoBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "2") : (displayLabel.text = displayLabel.text! + "2")
    }

    @IBAction func threeBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "3") : (displayLabel.text = displayLabel.text! + "3")
    }
    
    @IBAction func fourBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "4") : (displayLabel.text = displayLabel.text! + "4")
    }
    
    @IBAction func fiveBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "5") : (displayLabel.text = displayLabel.text! + "5")
    }
    
    @IBAction func sixBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "6") : (displayLabel.text = displayLabel.text! + "6")
    }
    
    @IBAction func sevenBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "7") : (displayLabel.text = displayLabel.text! + "7")
    }
    
    @IBAction func eightBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "8") : (displayLabel.text = displayLabel.text! + "8")
    }
    
    @IBAction func nineBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "9") : (displayLabel.text = displayLabel.text! + "9")
    }
    

    // hexagonal number buttons
    @IBAction func ABtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "A") : (displayLabel.text = displayLabel.text! + "A")
    }
    
    @IBAction func BBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "B") : (displayLabel.text = displayLabel.text! + "B")
    }
    
    @IBAction func CBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "C") : (displayLabel.text = displayLabel.text! + "C")
    }
    
    @IBAction func DBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "D") : (displayLabel.text = displayLabel.text! + "D")
    }
    
    @IBAction func EBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "E") : (displayLabel.text = displayLabel.text! + "E")
    }
    
    @IBAction func FBtnPress(_ sender: Any) {
        displayLabel.text == "0" ? (displayLabel.text = "F") : (displayLabel.text = displayLabel.text! + "F")
    }
    
    
}

