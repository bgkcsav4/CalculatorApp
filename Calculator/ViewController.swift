//
//  ViewController.swift
//  Calculator
//
//  Created by Mariam Latsabidze on 16.11.21.
//

import UIKit
import AVFoundation
import Dispatch

//                      ????????????????????????
//DispatchQueue.global(qos: .userInitiated).async {
//    let pathToSound = Bundle.main.path(forResource: "resultSound", ofType: "mp3") ?? ""
//    let url = URL(fileURLWithPath: pathToSound)
//
//    DispatchQueue.main.async {
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//        }
//        catch {
//
//        }
//    }
//}

class ViewController: UIViewController {

//    var audioPlayer : AVAudioPlayer?
        
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
    let formatter = NumberFormatter()

    
    @IBAction func NumbersClick(_ sender: UIButton) {
       
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
        
//        let pathToSound = Bundle.main.path(forResource: "resultSound", ofType: "mp3") ?? ""
//        let url = URL(fileURLWithPath: pathToSound)
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//        }
//        catch {
//
//        }
        
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
             
//             let pathToSound = Bundle.main.path(forResource: "calculationSound", ofType: "mp3") ?? ""
//             let url = URL(fileURLWithPath: pathToSound)
//             do {
//                 audioPlayer = try AVAudioPlayer(contentsOf: url)
//                 audioPlayer?.play()
//             }
//             catch {
//                 }
              
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


@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
