//
//  HomePageView.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/14/23.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        VStack {
            ForEach(vm.roundList[0..<vm.numberRounds()],  id: \.self) { i in
                Text("HERE WE ARE AT\(i.id)")
            }
            
            NavigationLink(destination: intermediateView()){NewRoundView()}.navigationTitle("Count Caddie").simultaneousGesture(TapGesture().onEnded{
                vm.addRound(value: "BHCC 10/18", desc: "HERE")
            })
            
            
            
            NavigationLink(destination: RoundCollectionView()){StatisticView()}.navigationTitle("Count Caddie")
            
            
            
            
            
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
