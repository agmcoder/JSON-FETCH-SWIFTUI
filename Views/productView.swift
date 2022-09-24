//
//  Cell.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 27/8/22.
//

import SwiftUI
import Kingfisher

struct ProductView: View {
    var product:Product
    
    
    var body: some View {
        
        let imageURL: URL? = URL(string : ImageURLBuilder(id: product.productDetail.id))

        VStack {
            GeometryReader{ proxy in
                VStack{
                    Spacer()
                    VStack{
                    KFImage(imageURL)
                        .onSuccess { r in
                            print(r)
                        }
                        .placeholder { p in
                            ProgressView(p)
                        }
                        .onFailure{ error in
                            Text("Error")
                                .foregroundColor(.red)
                            print("Error : \(error)")
                        }
                        .resizable()
                        .scaledToFill()
                    }
                        .frame(width: proxy.size.width, height:proxy.size.height*0.7)
                    
                        Text(product.productDetail.title)
                        .frame(width: proxy.size.width,height: proxy.size.height*0.3)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom)
                        .background(Color.gray)
                        .font(.system(.title3))
                        
                        
                    
                    
                    
                }.frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
        .frame(minWidth: 100, idealWidth: 160, maxWidth: 200, minHeight: 100, idealHeight: 160, maxHeight: 200)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()
    }
    
}
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(
            product: Product(productDetail: ProductDetail(id: "630660", retailer_id: "195", title: "Hai giu00e0 provat la nuova pasta Barilla?"), isViewed: false, imageUrl: "630660")
        )
    }
}


