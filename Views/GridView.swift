//
//  GridView.swift
//  Gomez ShopFully Test
//
//  Created by agmcoder on 26/8/22.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var dataViewModel:GridViewModel
    let notViewedIcon = Image(systemName: "eye.slash")
    let viewedIcon = Image(systemName: "eye.fill")
    var columns = [
        GridItem(.flexible(minimum: 140, maximum: 200)),
        GridItem(.flexible(minimum: 140, maximum: 200))
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button(action:{}, label: {Image(systemName: "arrow.counterclockwise").resizable()
                        .scaledToFit()})
                    .task {
                        //load the products by a suspend func
                        await dataViewModel.load(EndPoint.jsonProducts)
                    }
                    .frame(width: 40, height: 30)
                    .padding()
                    Spacer()
                    
                    Text("Show visited products")
                        .padding(.leading)
                        .font(.title2)
                    
                    Button(
                        action: {dataViewModel.sortViewed()}
                    ){
                        if(dataViewModel.isShowViewedOn){
                            viewedIcon
                                .resizable()
                                .frame(width: 40,height: 30)
                                .scaledToFit()
                                .foregroundColor(SwiftUI.Color.purple)
                            
                            
                        }
                        else{
                            notViewedIcon
                                .resizable()
                                .frame(width: 40,height: 30)
                                .scaledToFit()
                                .foregroundColor(SwiftUI.Color.black)
                        }
                    }
                    .padding()
                    
                    
                }
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach(dataViewModel.filteredProducts){ product in
                            NavigationLink(destination:ProductDetailView(product: product)){
                                ProductView(product: product)
                            }
                            .simultaneousGesture(TapGesture().onEnded{
                                print("tapgesture ended")
                                dataViewModel.toggleViewed(product)
                            })
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("Products")
            }
            
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(dataViewModel: GridViewModel())
    }
}

