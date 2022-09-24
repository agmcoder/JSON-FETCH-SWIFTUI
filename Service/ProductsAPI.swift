//
//  ProductsAPI.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 31/8/22.
//

import Foundation
import Combine
protocol ProductsAPIProtocol:AnyObject{
    //var networked: NetworkerProtocol{get}
    //func loadProducts()->AnyPublisher<Products,Never>
    func loadProducts(endPoint:String) async throws->Root?
    
}

final class ProductsAPI:ProductsAPIProtocol{
   
    
    
    // MARK: - FUNCTIONS
    func loadProducts(endPoint:String) async throws -> Root? {
        guard let url = URL(string: endPoint ) else {
            print("Invalid URL")
            
            return nil
        }
        let urlRequest = URLRequest(url: url)
        do {
            let (json, _) = try await URLSession.shared.data(for: urlRequest)

            if let decodedResponse = try? JSONDecoder().decode(Root.self, from: json) {
                return decodedResponse 
            }
        } catch {
            print("Invalid data")
        }
        return nil

    }
}

