//
//  SPButton.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 8/6/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class SPButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(buttonLabel: String) {
        super.init(frame: .zero)
        self.setTitle(buttonLabel, for: .normal)
        configure()
    }
    
    private func configure() {
        backgroundColor  = .systemGreen
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
