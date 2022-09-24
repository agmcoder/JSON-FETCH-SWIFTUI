//
//  Product.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 26/8/22.
//

import Foundation

struct Root: Decodable{
    let metadata: Metadata
    let productDetail: [ProductDetail]

    // MARK: - CODING KEYS
    enum CodingKeys: String, CodingKey {
        case metadata = "metadata"
        case productDetail = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        metadata = try values.decode(Metadata.self, forKey: .metadata)
        productDetail = try values.decode([ProductDetail].self, forKey: .productDetail)
    }
}
struct ProductDetail: Decodable,Identifiable,Hashable{
    let id:String
    let retailer_id: String
    let title: String
    
}

struct Metadata: Decodable{
    let success: Int
    let code: Int
    let message: String
    let time: Float
}

struct Product: Identifiable, Decodable, Hashable{
    var id=UUID()
    let productDetail: ProductDetail
    let isViewed: Bool
    let imageUrl: String
    
    
    
}
