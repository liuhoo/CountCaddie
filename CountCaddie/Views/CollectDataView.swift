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
//    var curRound: Int = 0
    
    
    var body: some View {
        let element = vm.numberRounds()-1
//        let holes = vm.getHoles(index: curRound)
        let currRound = vm.getRound(index: element)
        var holeNo = vm.getCurrHole(index: element)
        var currHole = currRound.holes[holeNo]
        var numPutts = currHole.Putts.count
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
                HStack{
                    Stepper("Par: \(ParStepper)", value: $ParStepper)
                }
                HStack{
                    Stepper("Score: \(ScoreStepper)", value: $ScoreStepper)
                }
                HStack{
                    Text("Fairway?").font(.body)
                    Spacer()
                    Button{}label: {  Image(systemName: "arrow.up.left.circle")}
                    Button{}label: {  Image(systemName: "checkmark.circle")}
                    Button{}label: {  Image(systemName: "arrow.up.right.circle")}
                }.font(.title2)
                HStack{
                    Text("Up and Down?").font(.body)
                    Spacer()
                    Button{}label: {  Image(systemName: "x.square")}
                    Button{}label: {  Image(systemName: "checkmark.square")}
                    
                }.font(.title2)
                ForEach(vm.getHole(index: element, holeNo: holeNo).Putts) {putt in
                    
                    HStack{
                        Text("Putt #\(putt.id+1)").font(.body)
                        Spacer()
                        Button{}label: {  Image(systemName: "arrow.uturn.left.circle")}
                        Button{}label: {  Image(systemName: "arrow.up.circle")}
                        Button{}label: {  Image(systemName: "arrow.uturn.right.circle")}

                        Button{}label: {  Image(systemName: "pause")}

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
                    
                    Button{}label: {  Image(systemName: "pause")}
                  
                    Button{}label: {  Image(systemName: "arrow.up.left.circle")}
                    Button{}label: {  Image(systemName: "arrow.up.right.circle")}
                    Button{}label: {  Image(systemName: "arrow.up.circle")}
                    Button{}label: {  Image(systemName: "arrow.down.circle")}
                }.font(.title3)
                HStack{
                    Spacer()
                    Button{
                        vm.addPutt(round: element, hole: holeNo, identification: numPutts )
                        numPutts = numPutts + 1
                    }label: {  HStack{Text("Add Putt");Image(systemName: "plus.rectangle")}}
                    Spacer()
                }.font(.title2)
            }
            .padding()
        }
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
                vm.updateCurrHole(index: index, value: HoleNumber)
            }label: {Text("\(HoleNumber)").font(.body)}
        }.padding(.horizontal)
    }
}

struct CollectData_Previews: PreviewProvider {
    static var previews: some View {
        CollectDataView()
    }
}
