//
//  Utility.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 28/01/2024.
//

import Foundation


@propertyWrapper
struct Rate {
    var wrappedValue: Double {
        didSet {
            
            wrappedValue = wrappedValue.roundTo(places: 1)
        }
    }
    init(wrappedValue: Double) {
        self.wrappedValue = wrappedValue
    }
    
}


extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


extension Double {
    
    func convertToCurrency() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return currencyFormatter.string(from: self as NSNumber) ?? ""
        
    }
}
