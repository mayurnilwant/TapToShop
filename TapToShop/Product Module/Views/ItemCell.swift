//
//  ItemCell.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 28/01/2024.
//

import Foundation
import SwiftUI


struct ItemCell: View {

    let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    
    var body: some  View {
        
        VStack (spacing: 10){
            
            HStack {
//                Image(systemName: "star.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 60.0, height: 60.0)
                
                AsyncImageView(downLoadHandler: ImageDownLoader(imageUrlString: item.image ?? ""))
                VStack (alignment: .leading, spacing: 15){
                
                Text(item.title ?? "")
                    .font(.system(size: 20.0,weight: .semibold, design: .default))
                    .foregroundStyle(Color.black)
                    .frame(maxHeight: 40.0)
                
                HStack {
                    Text(item.category ?? "")
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", item.rating?.rate ?? ""))
                }
                
                Text(item.description ?? "")
                        .frame(maxHeight: 70.0)
                HStack{
                    
                    Text(item.price?.convertToCurrency() ?? "")
                        .foregroundColor(.blue)
                        .font(.system(size: 20.0, weight: .semibold))
                        
                    Spacer()
                    Button("Buy") {
                        
                    }
                    .padding(20)
                    .background(.blue)
                    .font(.system(size: 12.0, weight: .semibold))
                    .foregroundColor(.white)
                    .clipShape(.capsule(style: .continuous))
                    
                }
            }
            
         }
            
            Rectangle()
                .frame(maxWidth:.infinity, maxHeight: 1.0)
                .background(.black)
        }
        
    }
    
}
