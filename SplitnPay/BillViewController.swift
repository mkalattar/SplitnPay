//
//  BillViewController.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 7/22/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit


let totalPerPersonLabel     = UILabel()
let billPerPersonLabel      = UILabel()
let infoForBillLabel        = UILabel()
let recalculateButton       = UIButton()
let infoView                = UIView()
let infoStackView           = UIStackView()


class BillViewController: UIViewController {
    
    var people:Int?
    var tip:String?
    var bill:Float?

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Configurations
        configureRecalculateButton()
        configureInfoView()
        configureStackView()
        configureTotalPerPersonLabel()
        configureBillForPerson()
        configureInfoForBillLabel()
        
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
    }
    
    func configureInfoForBillLabel() {
        view.addSubview(infoForBillLabel)
        
        infoForBillLabel.text           = "Split between \(people!) people with \n\(tip!) tip."
        infoForBillLabel.font           = .systemFont(ofSize: 25)
        infoForBillLabel.textColor      = .systemGray
        infoForBillLabel.numberOfLines  = 0
        infoForBillLabel.textAlignment  = .center
        
        //Constraints
        infoForBillLabel.translatesAutoresizingMaskIntoConstraints                                                              = false
        infoForBillLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 30).isActive                            = true
        infoForBillLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                         = true
        
    }
    
    func configureInfoView() {
        view.addSubview(infoView)
        
        //Constraints
        infoView.translatesAutoresizingMaskIntoConstraints                         = false
        infoView.heightAnchor.constraint(equalToConstant: 300).isActive            = true
        infoView.topAnchor.constraint(equalTo: view.topAnchor).isActive            = true
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive    = true
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive  = true
    }
    
    
    func configureTotalPerPersonLabel() {
        totalPerPersonLabel.text        = "Total Per Person"
        totalPerPersonLabel.font        = .systemFont(ofSize: 30)
        totalPerPersonLabel.textColor   = .systemGray
    }
    
    func configureBillForPerson() {
        billPerPersonLabel.text         = "$\(String(format: "%0.1f", bill!))"
        billPerPersonLabel.font         = .systemFont(ofSize: 50, weight: .bold)
        billPerPersonLabel.textColor    = .systemGreen
    }
    
    
    func configureStackView(){
        // Adding to View
        infoView.addSubview(infoStackView)
        
        // Constraints
        infoStackView.translatesAutoresizingMaskIntoConstraints                            = false
        infoStackView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive   = true
        infoStackView.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive   = true
        
        // Setting up StackView
        infoStackView.axis      = .vertical
        infoStackView.spacing   = 20
        infoStackView.alignment = .center
        
        //Adding to StackView
        infoStackView.addArrangedSubview(totalPerPersonLabel)
        infoStackView.addArrangedSubview(billPerPersonLabel)
    }
    
    func configureRecalculateButton() {
        view.addSubview(recalculateButton)
        
        // Constraints
        recalculateButton.translatesAutoresizingMaskIntoConstraints                             = false
        recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive        = true
        recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive          = true
        recalculateButton.heightAnchor.constraint(equalToConstant: 100).isActive                = true
        recalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive        = true
        recalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive      = true
        
        //  Button UI
        recalculateButton.setTitle("Recalculate", for: .normal)
        recalculateButton.backgroundColor  = .systemGreen
        recalculateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    @objc func recalculateButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    
}