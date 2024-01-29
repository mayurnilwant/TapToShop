//
//  Item.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 27/01/2024.
//

import Foundation


struct Rating : Decodable {
    
    @Rate var rate: Double
    var count: Int
    
    enum CodingKeys: CodingKey {
        case rate
        case count
    }
    
    init() {
        
        self.rate = 3.9
        self.count = 678
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
    
    init() {
        
        self.id = 1
        self.title = "Rain Jacket Women Windbreaker Striped Climbing Raincoats"
        self.price = 39.99
        self.description = "Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look."
        
        self.category = "women's clothing"
        self.image = "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg"
        self.rating = Rating()
        
        
        
    }
    
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
