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
    
    @State var rounds: [ScorecardModel] = [ScorecardModel(id: "Maderas CC 10/17", description: "Practice Round")]
//    [Hole(id: 1, FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4), Hole(id: 2,FairwayHit: false, GreenHit: false, Putts: 1, Score: 4, Par: 4), Hole(id: 3,FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4), Hole(id: 4,FairwayHit: true, GreenHit: true, Putts: 2, Score: 4, Par: 4)]
    var body: some View {
        List() { ForEach(rounds) {hole in
            
            NavigationLink {
                Text("Round Number: \(rounds[0].id)")
                Text("Description: \(rounds[0].description)")
                
            } label: {
                Text("\(rounds[0].id)")
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
