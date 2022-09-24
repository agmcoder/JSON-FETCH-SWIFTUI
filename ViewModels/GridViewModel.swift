//
//  GridViewModel.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 27/8/22.
//

import Foundation
import Combine
import SwiftUI
import os

class GridViewModel:ObservableObject{
    // Mark: Properties
    let logger=Logger(subsystem: "gridviewModel", category: "data load")
    private var productsAPI:ProductsAPIProtocol=ProductsAPI()
    private var root:Root?
    // Mark: Published variables.
    @Published var isLoading=true
    @Published var isShowViewedOn:Bool=false
    @Published var products:[Product]=[]
    @Published var viewedProducts=Set<Product>()
    //Mark: Computed var
    var filteredProducts: [Product]{
        if(isShowViewedOn){
            return products.filter{viewedProducts.contains($0)}
        }
        else{
            return products
        }
    }
    
    // Mark: init
    init(){
        self.isLoading=true
    }
    
    // Mark: Functions
    
    func deleteProducts(){
        
        self.products.removeAll()
        debugPrint("delete products")
    }
    
    func load(_ dataSource:EndPoint) async {
        
        //deleteProducts()
        switch dataSource {
        case .jsonProducts:
            do {
                let root = try await productsAPI.loadProducts(endPoint: dataSource.rawValue)
                DispatchQueue.main.async {
                    self.root = root ?? nil
                    self.generateProducts()
                }
            } catch {
                debugPrint("error al cargar datos")
            }
            
        }
    }
    
    func generateProducts(){
        if let productDetailArray=root?.productDetail{
            for product in productDetailArray {
                products.append(Product(
                    productDetail: product,
                    isViewed: false,
                    imageUrl: ImageURLBuilder(id: product.id)
                ))
            }

        }
        else{
            products=[]
            isLoading=false
        }
    }
    
    func sortViewed(){
        withAnimation{
            isShowViewedOn.toggle()
        }
    }
    func containsProduct(product: Product)-> Bool{
        viewedProducts.contains(product)
    }
    
    func toggleViewed(_ product:Product){
        if containsProduct(product:product){
            //viewedProducts.remove(product)
            
        }else{
            viewedProducts.insert(product)
        }
        
        
    }
    
    
    
    
}


