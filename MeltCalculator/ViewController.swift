//
//  ViewController.swift
//  MeltCalculator
//
//  Created by HaroldDavidson on 2/16/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
        label.text = "Select Metal"
        label.textAlignment = .center
        return label
    }()
    

    let platinumButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PLATINUM", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(platinumTapped), for: .touchUpInside)
        
        return button
    }()
    
    let palladiumButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PALLADIUM", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(palladiumTapped), for: .touchUpInside)
        
        return button
    }()
    
    let silverButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SILVER", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(silverTapped), for: .touchUpInside)
        
        return button
    }()
    
    let goldButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GOLD", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(goldTapped), for: .touchUpInside)
        
        return button
    }()
    
    let cryptosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CRYPTOS", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(cryptosTapped), for: .touchUpInside)
        
        return button
    }()

    let currencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CURRENCY", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(currencyTapped), for: .touchUpInside)
        
        return button
    }()

    // TODO: Matthew, you'll want to uncomment this out and look for @objc func reviewTapped. Once this app is in the App Store, you'll want to grab that link and replace my placeholder link to Google. During resubmission to the App Store you'll need to check the box that the app will go to the internet (there's a checkbox somewhere during the submission process).
//    let reviewButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("REVIEW", for: .normal)
//        button.backgroundColor = UIColor.rgb(red: 1, green: 255, blue: 255, alpha: 1)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 5
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(reviewTapped), for: .touchUpInside)
//
//        return button
//    }()
    
    let bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 0, green: 0, blue: 255, alpha: 1)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        titleLabel.anchor(top: superView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        setupStackViewButtons()
        
        view.addSubview(bannerView)
        bannerView.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: 0, width: 281, height: 50)
        bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // TODO: Matthew, you'll need to re-add the reviewButton to the end of the array for the arrangedSubviews.
    fileprivate func setupStackViewButtons() {
        let stackView = UIStackView(arrangedSubviews: [platinumButton, palladiumButton, silverButton, goldButton, cryptosButton, currencyButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        var stackViewHeight: CGFloat = 400
        let screenHeight = UIScreen.main.bounds.size.height
        // if iPhone SE
        if(screenHeight < 569) {
            stackViewHeight = 350
        }
        stackView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackViewHeight)
    }
    
    @objc func platinumTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "UnitSelectionViewController") as! UnitSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.currency = .platinum
    }
    
    @objc func palladiumTapped() {
        // perform segue to platinumVC
        let vc = self.storyboard?.instantiateViewController(identifier: "UnitSelectionViewController") as! UnitSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.currency = .palladium
    }
    
    @objc func silverTapped() {
        // perform segue to platinumVC
        let vc = self.storyboard?.instantiateViewController(identifier: "UnitSelectionViewController") as! UnitSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.currency = .silver
    }
    
    @objc func goldTapped() {
        // perform segue to platinumVC
        let vc = self.storyboard?.instantiateViewController(identifier: "UnitSelectionViewController") as! UnitSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.currency = .gold
    }
    
    @objc func cryptosTapped() {
        // perform segue to platinumVC
        let vc = self.storyboard?.instantiateViewController(identifier: "UnitSelectionViewController") as! UnitSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.currency = .cryptos
    }
    
    @objc func currencyTapped() {
        // perform segue to platinumVC
        let vc = self.storyboard?.instantiateViewController(identifier: "UnitSelectionViewController") as! UnitSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.currency = .currency
    }
    
    @objc func reviewTapped() {
        let url = NSURL(string: "https://www.google.com")
        UIApplication.shared.open(url! as URL)
    }
}
