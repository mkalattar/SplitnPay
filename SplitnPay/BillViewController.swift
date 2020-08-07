//
//  BillViewController.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 7/22/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

let totalPerPersonLabel     = SPLabel(text: "Total per person")
let recalculateButton       = UIButton()
let infoView                = UIView()
let infoStackView           = UIStackView()


class BillViewController: UIViewController {
    
    
    let billPerPersonLabel      = UILabel()
    let infoForBillLabel        = UILabel()
    
    
    var people:String?
    var tip:Float?
    var bill:String?

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Configurations
        configureRecalculateButton()
        configureInfoView()
        configureStackView()
        configureBillForPerson()
        configureInfoForBillLabel()
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
    }
    
    func configureInfoForBillLabel() {
        view.addSubview(infoForBillLabel)
        
        
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

    
    func configureBillForPerson() {
        
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
    
    func tipStringed(tip: Float) -> String {
        switch tip {
        case 0:
            return "0%"
        case 0.10:
            return "10%"
        default:
            return "20%"
        }
    }
    
    
}
