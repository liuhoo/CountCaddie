//
//  HomePageView.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/14/23.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        
        
            VStack {
                NavigationLink(destination: Text("ScoreCard")){NewRoundView()}.navigationTitle("Count Caddie")
                NavigationLink(destination: Text("In Depth Statistics")){StatisticView()}.navigationTitle("Count Caddie")
               
                
            }
        
        
            
        
    
        
    }
}


struct StatisticView: View {
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 3).opacity(0.2)
            Text("Statistics")
                .font(.largeTitle)
        }
        .padding(.horizontal)
    }
}

struct NewRoundView: View {
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 3).opacity(0.2)
            Text("New Round")
                .font(.largeTitle)
        }
        .padding(.horizontal)
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomePageView()
        }
        
    }
}
