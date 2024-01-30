//
//  BottomPriceAndBuyBarView.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 28/01/2024.
//

import SwiftUI

struct BottomPriceAndBuyBarView: View {
    
    let price: Double
    
    @available(iOS 15.0, *)
    var body: some View {
        
        HStack {
            
            HStack {
                VStack {
                    Text("Total Price")
                        .foregroundColor(.gray)
                    Text(price.convertToCurrency())
                        .foregroundColor(.blue)
                        .font(.system(size: 20.0, weight: .bold))
                }
                Spacer()
                Button("Buy Now") {
                    
                }
                .padding(10)
                .background(.blue)
                .font(.system(size:12.0, weight: .semibold))
                .clipShape(.capsule)
                .foregroundColor(.white)
            }
            
            
            
        }
        .padding(20.0)
        .background(Color(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, opacity: 1))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

//#Preview {
//    BottomPriceAndBuyBarView()
//}
