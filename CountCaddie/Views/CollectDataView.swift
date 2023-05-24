//
//  CollectData.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/16/23.
//

import SwiftUI

struct CollectDataView: View {
    @State var ParStepper: Int = 0
    @State var ScoreStepper: Int = 0
    @EnvironmentObject var vm: ViewModel
    @EnvironmentObject var appState: AppState
//    var curRound: Int = 0
    
    
    var body: some View {
        let element = vm.numberRounds()-1
        let currRound = vm.getRound(roundNo: element)
        var holeNo = vm.getCurrHole(roundNo: element)
        var currHole = currRound.holes[holeNo]
        var numPutts = currHole.Putts.count
        var currentScore = 0
        VStack(alignment: .center, spacing:0){
            ZStack{

                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
                    ForEach(currRound.holes[0..<currRound.holes.count], id: \.self) {i in
//                        NavigationLink(destination: Text("HERE")){HoleSelectView(HoleNumber: i.id)}
                        HoleSelectView(HoleNumber: i.id+1, index: element, num: holeNo).navigationTitle("\(currRound.id)")
                    }
                }.padding().cornerRadius(20).overlay(RoundedRectangle(cornerRadius: 10).inset(by: -10).strokeBorder(lineWidth: 1 ).padding(.all))


            }.frame(maxHeight: UIScreen.main.bounds.size.height/4)
            
            List{
//                HStack(){
//
//                    Text("Current Score")
//                    Spacer()
//                    ForEach(vm.getHoles(roundNo: element)) {hole in
//                        vm.getRound(index: element).totScore += 1
//                    }
//                }
               
                HStack{
                    Stepper{Text("Par: \(currHole.Score)")} onIncrement: {
                        vm.incrementScore(roundNo: element, hole: holeNo)
                        print(currHole.Score)
                    } onDecrement: {
                        vm.decrementScore(roundNo: element, hole: holeNo)
                        if vm.getScore(roundNo: element, hole: holeNo) < 0 { vm.incrementScore(roundNo: element, hole: holeNo)}
                        print(currHole.Score)
                    }
                }
                HStack{
                    Stepper{Text("Score: \(currHole.Par)")} onIncrement: {
                        vm.incrementPar(roundNo: element, hole: holeNo)
                    } onDecrement: {
                        vm.decrementPar(roundNo: element, hole: holeNo)
                        if vm.getPar(roundNo: element, hole: holeNo) < 0 { vm.incrementPar(roundNo : element, hole: holeNo)}
                    }
                }
                FairwayButton(roundNumber: element, holeNo: holeNo)
                GreenHitButton(roundNumber: element, holeNo: holeNo)
                UpDownButton(roundNumber: element, holeNo: holeNo)
                ForEach(vm.getHole(index: element, holeNo: holeNo).Putts) {putt in
                    
                    HStack{
                        Text("Putt #\(putt.id+1)").font(.body)
                        Spacer()
                        Button{}label: {  Image(systemName: "arrow.uturn.left.circle")}
                        Button{}label: {  Image(systemName: "arrow.up.circle")}
                        Button{}label: {  Image(systemName: "arrow.uturn.right.circle")}

                        Text("|")

                        Button{}label: {  Image(systemName: "arrow.up.left.circle")}
                        Button{}label: {  Image(systemName: "arrow.up.right.circle")}
                        Button{}label: {  Image(systemName: "arrow.up.circle")}
                        Button{}label: {  Image(systemName: "arrow.down.circle")}
                    }.font(.title3)
                }
                HStack{
                    Text("New Putt").font(.body)
                    Spacer()
                    Button{}label: {  Image(systemName: "arrow.uturn.left.circle")}
                    Button{}label: {  Image(systemName: "arrow.up.circle")}
                    Button{}label: {  Image(systemName: "arrow.uturn.right.circle")}
                    
                    Text("|")
                  
                    Button{}label: {  Image(systemName: "arrow.up.left.circle")}
                    Button{}label: {  Image(systemName: "arrow.up.right.circle")}
                    Button{}label: {  Image(systemName: "arrow.up.circle")}
                    Button{}label: {  Image(systemName: "arrow.down.circle")}
                }.font(.title3)
                HStack{
                    Spacer()
                    Button{
                        vm.addPutt(roundNo: element, hole: holeNo, identification: numPutts )
                        numPutts = numPutts + 1
                    }label: {  HStack{Text("Add Putt");Image(systemName: "plus.rectangle")}}
                    Spacer()
                }.font(.title2)
            }
            .padding()
            if holeNo == currRound.holes.count-1{
                HStack{
                    Button("Previous Hole"){
                        vm.updateCurrHole(roundNo: element, value: holeNo - 1)
                    }.buttonStyle(.borderedProminent)
                    Button("Finish Round"){
                        appState.popToRoot()
                    }.buttonStyle(.borderedProminent)
                }
            } else if holeNo == 0 {
                Button("Next Hole"){
                    vm.updateCurrHole(roundNo: element, value: holeNo + 1)
                }.buttonStyle(.borderedProminent)
            } else{
                HStack{
                    Button("Previous Hole"){
                        vm.updateCurrHole(roundNo: element, value: holeNo - 1)
                    }.buttonStyle(.borderedProminent)
                    Button("Next Hole"){
                        vm.updateCurrHole(roundNo: element, value: holeNo + 1)
                    }.buttonStyle(.borderedProminent)
                }
                
            }
            
        }
    }
}

