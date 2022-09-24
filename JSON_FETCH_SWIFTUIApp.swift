//
//  JSON_FETCH_SWIFTUIApp.swift
//  JSON FETCH SWIFTUI
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

@main
struct JSON_FETCH_SWIFTUIApp: App {
    private let gridvm=GridViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(gridvm:gridvm)
                .task{
                    await gridvm.load(EndPoint.jsonProducts)        }
        }
    }
}
