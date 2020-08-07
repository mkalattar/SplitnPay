//
//  SPLabel.swift
//  SplitnPay
//
//  Created by Mohamed Attar on 8/6/20.
//  Copyright © 2020 Mohamed Attar. All rights reserved.
//

import UIKit

class SPLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    private func configure() {
        font       = UIFont.preferredFont(forTextStyle: .title1)
        textColor  = .systemGray
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
