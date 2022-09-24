//
//  ContentView.swift
//  JSON FETCH SWIFTUI
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct ContentView: View {
    private let gridvm:GridViewModel
        init(gridvm:GridViewModel){
            self.gridvm=gridvm
        }
    var body: some View {
        GridView(dataViewModel: gridvm)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gridvm: GridViewModel())
    }
}
