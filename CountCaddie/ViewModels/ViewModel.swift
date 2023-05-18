//
//  ViewModel.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/16/23.
//

import Foundation


class ViewModel: ObservableObject{
    
    @Published var roundList: [ScorecardModel] =
    [ScorecardModel(id: "BHCC", description: "Test Round", holes: [ScorecardModel.HoleModel(id: 1, FairwayHit: true, GreenHit: "True", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4),
   ScorecardModel.HoleModel(id: 2,FairwayHit: false, GreenHit: "True", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "RL", Miss: "F", Make: false), ScorecardModel.HoleModel.Putt(id:1, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4),
   ScorecardModel.HoleModel(id: 3,FairwayHit: true, GreenHit: "SHEEEEESH", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4),
   ScorecardModel.HoleModel(id: 4,FairwayHit: true, GreenHit: "True", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "RL", Miss: "F", Make: false), ScorecardModel.HoleModel.Putt(id:1, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4)])]
    func addRound(RoundName: String, RoundDescription: String){
        let newItem = ScorecardModel(id: RoundName,  description: RoundDescription)
        roundList.append(newItem)
    }
    
    func getRound(index: Int) -> ScorecardModel{
        return roundList[index]
    }
    func getHole(index: Int, holeNo: Int) -> ScorecardModel.HoleModel{
        return roundList[index].holes[holeNo]
    }
    
}
