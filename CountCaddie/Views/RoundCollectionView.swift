//
//  RoundSelectView.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/15/23.
//

import SwiftUI

struct RoundCollectionView: View {
//    @State var items: [Hole] = [Hole(id: 1, FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4), Hole(id: 2,FairwayHit: false, GreenHit: false, Putts: 1, Score: 4, Par: 4), Hole(id: 3,FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4), Hole(id: 4,FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4)]
//    var body: some View {
//        List() { ForEach(items) {hole in
//
//            NavigationLink {
//                Text("Hole Number \(hole.id)")
//            } label: {
//                Text("We Here")
//            }.navigationTitle("Landmarks")
//        }
//
//        }
//    }
    
    @EnvironmentObject var vm: ViewModel
//    [Hole(id: 1, FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4), Hole(id: 2,FairwayHit: false, GreenHit: false, Putts: 1, Score: 4, Par: 4), Hole(id: 3,FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4), Hole(id: 4,FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4)]
    var body: some View {
        List() { ForEach(vm.roundList) {round in
            
            NavigationLink {
                Text("Round Name: \(round.id)")
                Text("Description: \(round.description)")
                
            } label: {
                Text("\(round.id)")
            }.navigationTitle("Completed Rounds")
        }
        
        }
    }
}

struct RoundSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RoundCollectionView()
        }
    }
}
