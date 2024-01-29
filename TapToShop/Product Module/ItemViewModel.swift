//
//  ItemViewmodels.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 27/01/2024.
//

import Foundation


enum ViewModelStatus {
    
    case notInitiated
    case loading
    case success
    case failure
}


class ItemViewModel: ObservableObject {
    
     var items = [Item]()
    @Published var viewModelStatus: ViewModelStatus = .notInitiated
    let service: ItemListservice
    
    init(service: ItemListservice) {
        self.service = service
    }
    
    func getItems()  {
        viewModelStatus = .loading
        Task {
            do {
                
                items =  await self.service.getListItems()
                
                DispatchQueue.main.async { [weak self] in
                    self?.viewModelStatus = .success
                    if self?.items.count == 0 {
                        self?.viewModelStatus = .failure
                    }
                }
                
            }
            
        }
        
    }
    

}