struct FairwayButton: View {
    @EnvironmentObject var vm: ViewModel
    var roundNumber: Int
    var holeNo: Int
    var body: some View {
        HStack{
            Text("Fairway?").font(.body)
            Spacer()
            switch vm.getFairway(roundNo: roundNumber, hole: holeNo) {
            case "L":
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "L")}label: {  Image(systemName: "arrow.up.left.circle.fill")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "H")}label: {  Image(systemName: "checkmark.circle")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "R")}label: {  Image(systemName: "arrow.up.right.circle")}
            case "H":
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "L")}label: {  Image(systemName: "arrow.up.left.circle")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "H")}label: {  Image(systemName: "checkmark.circle.fill")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "R")}label: {  Image(systemName: "arrow.up.right.circle")}
            case "R":
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "L")}label: {  Image(systemName: "arrow.up.left.circle")}.buttonStyle(.borderless)
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "H")}label: {  Image(systemName: "checkmark.circle")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "R")}label: {  Image(systemName: "arrow.up.right.circle.fill")}
            default:
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "L")}label: {  Image(systemName: "arrow.up.left.circle")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "H")}label: {  Image(systemName: "checkmark.circle")}
                Button{vm.updateFairway(roundNo: roundNumber, hole: holeNo, state: "R")}label: {  Image(systemName: "arrow.up.right.circle")}
            }
        }.font(.title2).buttonStyle(.borderless)
    }
}

struct GreenHitButton: View {
    @EnvironmentObject var vm: ViewModel
    var roundNumber: Int
    var holeNo: Int
    var body: some View {
        HStack{
            Text("Green Hit?").font(.body)
            Spacer()
            switch vm.getGreenHit(roundNo: roundNumber, hole: holeNo) {
            case "Y":
                Button{vm.updateGreenHit(roundNo: roundNumber, hole: holeNo, state: "N")}label: {  Image(systemName: "x.square")}
                Button{vm.updateGreenHit(roundNo: roundNumber, hole: holeNo, state: "Y")}label: {  Image(systemName: "checkmark.square.fill")}
            case "N":
                Button{vm.updateGreenHit(roundNo: roundNumber, hole: holeNo, state: "N")}label: {  Image(systemName: "x.square.fill")}
                Button{vm.updateGreenHit(roundNo: roundNumber, hole: holeNo, state: "Y")}label: {  Image(systemName: "checkmark.square")}
            default:
                Button{vm.updateGreenHit(roundNo: roundNumber, hole: holeNo, state: "N")}label: {  Image(systemName: "x.square")}
                Button{vm.updateGreenHit(roundNo: roundNumber, hole: holeNo, state: "Y")}label: {  Image(systemName: "checkmark.square")}
            }
        }.font(.title2).buttonStyle(.borderless)
    }
}
struct UpDownButton: View {
    @EnvironmentObject var vm: ViewModel
    var roundNumber: Int
    var holeNo: Int
    var body: some View {
        HStack{
            Text("Up and Down?").font(.body)
            Spacer()
            switch vm.getUpDown(roundNo: roundNumber, hole: holeNo) {
            case "Y":
                Button{vm.updateUpDown(roundNo: roundNumber, hole: holeNo, state: "N")}label: {  Image(systemName: "x.square")}
                Button{vm.updateUpDown(roundNo: roundNumber, hole: holeNo, state: "Y")}label: {  Image(systemName: "checkmark.square.fill")}
            case "N":
                Button{vm.updateUpDown(roundNo: roundNumber, hole: holeNo, state: "N")}label: {  Image(systemName: "x.square.fill")}
                Button{vm.updateUpDown(roundNo: roundNumber, hole: holeNo, state: "Y")}label: {  Image(systemName: "checkmark.square")}
            default:
                Button{vm.updateUpDown(roundNo: roundNumber, hole: holeNo, state: "N")}label: {  Image(systemName: "x.square")}
                Button{vm.updateUpDown(roundNo: roundNumber, hole: holeNo, state: "Y")}label: {  Image(systemName: "checkmark.square")}
            }
        }.font(.title2).buttonStyle(.borderless)
    }
}



struct HoleSelectView: View {
    @EnvironmentObject var vm: ViewModel
    var HoleNumber: Int
    let index: Int
    var num: Int = 0
    var body: some View {
        ZStack{
            if num == HoleNumber-1 {
                RoundedRectangle(cornerRadius: 10)
            } else{
                RoundedRectangle(cornerRadius: 10).stroke()
            }
            Button{
                vm.updateCurrHole(roundNo: index, value: HoleNumber-1)
            }label: {Text("\(HoleNumber)").font(.body)}
        }.padding(.horizontal)
    }
}

