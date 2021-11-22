//
//  ViewController.swift
//  Calculator
//
//  Created by Mariam Latsabidze on 16.11.21.
//

import UIKit
import AVFoundation

public func Rounding (targetView: UIView) {
        targetView.layer.borderWidth = 0
        targetView.layer.masksToBounds = false
        targetView.layer.borderColor = UIColor.clear.cgColor
        targetView.layer.cornerRadius = 45
        targetView.clipsToBounds = true}


class ViewController: UIViewController {

    var audioPlayer : AVAudioPlayer?

    
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var Btn9: UIButton!
    @IBOutlet weak var Btn8: UIButton!
    @IBOutlet weak var Btn7: UIButton!
    @IBOutlet weak var Btn6: UIButton!
    @IBOutlet weak var Btn5: UIButton!
    @IBOutlet weak var Btn4: UIButton!
    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn0: UIButton!
    @IBOutlet weak var commaBtn: UIButton!
    @IBOutlet weak var resultBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var multiplicationBtn: UIButton!
    @IBOutlet weak var divideBtn: UIButton!
    @IBOutlet weak var percentBtn: UIButton!
    @IBOutlet weak var negativeBtn: UIButton!
    @IBOutlet weak var acBtn: UIButton!
    

    var numberCalculating : Double = 0
    var previousNumber : Double = 0
    var operation = 0
    var calculating = false
    var count = 0
//    var doubling = false
    let formatter = NumberFormatter()

    
    @IBAction func NumbersClick(_ sender: UIButton) {
        let formatter = NumberFormatter()
   //     let maybeNumber = formatter.numberFromString(label)
        if (Result.text == "0")
        {
            Result.text?.remove(at: Result.text!.startIndex)
        }
        if calculating == true {
            Result.text = String(sender.tag-1)
            numberCalculating = Result.text!.doubleValue
            calculating = false
        } else {
            Result.text = Result.text! + String(sender.tag-1)
            numberCalculating = Result.text!.doubleValue
        }
    }
    
    
    @IBAction func CalculatingButtons(_ sender: UIButton) {
        
        let pathToSound = Bundle.main.path(forResource: "resultSound", ofType: "mp3") ?? ""
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch {
            
        }
        
        if Result.text != "" && sender.tag != 11 && sender.tag != 19 && sender.tag != 17 && sender.tag != 18 && sender.tag != 16  {
            previousNumber = Result.text!.doubleValue
            operation = sender.tag
            calculating = true
        }
        else if sender.tag == 17 {
            numberCalculating = Double(Result.text!)!
            if (numberCalculating) == Double(Int((numberCalculating))) {
                Result.text = String(Int((numberCalculating * -1)))
           } else {
                    Result.text = String(numberCalculating * -1).replacingOccurrences(of: ".", with: ",")
            }
        }
        else if sender.tag == 18 {
            Result.text = String(numberCalculating * 0.01).replacingOccurrences(of: ".", with: ",")
        }
        else if sender.tag == 19 {
            Result.text = String(Int(numberCalculating)) + ","
        }
         else if sender.tag == 16 {
             
             let pathToSound = Bundle.main.path(forResource: "calculationSound", ofType: "mp3") ?? ""
             let url = URL(fileURLWithPath: pathToSound)
             do {
                 audioPlayer = try AVAudioPlayer(contentsOf: url)
                 audioPlayer?.play()
             }
             catch {
                 }
              
             if operation == 12 {
                 if (previousNumber / numberCalculating) == Double(Int((previousNumber / numberCalculating))) {
                     Result.text = String(Int((previousNumber / numberCalculating)))
                } else {
                         Result.text = String(previousNumber / numberCalculating).replacingOccurrences(of: ".", with: ",")
                 }
             }
             else if operation == 13 {
                 if (previousNumber * numberCalculating) == Double(Int((previousNumber * numberCalculating))) {
                     Result.text = String(Int((previousNumber * numberCalculating)))
                } else {
                         Result.text = String(previousNumber * numberCalculating).replacingOccurrences(of: ".", with: ",")
                 }
             }
             else if operation == 14 {
                 if (previousNumber - numberCalculating) == Double(Int((previousNumber - numberCalculating))) {
                     Result.text = String(Int((previousNumber - numberCalculating)))
                } else {
                         Result.text = String(previousNumber - numberCalculating).replacingOccurrences(of: ".", with: ",")
                 }
             }
             else if operation == 15 {
                 if (previousNumber + numberCalculating) == Double(Int((previousNumber + numberCalculating))) {
                     Result.text = String(Int((previousNumber + numberCalculating)))
                } else {
                         Result.text = String(previousNumber + numberCalculating).replacingOccurrences(of: ".", with: ",")
                 }
             }
        }
        
        else if sender.tag == 11 {
            Result.text = "0"
            numberCalculating = 0
            previousNumber = 0
            operation = 0
        }
        
    }
    
    override func viewDidLoad() {
        Rounding(targetView: Btn0)
        Rounding(targetView: Btn1)
        Rounding(targetView: Btn2)
        Rounding(targetView: Btn3)
        Rounding(targetView: Btn4)
        Rounding(targetView: Btn5)
        Rounding(targetView: Btn6)
        Rounding(targetView: Btn7)
        Rounding(targetView: Btn8)
        Rounding(targetView: Btn9)
        Rounding(targetView: commaBtn)
        Rounding(targetView: resultBtn)
        Rounding(targetView: plusBtn)
        Rounding(targetView: minusBtn)
        Rounding(targetView: multiplicationBtn)
        Rounding(targetView: divideBtn)
        Rounding(targetView: percentBtn)
        Rounding(targetView: negativeBtn)
        Rounding(targetView: acBtn)
        
    }
}

extension String {
    var doubleValue:Double {
        let nf = NumberFormatter()
        nf.decimalSeparator = "."
        if let result = nf.number(from: self) {
            return result.doubleValue
        } else {
            nf.decimalSeparator = ","
            if let result = nf.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}
