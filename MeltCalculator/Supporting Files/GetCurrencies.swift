//
//  GetCurrencies.swift
//  MeltCalculator
//
//  Created by HaroldDavidson on 2/16/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import Foundation
struct Currencies: Codable {
    let XPT: String
//    let XPD: Double
//    let XAU: Double
//    let XAG: Double
//    let USD: Double
//    let CAD: Double
//    let AUD: Double
//    let EUR: Double
//    let GBP: Double
}

struct Exchange: Codable {
    var license: String
    var rates: Currencies
}

// calling the api
func getCurrencyData() {
    if let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=cf2dce42fd64465ea22951e7a3593d79") {
            
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            
            if let data = data {
                let currencies = try? JSONDecoder().decode(Exchange.self, from: data)
                print(currencies)
                //print(data)
            }
        }.resume()
    }
}
