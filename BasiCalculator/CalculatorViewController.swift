//
//  ViewController.swift
//  BasiCalculator
//
//  Created by Diplomado on 19/10/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var customView: CalculatorView {
        return view as! CalculatorView
    }
    
    override func loadView() {
        view = CalculatorView()
    }
    
    var firstNumber: Float = 0
    var secondNumber: Float = 0
    var currentOperation: Operations = .none
    
    enum Operations {
        case add, subtract, multiply, divide, none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.backgroundColor = .systemBackground
        customView.buttonsNumbersAndSymbols[0].addAction(UIAction(handler: resetDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[1].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[2].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[3].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[4].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[5].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[6].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[7].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[8].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[9].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[10].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[11].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[12].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[13].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[14].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[15].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[16].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[17].addTarget(self, action: #selector(updateDisplay(_:)), for: .touchUpInside)
        customView.buttonsNumbersAndSymbols[18].addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
    }
    
    @objc func updateDisplay(_ sender: UIButton){
        if customView.labelResult.text! == "0"{
            customView.labelResult.text! = sender.titleLabel!.text!
        }else{
            customView.labelResult.text! += sender.titleLabel!.text!
        }
    }
    
    private func resetDisplay(_ sender: UIAction){
        customView.labelResult.text = "0"
        firstNumber = 0
        secondNumber = 0
        currentOperation = .none
    }
    
    @objc func doOperation(_ sender: UIButton){
        switch sender.titleLabel!.text!{
        case "/":
            firstNumber = Float(customView.labelResult.text!) ?? 0
            currentOperation = .divide
        case "%":
            break
        case "x":
            firstNumber = Float(customView.labelResult.text!) ?? 0
            currentOperation = .multiply
        case "-":
            firstNumber = Float(customView.labelResult.text!) ?? 0
            currentOperation = .subtract
        case "+":
            firstNumber = Float(customView.labelResult.text!)!
            currentOperation = .add
        case "+/-":
            break
        default:
            secondNumber = Float(customView.labelResult.text!) ?? 0
            switch currentOperation {
            case .add:
                customView.labelResult.text = isDecimalOrInt(this: (firstNumber + secondNumber))
            case .subtract:
                customView.labelResult.text = isDecimalOrInt(this: (firstNumber - secondNumber))
            case .multiply:
                customView.labelResult.text = isDecimalOrInt(this: (firstNumber * secondNumber))
            case .divide:
                customView.labelResult.text = isDecimalOrInt(this: (firstNumber / secondNumber))
            case .none:
                break
            }
        }
        
        if sender.titleLabel!.text! != "="{
            customView.labelResult.text = ""
        }
        
    }
    
    private func isDecimalOrInt(this number: Float) -> String{
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(number))"
        } else {
            return "\(number)"
        }
    }
}



