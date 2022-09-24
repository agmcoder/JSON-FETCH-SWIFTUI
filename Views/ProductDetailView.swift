//
//  ProductDetailView.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 29/8/22.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES
    var product:Product

    var body: some View {
        
        let imageURL: String=ImageURLBuilder(id: product.productDetail.id)
        VStack{
            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase{
                case .empty:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width:400, height: 400)
                        .scaledToFill()
                case .failure(_):
                    Text("Failed")
                        .foregroundColor(.red)
                @unknown default:
                    Text("please, try again")
                        .foregroundColor(.red)
                }
            }
            Divider()
            
            Text(product.productDetail.title)
                .font(.title)
                .bold()
            
            
            Spacer()
        }
        .navigationBarTitle("Product Detail")
        .navigationBarHidden(false)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
       

    }
    
   
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(
                productDetail:ProductDetail(
                        id: "630660",
                        retailer_id: "195",
                        title: "Hai giu00e0 provat la nuova pasta Barilla?"
                ),
                isViewed: false,
                imageUrl: ImageURLBuilder(id: "630660")))
    }
}
