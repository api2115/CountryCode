//
//  ViewController.swift
//  CountryCode
//
//  Created by Adam Pilarski on 08/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let countryCodeLabel = CountryCodeLabel()
    let button = NextViewButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        setUpView()
        
        self.button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
    }
    
    func setUpView(){
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(countryCodeLabel)
        countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 20),
            
            countryCodeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            countryCodeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20),
            countryCodeLabel.widthAnchor.constraint(equalToConstant: 100),
            countryCodeLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        
    }
    
    @objc func didTap(){
        let vc = TableViewController()
        vc.dataClosure = { data in
            self.countryCodeLabel.text = data
         }
        self.present(vc, animated: true, completion: nil)
        
        
    }


}

