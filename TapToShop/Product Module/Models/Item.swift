//
//  Item.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 27/01/2024.
//

import Foundation


struct Rating : Decodable {
    
    let rate: Double
    let count: Int
    
    enum CodingKeys: CodingKey {
        case rate
        case count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rate = try container.decode(Double.self, forKey: .rate)
        self.count = try container.decode(Int.self, forKey: .count)
    }
}


struct Item: Identifiable,Decodable {
    
    let id: Int?
    let title: String?
    let price: Double?
    let category: String?
    let description: String?
    let image: String?
    let rating: Rating?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case price = "price"
        case category = "category"
        case description = "description"
        case image = "image"
        case rating = "rating"
        
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? container.decode(Int.self, forKey: CodingKeys.id)
        self.title = try? container.decode(String.self, forKey: CodingKeys.title)
        self.price = try? container.decode(Double.self, forKey: .price)
        self.category = try? container.decode(String.self, forKey: .category)
        self.description = try? container.decode(String.self, forKey: .description)
        self.image = try? container.decode(String.self, forKey: .image)
        self.rating = try? container.decode(Rating.self, forKey: .rating)
    }
    
}
