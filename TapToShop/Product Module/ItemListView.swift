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
                            
                            Text(item.title ?? "")
                                .padding(20.0)
                                .font(.system(size: 14.0, weight: .bold, design: .default))
                                .foregroundColor(Color.blue)
                                .cornerRadius(4.0)
                                .background{
                                    RoundedRectangle(cornerRadius: 3.0, style: .continuous)
                                        .stroke(.red, lineWidth: 1.0)
                                }
                                
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
