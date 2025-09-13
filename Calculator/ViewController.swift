//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    private var isFinishTypingNumber: Bool = true

    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {

        //What should happen when a non-number button is pressed
        isFinishTypingNumber = true

 

        if let calMethod = sender.currentTitle {
            if calMethod == "+/-" {
                displayValue *= displayValue * -1
            } else if calMethod == "AC" {
                displayValue = 0
            } else if calMethod == "%" {
                displayValue *= 0.01
            }
        }

    }

    @IBAction func numButtonPressed(_ sender: UIButton) {

        //What should happen when a number is entered into the keypad

        if let numValue = sender.currentTitle {

            if isFinishTypingNumber {

                if numValue == "." && displayLabel.text == "0" {
                    displayLabel.text = displayLabel.text! + numValue
                    isFinishTypingNumber = false
                    return
                }

                displayLabel.text = numValue
                isFinishTypingNumber = false
            } else {

                if displayLabel.text!.contains(".") && numValue == "." {
                    return
                }

                if numValue == "." {
                    let isInt =
                        floor(Double(displayValue))
                        == displayValue

                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue

            }
        }

    }

}
