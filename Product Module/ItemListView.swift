//
//  ContentView.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 25/01/2024.
//

import SwiftUI

struct ItemList: View {
    
    @ObservedObject  var _viewModel: ItemViewModel = ItemViewModel(service: ItemListservice(withEndPoint: ClothsResource(httpOperationType: .getAll), andHeader: [:]))
    
                                                  
    var body: some View {
        
        Group {
            
            
            if (_viewModel.viewModelStatus == .success) {
            
                List(_viewModel.items, id: \.id) { item in
                    Text(item.title ?? "")
                }
            
            }else {
                            VStack {
                                Image(systemName: "globe")
                                    .imageScale(.large)
                                    .foregroundStyle(.tint)
                                Text("Hello, world!")
                            }
                
            }
            
            
            
        }.padding()
        .onAppear(perform: {
            _viewModel.getItems()
        })
        
    }
        
}

#Preview {
    ItemList()
}
