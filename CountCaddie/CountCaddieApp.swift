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
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomePageView()
            }.environmentObject(vm)
        }
    }
}


