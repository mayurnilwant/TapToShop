//
//  ContentView.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 25/01/2024.
//

import SwiftUI

struct ItemList: View {
    
    @ObservedObject  var _viewModel: ItemViewModel
    
    
    init(_viewModel: ItemViewModel) {
        self._viewModel = _viewModel
    }
                                                  
    var body: some View {
        
        Group {
                
                if (_viewModel.viewModelStatus == .success) {
                    
                    Section {
                        List(_viewModel.items, id: \.id)  { item in
                            
                            ItemCell(item: item)
                        
                        }
                    }
                                    
                }else {
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("loading items!")
                    }
            
            }
        }.padding()
        .onAppear(perform: {
            _viewModel.getItems()
        })
        
    }
        
}

//#Preview {
//    ItemList()
//}
