//
//  CalculateViewController.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 7/22/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//
import UIKit

let billVC              = BillViewController()
let calculateButton     = UIButton()
let stackView           = UIStackView()
let enterBillTotalLabel = UILabel()
let billTotalTextField  = UITextField()

// StepperView elements
let stepperView         = UIView()
let selectTipLabel      = UILabel()
let zeroTipButton       = UIButton()
let tenTipButton        = UIButton()
let twntyTipButton      = UIButton()
let chooseSplitLabel    = UILabel()
let stepperValueLabel   = UILabel()
let stepper             = UIStepper()
let buttonsStackView    = UIStackView()
let bigStackView        = UIStackView()
let stepperStackview    = UIStackView()


class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    let tag0 = 0
    let tag1 = 1
    let tag2 = 2
    var tip:Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        billTotalTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
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
        stepper.translatesAutoresizingMaskIntoConstraints                                           = false
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
        chooseSplitLabel.font       = UIFont.systemFont(ofSize: 25)
        chooseSplitLabel.text       = "Choose Split"
        chooseSplitLabel.textColor  = .systemGray
        
        // Constraints
        chooseSplitLabel.translatesAutoresizingMaskIntoConstraints                                              = false
        chooseSplitLabel.leadingAnchor.constraint(equalTo: bigStackView.leadingAnchor, constant: 30).isActive   = true
        chooseSplitLabel.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: 30).isActive = true
    }
    
    
    func configureEnterBillTotalLabel() {
        view.addSubview(enterBillTotalLabel)
        enterBillTotalLabel.text      = "Enter Bill Total"
        enterBillTotalLabel.font      = UIFont.systemFont(ofSize: 25)
        enterBillTotalLabel.textColor = .systemGray
        
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
        selectTipLabel.text         = "Select Tip"
        selectTipLabel.font         = UIFont.systemFont(ofSize: 25)
        selectTipLabel.textColor    = .systemGray
        
        // Constraints
        selectTipLabel.translatesAutoresizingMaskIntoConstraints                                                = false
        selectTipLabel.leadingAnchor.constraint(equalTo: bigStackView.leadingAnchor, constant: 30).isActive     = true
        selectTipLabel.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: -30).isActive  = true
        
    }
    
    func configureZeroTipButton() {
        stepperView.addSubview(zeroTipButton)
        zeroTipButton.setTitleColor(.systemGreen, for: .normal)
        zeroTipButton.titleLabel?.font  = UIFont.systemFont(ofSize: 35)
        zeroTipButton.setTitle("0%", for: .normal)
        zeroTipButton.tag = tag0
        zeroTipButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // Constraints
        zeroTipButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTenTipButton() {
        stepperView.addSubview(tenTipButton)
        tenTipButton.setTitleColor(.systemGreen, for: .normal)
        tenTipButton.titleLabel?.font   = UIFont.systemFont(ofSize: 35)
        tenTipButton.setTitle("10%", for: .normal)
        tenTipButton.tag = tag1
        tenTipButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // Constraints
        tenTipButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTwntyTipButton() {
        stepperView.addSubview(twntyTipButton)
        twntyTipButton.setTitleColor(.systemGreen, for: .normal)
        twntyTipButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        twntyTipButton.setTitle("20%", for: .normal)
        twntyTipButton.tag = tag2
        twntyTipButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // Constraints
        twntyTipButton.translatesAutoresizingMaskIntoConstraints = false
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
        
        // Constraints
        calculateButton.translatesAutoresizingMaskIntoConstraints                         = false
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive    = true
        calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive      = true
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive    = true
        calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive  = true
        calculateButton.heightAnchor.constraint(equalToConstant: 100).isActive            = true
        
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.backgroundColor  = .systemGreen
        calculateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    @objc func calculateButtonPressed() {
        billVC.people   = stepperValueLabel.text!
        billVC.bill     = billTotalTextField.text!
        billVC.tip      = tip
        
        present(billVC, animated: true, completion: nil)
        
        zeroTipButton.isSelected  = false
        zeroTipButton.backgroundColor = .systemBackground
        zeroTipButton.setTitleColor(.systemGreen, for: .normal)
        
        tenTipButton.isSelected   = false
        tenTipButton.backgroundColor = .systemBackground
        tenTipButton.setTitleColor(.systemGreen, for: .normal)
        
        twntyTipButton.isSelected = false
        twntyTipButton.backgroundColor = .systemBackground
        twntyTipButton.setTitleColor(.systemGreen, for: .normal)
        
        billTotalTextField.text = nil
        
        stepperValueLabel.text = "2"
    }
    
    @objc func buttonPressed(button: UIButton) {
        switch button.tag {
        case tag0:
            buttonSelected(button: button)
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
