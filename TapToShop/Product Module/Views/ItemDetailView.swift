//
//  ItemDetailView.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 28/01/2024.
//

import SwiftUI

struct ItemDetailView: View {
    
    let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    var totalReviews: String {
        
        let ratingString = "\(item.rating?.count ?? 0) Reviews"
        return (ratingString)
        
    }
    
    var body: some View {
        
        AsyncImageView(downLoadHandler: ImageDownLoader(imageUrlString: item.image ?? ""))
            .frame(width: 150.0, height: 300.0)
            .aspectRatio(contentMode: .fill)
        VStack(alignment: .leading,spacing: 20.0) {
            Text(item.title ?? "")
                .font(.system(size: 18.0, weight: .semibold))
                .foregroundColor(Color.black)
                .padding([.leading,.trailing],20)
                .frame(alignment: .leading)
            Text(item.description ?? "")
                .font(.system(size: 16.0, weight:.light))
                .foregroundColor(Color.black)
                .padding([.leading,.trailing],20)
                .frame(alignment: .leading)
        }
        
        HStack {
            
        HStack {
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width:25.0, height: 25.0)
                .foregroundColor(.yellow)
            Text(String(format: "%.1f Ratings", item.rating?.rate ?? ""))
                .foregroundColor(Color.gray)
            Spacer()
        }
        HStack {
            Circle()
                .frame(width: 10, height: 10)
                .background(Color.gray)
            Text(totalReviews)
                .foregroundColor(.gray)
        }

    }
        .padding(20.0)
        Spacer()

        BottomPriceAndBuyBarView(price: item.price ?? 0)
            .padding([.leading, .trailing], 10.0)
         Spacer()
            
            .frame(maxWidth: .infinity, maxHeight: 20.0)
            
    }
}
//
//#Preview {
//    
//    let itemDetail = Item()
//    ItemDetailView(item: itemDetail)
//    
//}
