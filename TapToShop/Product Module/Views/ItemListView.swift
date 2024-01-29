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
        
        NavigationView {
            
            Group {
                
                if (_viewModel.viewModelStatus == .success) {
                    
                    Section {
                        List(_viewModel.items, id: \.id)  { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                ItemCell(item: item)
                            }
                        }
                    }
                    
                }else {
                    VStack {
                        Text("loading products!")
                    }
                    
                }
            }.padding()
                .onAppear(perform: {
                    _viewModel.getItems()
                })
            
            
                .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.large)

        }
            }
    
        
}

//#Preview {
//    ItemList()
//}
