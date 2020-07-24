//
//  StepperViewController.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 7/22/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//
import UIKit


let totalPerPersonLabel = UILabel()
let billPerPersonLabel = UILabel()
let infoView = UIView()
let infoStackView = UIStackView()

class BillViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureInfoView() {
        view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        infoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        infoView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0).isActive = true
        
        
    }
    
    
    func configureStackView(){
        // Adding to View
        infoView.addSubview(infoStackView)
        // Constraints
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.centerXAnchor.constraint(equalToSystemSpacingAfter: infoView.centerXAnchor, multiplier: 0).isActive = true
        infoStackView.centerYAnchor.constraint(equalToSystemSpacingBelow: infoView.centerYAnchor, multiplier: 0).isActive = true
    }
    
}
