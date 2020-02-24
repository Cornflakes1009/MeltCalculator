//
//  UnitSelectionViewController.swift
//  MeltCalculator
//
//  Created by HaroldDavidson on 2/20/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class UnitSelectionViewController: UIViewController {

    // initializing to gold as a default value
    var currency: Currency = .gold
    
    @IBOutlet var superView: UIView!
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Melt Calculator"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.backgroundColor = UIColor.rgb(red: 63, green: 81, blue: 181, alpha: 1)
        return label
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        //label.text = "Select Type"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        view.addSubview(instructionLabel)
        instructionLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        switch currency {
        case .platinum:
            instructionLabel.text = "Select Type of Platinum"
            setupPlatinumStackViewButtons(view: view, label: instructionLabel)
            break
        case .palladium:
            instructionLabel.text = "Select Type of Palladim"
            setupPalladiumStackViewButtons(view: view, label: instructionLabel)
            break
        case .silver:
            instructionLabel.text = "Select Type of Silver"
            setupSilverStackViewButtons(view: view, label: instructionLabel)
            break
        case .gold:
            instructionLabel.text = "Select Type of Gold"
            setupGoldStackViewButtons(view: view, label: instructionLabel)
            break
        default:
            // returning back to main screen in event of mistakenly getting to this VC without setting a currency
            self.navigationController?.popViewController(animated: true)
            break
        }
    }
    
    // MARK: Platinum
    func setupPlatinumStackViewButtons(view: UIView, label: UILabel) {
        
        let troyOuncesButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("TROY OUNCES", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            button.addTarget(self, action: #selector(platinumTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let pennyweightButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("PENNYWEIGHT", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let gramsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAM", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let grainsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let stackView = UIStackView(arrangedSubviews: [troyOuncesButton, pennyweightButton, gramsButton, grainsButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        var stackViewHeight: CGFloat = 225
        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            stackViewHeight = 197
        }
        stackView.anchor(top: label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackViewHeight)
    }

    @objc func platinumTroyOuncesTapped() {
        print("platinum troy tapped")
    }
    
    // MARK: Palladium
    func setupPalladiumStackViewButtons(view: UIView, label: UILabel) {
        
        let troyOuncesButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("TROY OUNCES", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            button.addTarget(self, action: #selector(palladiumTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let pennyweightButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("PENNYWEIGHT", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let gramsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAM", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let grainsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let stackView = UIStackView(arrangedSubviews: [troyOuncesButton, pennyweightButton, gramsButton, grainsButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        var stackViewHeight: CGFloat = 225
        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            stackViewHeight = 197
        }
        stackView.anchor(top: label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackViewHeight)
    }

    @objc func palladiumTroyOuncesTapped() {
        print("palladium troy tapped")
    }
    
    // MARK: Silver
    func setupSilverStackViewButtons(view: UIView, label: UILabel) {
        
        let usCoinsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("US COINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            //button.addTarget(self, action: #selector(platinumTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let worldCoinsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("WORLD COINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            //button.addTarget(self, action: #selector(platinumTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let troyOuncesButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("TROY OUNCES", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            button.addTarget(self, action: #selector(silverTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let pennyweightButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("PENNYWEIGHT", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let gramsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAM", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let grainsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let stackView = UIStackView(arrangedSubviews: [usCoinsButton, worldCoinsButton,troyOuncesButton, pennyweightButton, gramsButton, grainsButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        var stackViewHeight: CGFloat = 338
        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            stackViewHeight = 296
        }
        stackView.anchor(top: label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackViewHeight)
    }

    @objc func silverTroyOuncesTapped() {
        print("silver tapped")
    }
    
    // MARK: Gold
    func setupGoldStackViewButtons(view: UIView, label: UILabel) {
        
        let usCoinsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("US COINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            //button.addTarget(self, action: #selector(platinumTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let worldCoinsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("WORLD COINS", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            //button.addTarget(self, action: #selector(platinumTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let troyOuncesButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("TROY OUNCES", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            button.addTarget(self, action: #selector(silverTroyOuncesTapped), for: .touchUpInside)
            return button
        }()
        
        let pennyweightButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("PENNYWEIGHT", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let gramsButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("GRAM", for: .normal)
            button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        let stackView = UIStackView(arrangedSubviews: [usCoinsButton, worldCoinsButton,troyOuncesButton, pennyweightButton, gramsButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        var stackViewHeight: CGFloat = 338
        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            stackViewHeight = 296
        }
        stackView.anchor(top: label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackViewHeight)
    }

    @objc func goldTroyOuncesTapped() {
        print("gold tapped")
    }
}
