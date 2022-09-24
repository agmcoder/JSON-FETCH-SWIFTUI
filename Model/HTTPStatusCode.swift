//
//  HTTPStatusCode.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 1/9/22.
//

import Foundation

enum HTTPStatusCode: Int,Error {
    
    case badRequest = 400
    
    /// - notFound: The requested resource could not be found but may be available in the future.
    case notFound = 404


}
