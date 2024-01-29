//
//  ItemListservice.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 27/01/2024.
//

import Foundation

struct ItemListservice: WebserviceManagerProtocol {
    
    var endPoint: ResourceEndPointProtocol?
    var header: [String : String]?
    
    
    func getListItems() async  -> [Item] {
        
        let result = await self.fetch(type: [Item].self)
        
        switch result {
            
        case .success(let obj):
            do {
                return obj!
            }
        case .failure(_), .none:
            do{
            return [Item]()
            }            
        }
    }
}
