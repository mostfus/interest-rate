//
//  ViewController.swift
//  Bank APP
//
//  Created by Александр Соколов on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var amountLabel: UILabel?
    @IBOutlet weak var monthlyPaymentLabel: UILabel?
    @IBOutlet weak var nperTextLabel: UITextField?
    @IBOutlet weak var pvTextLabel: UITextField?
    @IBOutlet weak var rateTextLabel: UITextField?
    
    
    // MARK: - Properties
    var amount = 50000.00 {
        didSet {
            updAmountLabel()
        }
    }
    
    // MARK: - Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // func which hide keyboard when I press the screen
        super.touchesBegan(touches , with: event)
        view.endEditing(true)
    }
    
    func updAmountLabel() { // update value for Balance
        /* let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        
        let number = NSNumber(value: amount)*/
        amountLabel?.text = amount.asCurrency() // add func asCurrency
    }
    
    func updMonthlyPayment () { // monthly payment calculation when value changes for sum/time/percent
        let firstValue = 0.0
        monthlyPaymentLabel?.text = "\(firstValue)"
        
        guard let nper = Double(nperTextLabel?.text ?? "") else { return }
        guard let pv = Double(pvTextLabel?.text ?? "") else { return }
        guard let rate = Double(rateTextLabel?.text ?? "") else { return }
        
        let monthlyPayment = abs(ExcelFormulas.pmt(rate: rate / 100 / 12, nper: nper, pv: pv))
        monthlyPaymentLabel?.text = monthlyPayment.asCurrency()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updAmountLabel()
        updMonthlyPayment()
    }
    
    // MARK: - Actions
    @IBAction func textFieldChange(_ sender: UITextField) {
        updMonthlyPayment ()
    }
    

}
