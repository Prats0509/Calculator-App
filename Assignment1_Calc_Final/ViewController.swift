//
//  ViewController.swift
//  Assignment1_Calc_Final
//
//  Created by Pratiksha Dutta on 2024-10-03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOperation: UILabel!

    var workings = "" {
        didSet {
            labelOperation.text = workings
        }
    }

    var numbers: [Double] = []
    var operations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }

    func clearAll(withLastResult: Bool = false) {
        if withLastResult, let result = numbers.first {
            workings = formatResult(result: result)
        } else {
            workings = "0"
        }
        numbers.removeAll()
        operations.removeAll()
    }
    

    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }

    func addToWorkings(value: String) {
        if workings == "0" && value != "." {
            workings = value
        } else {
            workings += value
        }
    }

    @IBAction func plusMinusTap(_ sender: Any) {
        if let currentNumber = Double(workings) {
            workings = formatResult(result: -currentNumber)
        }
    }

    
    

    @IBAction func decimalTap(_ sender: Any) {
        if !workings.contains(".") {
            workings += "."
        }
    }

    @IBAction func divideTap(_ sender: Any) {
        processOperation("/")
    }

    @IBAction func multiplyTap(_ sender: Any) {
        processOperation("*")
    }

    @IBAction func minusTap(_ sender: Any) {
        processOperation("-")
    }

    @IBAction func plusTap(_ sender: Any) {
        processOperation("+")
    }

    @IBAction func equalTap(_ sender: Any) {
        guard let number = Double(workings) else { return }
        numbers.append(number)
        executeOperation()
        clearAll(withLastResult: true)
    }

    func formatResult(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(result)
        }
    }

    @IBAction func zeroButtonTap(_ sender: Any) {
            addToWorkings(value: "0")
        }

        @IBAction func oneButtonTap(_ sender: Any) {
            addToWorkings(value: "1")
        }

        @IBAction func twoButtonTap(_ sender: Any) {
            addToWorkings(value: "2")
        }

        @IBAction func threeButtonTap(_ sender: Any) {
            addToWorkings(value: "3")
        }

        @IBAction func fourButtonTap(_ sender: Any) {
            addToWorkings(value: "4")
        }

        @IBAction func fiveButtonTap(_ sender: Any) {
            addToWorkings(value: "5")
        }

        @IBAction func sixButtonTap(_ sender: Any) {
            addToWorkings(value: "6")
        }

        @IBAction func sevenButtonTap(_ sender: Any) {
            addToWorkings(value: "7")
        }

        @IBAction func eightButtonTap(_ sender: Any) {
            addToWorkings(value: "8")
        }

        @IBAction func nineButtonTap(_ sender: Any) {
            addToWorkings(value: "9")
        }

    func processOperation(_ operation: String) {
        guard let number = Double(workings) else { return }
        numbers.append(number)
        operations.append(operation)
        workings = ""
    }

    func executeOperation() {
        while !operations.isEmpty {
            let operation = operations.removeFirst()
            guard numbers.count >= 2 else { return }
            let firstNumber = numbers.removeFirst()
            let secondNumber = numbers.removeFirst()

            var result: Double = 0.0

            switch operation {
            case "+":
                result = firstNumber + secondNumber
            case "-":
                result = firstNumber - secondNumber
            case "*":
                result = firstNumber * secondNumber
            case "/":
                result = firstNumber / secondNumber
            default:
                break
            }

            numbers.insert(result, at: 0)
        }
    }
}

