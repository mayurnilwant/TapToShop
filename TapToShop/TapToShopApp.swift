//
//  TapToShopApp.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 25/01/2024.
//

import SwiftUI

@main
struct TapToShopApp: App {
    var body: some Scene {
        WindowGroup {
            
          let itemListViewModel  = ItemViewModel(service: ItemListservice(withEndPoint: ClothsResource(httpOperationType: .getAll), andHeader: [:]))
            ItemList(_viewModel: itemListViewModel)
        }
    }
}
