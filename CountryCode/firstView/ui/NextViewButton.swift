//
//  NextViewButton.swift
//  CountryCode
//
//  Created by Adam Pilarski on 08/05/2023.
//

import UIKit

class NextViewButton: UIButton {

    init(){
        super.init(frame: .zero)
        self.setTitle("next", for: .normal)
        self.backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
