//
//  CountCaddieApp.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/14/23.
//

import SwiftUI




@main
struct CountCaddieApp: App {
    @StateObject var vm : ViewModel = ViewModel()
    @StateObject var appState: AppState = AppState()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appState.path){
                HomePageView()
            }.environmentObject(vm).environmentObject(appState)
        }
    }
}



