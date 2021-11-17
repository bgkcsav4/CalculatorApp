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


//let btnPlayer : AVAudioPlayer
//let btnURL = Bundle.main.url(forResource: "squish", withExtension: "caf")!
//btnPlayer = try! AVAudioPlayer(contentsOf: btnURL)
//btnPlayer.prepareToPlay()
//btnPlayer.play()
//super.viewDidLoad()

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
    
    @IBAction func NumbersClick(_ sender: UIButton) {
        if calculating == true {
            Result.text = String(sender.tag-1)
            numberCalculating = Double(Result.text!)!
            calculating = false
        } else {
            Result.text = Result.text! + String(sender.tag-1)
            numberCalculating = Double(Result.text!)!
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
            previousNumber = Double(Result.text!)!
            operation = sender.tag
            calculating = true
        }
        else if sender.tag == 17 {
            Result.text = String(numberCalculating * -1)
        }
        else if sender.tag == 18 {
            Result.text = String(numberCalculating * 0.01)
        }
        else if sender.tag == 19 {
            Result.text = String(Int(numberCalculating)) + "."
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
//                 if numberCalculating == 0 {
//                     Result.text = "Error"
//                 } else {
                 Result.text = String(previousNumber / numberCalculating)
                 
                 }
             else if operation == 13 {
                 Result.text = String(previousNumber * numberCalculating)
             }
             else if operation == 14 {
                 Result.text = String(previousNumber - numberCalculating)
             }
             else if operation == 15 {
                 Result.text = String(previousNumber + numberCalculating)
             }
             else if sender.tag == 17 {
                 Result.text = String(previousNumber * -1)
             }
        }
        
        else if sender.tag == 11 {
            Result.text = ""
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

