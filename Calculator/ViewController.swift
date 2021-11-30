//
//  ViewController.swift
//  Calculator
//
//  Created by Mariam Latsabidze on 16.11.21.
//

import UIKit
import AVFoundation
import Dispatch

class ViewController: UIViewController {
    var audioPlayer : AVAudioPlayer?

    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var ACbutton: calcButton!
    @IBOutlet weak var divisionButton: calcButton!
    @IBOutlet weak var multiplyButton: calcButton!
    @IBOutlet weak var minusButton: calcButton!
    @IBOutlet weak var plusButton: calcButton!
    
    
    
    var numberCalculating : Double = 0
    var previousNumber : Double = 0
    var operation = 0
    var calculating = false
    var count = 0
    let formatter = NumberFormatter()

  
    @IBAction func NumbersClick(_ sender: UIButton) {
        
        ACbutton.titleLabel?.text = "C"

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
   //-----------------
//    button.setTitle("AC", for: .normal)
//    button.backgroundColor = UIColor.orange
//    button.setTitleColor(UIColor.gray, for: .normal)
    //---------------
    
    @IBAction func CalculatingButtons(_ sender: UIButton) {
        audioPlayer?.play()
        if sender.tag == 12 {
            divisionButton.backgroundColor = UIColor.white
            divisionButton.tintColor = .systemOrange
        }
        if sender.tag == 13 {
            multiplyButton.backgroundColor = UIColor.white
            multiplyButton.tintColor = .systemOrange
        }
        if sender.tag == 14 {
            minusButton.backgroundColor = UIColor.white
            minusButton.tintColor = .systemOrange
        }
        if sender.tag == 15 {
            plusButton.backgroundColor = UIColor.white
            plusButton.tintColor = .systemOrange
        }
        
        
        if Result.text != "" && sender.tag != 11 && sender.tag != 19 && sender.tag != 17 && sender.tag != 18 && sender.tag != 16  {
            previousNumber = Result.text!.doubleValue
            operation = sender.tag
            calculating = true
        }
        else if sender.tag == 17 {
            numberCalculating = Double(Result.text!)!
            if (numberCalculating) == Double(Int((numberCalculating))) {
                Result.text = String(Int((numberCalculating * -1)).formattedWithSeparator)
           } else {
               Result.text = String((numberCalculating * -1).formattedWithSeparator).replacingOccurrences(of: ".", with: ",")
            }
        }
        else if sender.tag == 18 {
            Result.text = String((numberCalculating * 0.01).formattedWithSeparator).replacingOccurrences(of: ".", with: ",")
        }
        else if sender.tag == 19 {
            Result.text = String(Int(numberCalculating).formattedWithSeparator) + ","
        }
         else if sender.tag == 16 {
             divisionButton.backgroundColor = UIColor.orange
             multiplyButton.backgroundColor = UIColor.orange
             minusButton.backgroundColor = UIColor.orange
             plusButton.backgroundColor = UIColor.orange
             multiplyButton.tintColor = .white
             divisionButton.tintColor = .white
             minusButton.tintColor = .white
             plusButton.tintColor = .white

             if operation == 12 {
                 
                 if (previousNumber / numberCalculating) == Double(Int((previousNumber / numberCalculating))) {
                     Result.text = String(Int((previousNumber / numberCalculating)).formattedWithSeparator)
                } else {
                    Result.text = String((previousNumber / numberCalculating).formattedWithSeparator).replacingOccurrences(of: ".", with: ",")
                 }
             }
             else if operation == 13 {
                 
                 if (previousNumber * numberCalculating) == Double(Int((previousNumber * numberCalculating))) {
                     Result.text = String(Int((previousNumber * numberCalculating)).formattedWithSeparator)
                } else {
                    Result.text = String((previousNumber * numberCalculating).formattedWithSeparator).replacingOccurrences(of: ".", with: ",")
                 }
             }
             else if operation == 14 {
                 if (previousNumber - numberCalculating) == Double(Int((previousNumber - numberCalculating))) {
                     Result.text = String(Int((previousNumber - numberCalculating)).formattedWithSeparator)
                } else {
                    Result.text = String((previousNumber - numberCalculating).formattedWithSeparator).replacingOccurrences(of: ".", with: ",")
                 }
             }
             else if operation == 15 {
                 if (previousNumber + numberCalculating) == Double(Int((previousNumber + numberCalculating))) {
                     Result.text = String(Int((previousNumber + numberCalculating)).formattedWithSeparator)
                } else {
                    Result.text = String((previousNumber + numberCalculating).formattedWithSeparator).replacingOccurrences(of: ".", with: ",")
                 }
             }
        }
        
        else if sender.tag == 11 {
            Result.text = "0"
            numberCalculating = 0
            previousNumber = 0
            operation = 0
            ACbutton.titleLabel?.text = "AC"

            divisionButton.backgroundColor = UIColor.systemOrange
            multiplyButton.backgroundColor = UIColor.systemOrange
            minusButton.backgroundColor = UIColor.systemOrange
            plusButton.backgroundColor = UIColor.systemOrange
            multiplyButton.tintColor = .white
            divisionButton.tintColor = .white
            minusButton.tintColor = .white
            plusButton.tintColor = .white
            

        }
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let pathToSound = Bundle.main.path(forResource: "calculationSound", ofType: "mp3") ?? ""
        let url = URL(fileURLWithPath: pathToSound)
              do {
                  audioPlayer = try AVAudioPlayer(contentsOf: url)
                  audioPlayer?.prepareToPlay()
              }
          catch {}
    }
}


// -------------------------------------------------------------------------------------------------
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

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
