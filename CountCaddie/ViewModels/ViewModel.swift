//
//  ViewModel.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/16/23.
//

import Foundation


class ViewModel: ObservableObject{
    
    @Published var roundList: [ScorecardModel] = []
    
//    init(){
//        getItems()
//    }
//
//
//
//
//    func getItems(){
//        let newItems = [ScorecardModel(id: "BHCC 10/17", description: "Test Round", holes: [ScorecardModel.HoleModel(id: 1, FairwayHit: true, GreenHit: "True", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4),
//                                                                                           ScorecardModel.HoleModel(id: 2,FairwayHit: false, GreenHit: "True", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "RL", Miss: "F", Make: false), ScorecardModel.HoleModel.Putt(id:2, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4),
//                                                                                           ScorecardModel.HoleModel(id: 3,FairwayHit: true, GreenHit: "check", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4),
//                                                                                           ScorecardModel.HoleModel(id: 4,FairwayHit: true, GreenHit: "True", Putts: [ScorecardModel.HoleModel.Putt(id:1, Break: "RL", Miss: "F", Make: false), ScorecardModel.HoleModel.Putt(id:2, Break: "LR", Miss: "F", Make: true)], Score: 4, Par: 4)])]
//        roundList.append(contentsOf: newItems)
//    }
    
    func numberRounds() -> Int {
        return roundList.count
    }
    
    func getRound(index: Int) -> ScorecardModel{
        return roundList[index]
    }
    
    func getHoles(index: Int) -> Array<ScorecardModel.HoleModel> {
        return roundList[index-1].holes
    }
    
    
    func getHole(index: Int, holeNo: Int) -> ScorecardModel.HoleModel{
        return roundList[index].holes[holeNo]
    }
    
   
    func addHole(round: Int, id: Int, FairwayHit: String, GreenHit: Bool, Score: Int){
        let newHole = ScorecardModel.HoleModel(id: id, FairwayHit: FairwayHit, GreenHit: GreenHit, Score: Score)
        roundList[round].holes.append(newHole)
    }
    
    func getCurrHole(index: Int) -> Int{
        return roundList[index].currHole
    }
    
    func updateCurrHole(index: Int, value: Int) -> Void{
        roundList[index].currHole = value-1
    }
    
    func incrementScore(index: Int, hole: Int) -> Void{
        roundList[index].holes[hole].Score += 1
    }
    func decrementScore(index: Int, hole: Int) -> Void{
        roundList[index].holes[hole].Score -= 1
    }
    
    func getScore(index: Int, hole: Int) -> Int{
        return roundList[index].holes[hole].Score
    }
    
    func incrementPar(index: Int, hole: Int) -> Void{
        roundList[index].holes[hole].Par += 1
    }
    func decrementPar(index: Int, hole: Int) -> Void{
        roundList[index].holes[hole].Par -= 1
    }
    
    func getPar(index: Int, hole: Int) -> Int{
        return roundList[index].holes[hole].Par
    }
    
    
    
    func updateFairway(index: Int, hole: Int, state: String) -> Void{
        roundList[index].holes[hole].FairwayHit = state
    }
    func getFairway(index: Int, hole: Int) -> String{
        return roundList[index].holes[hole].FairwayHit ?? ""
    }
    
    
    
    
    func addPutt(round: Int, hole: Int, identification: Int){
        let newPutt = ScorecardModel.HoleModel.Putt(id: identification)
        roundList[round].holes[hole].Putts.append(newPutt)
    }
    
    func addRound(value: String, desc: String, noholes: Int) -> Void {
        var newRound = ScorecardModel(id: value , description: desc, holes: [])
        for i in 0..<noholes {
            newRound.holes.append(ScorecardModel.HoleModel(id: i))
        }
        roundList.append(newRound)
    }
}
