//
//  CountryCodeLabel.swift
//  CountryCode
//
//  Created by Adam Pilarski on 08/05/2023.
//

import UIKit

class CountryCodeLabel: UILabel {

    init() {
        super.init(frame: .zero)
        self.text = "+1"
        self.font = UIFont.systemFont(ofSize: 16)
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
