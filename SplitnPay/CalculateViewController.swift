//
//  CalculateViewController.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 7/22/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//
import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    

    let billVC              = BillViewController()
    let calculateButton     = SPButton(buttonLabel: "Calculate")
    let stackView           = UIStackView()
    let enterBillTotalLabel = SPLabel(text: "Enter Bill Total")
    let billTotalTextField  = UITextField()

    // StepperView elements
    let stepperView         = UIView()
    let selectTipLabel      = SPLabel(text: "Select Tip")
    
    let zeroTipButton       = SPTipButton(buttonLabel: "0%")
    let tenTipButton        = SPTipButton(buttonLabel: "10%")
    let twntyTipButton      = SPTipButton(buttonLabel: "20%")
    
    let chooseSplitLabel    = SPLabel(text: "Choose Split")
    let stepperValueLabel   = UILabel()
    let stepper             = UIStepper()
    
    let buttonsStackView    = UIStackView()
    let bigStackView        = UIStackView()
    let stepperStackview    = UIStackView()

    
    let tag0        = 0
    let tag1        = 1
    let tag2        = 2
    
    var tip:Float   = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        billTotalTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        
        
        configureStackView()
        configureStepperView()
        configureCalculateButton()
    }
    
    func configureStepperView() {
        self.view.addSubview(stepperView)
        
        
        // Constraints
        stepperView.translatesAutoresizingMaskIntoConstraints                                     = false
        stepperView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40).isActive  = true
        stepperView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive                  = true
        stepperView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive                = true
        stepperView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive              = true
        
        // Creating it's elements
        configureBigStackView()
    }
    
    func buttonSelected(button: UIButton) {
        zeroTipButton.isSelected  = false
        zeroTipButton.backgroundColor = .systemBackground
        zeroTipButton.setTitleColor(.systemGreen, for: .normal)
        
        tenTipButton.isSelected   = false
        tenTipButton.backgroundColor = .systemBackground
        tenTipButton.setTitleColor(.systemGreen, for: .normal)
        
        twntyTipButton.isSelected = false
        twntyTipButton.backgroundColor = .systemBackground
        twntyTipButton.setTitleColor(.systemGreen, for: .normal)
        
        button.backgroundColor = .systemGreen
        button.setTitleColor(.systemBackground, for: .selected)
        button.isSelected = true
        button.layer.cornerRadius = 10
    }
    
    func configureStepperValueLabel() {
        stepperView.addSubview(stepperValueLabel)
        stepperValueLabel.font      = UIFont.systemFont(ofSize: 35)
        stepperValueLabel.textColor = .systemGreen
        stepperValueLabel.text      = "2"
        
        // Constraints
        stepperValueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureStepper() {
        stepperView.addSubview(stepper)
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue    = 1
        stepper.value        = 2
        stepper.autorepeat   = true
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        
        
        // Constraints
        stepper.translatesAutoresizingMaskIntoConstraints  = false
    }
    
    @objc func stepperValueChanged() {
        // Changing value
        stepperValueLabel.text  = "\(Int(stepper.value))"
    }
    
    
    func configureStepperStackView() {
        stepperView.addSubview(stepperStackview)
        stepperStackview.spacing = 27
        stepperStackview.axis = .horizontal
        
        // Constraints
        stepperStackview.translatesAutoresizingMaskIntoConstraints                                           = false
        stepperStackview.centerXAnchor.constraint(equalTo: stepperView.centerXAnchor).isActive               = true
        stepperStackview.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 10).isActive = true
        
        // Creating elements
        configureStepperValueLabel()
        configureStepper()
        
        // Adding elements
        stepperStackview.addArrangedSubview(stepperValueLabel)
        stepperStackview.addArrangedSubview(stepper)
    }
    
    
    func configureBigStackView() {
        stepperView.addSubview(bigStackView)
        bigStackView.axis       = .vertical
        bigStackView.alignment  = .center
        bigStackView.spacing    = 26
        
        // Constraints
        bigStackView.translatesAutoresizingMaskIntoConstraints                                          = false
        bigStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive       = true
        bigStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive       = true
        bigStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive     = true
        
        // Creating elements
        configureSelectTip()
        configureButtonsStackView()
        configureChooseSplitLabel()
        configureStepperStackView()
        
        // Adding elements
        bigStackView.addArrangedSubview(selectTipLabel)
        bigStackView.addArrangedSubview(buttonsStackView)
        bigStackView.addArrangedSubview(chooseSplitLabel)
        bigStackView.addArrangedSubview(stepperStackview)
        
    }
    
    func configureChooseSplitLabel() {
        stepperView.addSubview(chooseSplitLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            chooseSplitLabel.leadingAnchor.constraint(equalTo: bigStackView.leadingAnchor, constant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: 30)
        ])
    }
    
    
    func configureEnterBillTotalLabel() {
        view.addSubview(enterBillTotalLabel)
        
        // Constraints
        enterBillTotalLabel.translatesAutoresizingMaskIntoConstraints                                       = false
        enterBillTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive    = true
        enterBillTotalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    
    
    func configureBillTotalTextField() {
        view.addSubview(billTotalTextField)
        billTotalTextField.placeholder                      = "e.g. 210.50"
        billTotalTextField.keyboardType                     = .decimalPad
        billTotalTextField.textAlignment                    = .center
        billTotalTextField.font                             = UIFont.boldSystemFont(ofSize: 40)
        billTotalTextField.textColor                        = .systemGreen
        
        
        // Constraints
        billTotalTextField.translatesAutoresizingMaskIntoConstraints                        = false
        billTotalTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
        billTotalTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis      = .vertical
        stackView.spacing   = 26
        
        // Calling to create elements
        configureEnterBillTotalLabel()
        configureBillTotalTextField()
        
        // Constraints
        stackView.translatesAutoresizingMaskIntoConstraints                                                = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive                           = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive                         = true
        
        // Adding elements to stack view
        stackView.addArrangedSubview(enterBillTotalLabel)
        stackView.addArrangedSubview(billTotalTextField)
    }
    
    
    
    
    func configureSelectTip() {
        stepperView.addSubview(selectTipLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            selectTipLabel.leadingAnchor.constraint(equalTo: bigStackView.leadingAnchor, constant: 30),
            selectTipLabel.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: -30)
        ])
    }
    
    func configureZeroTipButton() {
        stepperView.addSubview(zeroTipButton)
        zeroTipButton.tag = tag0
        zeroTipButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func configureTenTipButton() {
        stepperView.addSubview(tenTipButton)
        tenTipButton.tag = tag1
        tenTipButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func configureTwntyTipButton() {
        stepperView.addSubview(twntyTipButton)
        twntyTipButton.tag = tag2
        twntyTipButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func configureButtonsStackView() {
        stepperView.addSubview(buttonsStackView)
        buttonsStackView.axis           = .horizontal
        buttonsStackView.distribution   = .fillEqually
        
        // Constraints
        buttonsStackView.translatesAutoresizingMaskIntoConstraints                                          = false
        buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive       = true
        buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive    = true
        buttonsStackView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 10).isActive  = true
        
        // Creating elements
        configureZeroTipButton()
        configureTenTipButton()
        configureTwntyTipButton()
        
        // Elements
        buttonsStackView.addArrangedSubview(zeroTipButton)
        buttonsStackView.addArrangedSubview(tenTipButton)
        buttonsStackView.addArrangedSubview(twntyTipButton)
        
        
    }
    
    
    func configureCalculateButton() {
        view.addSubview(calculateButton)
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        
        // Constraints
        NSLayoutConstraint.activate([
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
    }
    
    
    var stepperValue2 = ""
    var bill2         = ""
    var tip2:Float    = 0.0
    
    func initializeData() {
        stepperValue2 = stepperValueLabel.text!
        bill2         = billTotalTextField.text ?? "0"
        tip2          = tip
    }
    
    func calculateBill(people: Int, tip: Float, bill: String) -> Float {
        let billAfterTip    = (Float(bill)!*tip) + Float(bill)!
        let billResult      = billAfterTip / Float(people)
        return billResult
    }
    
    @objc func calculateButtonPressed() {
        
        
        
        initializeData()
        
        billVC.billPerPersonLabel.text         = "$\(String(format: "%0.1f", calculateBill(people: Int(stepperValue2)!, tip: tip2, bill: bill2)))"
        billVC.infoForBillLabel.text           = "Split between \(stepperValue2) people with \n\(billVC.tipStringed(tip: tip2)) tip."
        
        billVC.people   = stepperValue2
        billVC.bill     = bill2
        billVC.tip      = tip2
        
        present(billVC, animated: true, completion: nil)
        
        zeroTipButton.isSelected        = false
        zeroTipButton.backgroundColor   = .systemBackground
        zeroTipButton.setTitleColor(.systemGreen, for: .normal)
        
        tenTipButton.isSelected         = false
        tenTipButton.backgroundColor    = .systemBackground
        tenTipButton.setTitleColor(.systemGreen, for: .normal)
        
        twntyTipButton.isSelected       = false
        twntyTipButton.backgroundColor  = .systemBackground
        twntyTipButton.setTitleColor(.systemGreen, for: .normal)
        
        billTotalTextField.text         = nil
        stepperValueLabel.text          = "2"
    }
    
    @objc func buttonPressed(button: UIButton) {
        switch button.tag {
        case tag0:
            buttonSelected(button: button)
            tip = 0
        case tag1:
            buttonSelected(button: button)
            tip = 0.10
        default:
            buttonSelected(button: button)
            tip = 0.20
        }
        
    }
    
}


extension CalculateViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CalculateViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        stepperView.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
        stepperView.endEditing(true)
    }
}
