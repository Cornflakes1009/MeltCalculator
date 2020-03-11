//
//  CalculationViewController.swift
//  MeltCalculator
//
//  Created by HaroldDavidson on 2/19/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
    var currency: Currency = .gold
    //var currencyType = ""
    var selectedCurrency = ""
    var pickerViewItems = [String]()
    var spotPercentage: Double = 100
    
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
    
    // PICKER VIEW TEXT FIELD
    let pickerViewTextField: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.font = UIFont.boldSystemFont(ofSize: 25)
        tf.layer.cornerRadius = 5
        tf.textColor = .black
        tf.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232, alpha: 1)
        tf.placeholder = "Picker View"
        return tf
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    let bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 0, green: 0, blue: 255, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        view.addSubview(instructionLabel)
        instructionLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        view.addSubview(pickerViewTextField)
        pickerViewTextField.anchor(top: instructionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
        
        view.addSubview(bannerView)
        bannerView.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: 0, width: 281, height: 50)
        bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        view.addSubview(calculateButton)
//        calculateButton.anchor(top: bannerView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 40, paddingBottom: 40, paddingRight: 40, width: 0, height: 100)
        
        
        
        switch currency {
        case .platinum:
            instructionLabel.text = "Select Type of Platinum"
            
            break
        case .palladium:
            instructionLabel.text = "Select Type of Palladim"
            
            break
        case .silver:
            instructionLabel.text = "Select Type of Silver"
            break
        case .gold:
            instructionLabel.text = "Select Type of Gold"
            break
        case .cryptos:
            instructionLabel.text = "Select Type of Crypto"
            setupCryptosStackViewButtons(view: view, textField: pickerViewTextField)
            break
        case .currency:
            instructionLabel.text = "Select Type of Currency"
            break
        } // end of switch
        
        createPickerView()
        createPickerViewToolbar()
    } // end of ViewDidLoad
    
    // MARK: Creating PickerView
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerViewTextField.inputView = pickerView
    }
    
    func createPickerViewToolbar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPickerView))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        pickerViewTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissPickerView() {
        view.endEditing(true)
    }
    
    // MARK: Cryptos
    func setupCryptosStackViewButtons(view: UIView, textField: UITextField) {
        
        pickerViewItems = ["BitCoin", "Ethereum", "LiteCoin"]
        
        let quantityTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Enter Quantity"
            tf.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232, alpha: 1)
            tf.layer.cornerRadius = 5
            tf.textAlignment = .center
            tf.font = UIFont.boldSystemFont(ofSize: 25)
            return tf
        }()
        
        let spotTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Enter Percent of Spot"
            tf.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232, alpha: 1)
            tf.layer.cornerRadius = 5
            tf.textAlignment = .center
            tf.font = UIFont.boldSystemFont(ofSize: 25)
            return tf
        }()
        
        let stackView = UIStackView(arrangedSubviews: [quantityTextField, spotTextField])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        var stackViewHeight: CGFloat = 167
        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            stackViewHeight = 147
        }
        stackView.anchor(top: textField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackViewHeight)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
} // end of CalculationViewController
extension CalculationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = pickerViewItems[row]
        pickerViewTextField.text = selectedCurrency
    }
}
