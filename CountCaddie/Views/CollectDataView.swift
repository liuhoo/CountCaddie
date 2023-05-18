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
//    var data = ScorecardModel(id: 1, name: "New Round", description: "Testing")
    
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        
        VStack(alignment: .center, spacing:0){
            
            ZStack{
                
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
                    ForEach(1..<19) {i in
                        NavigationLink(destination: Text("\(i)")){HoleSelectView(HoleNumber: i)}.navigationTitle("Hole Number")
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
                ForEach(vm.getHole(index: 0, holeNo: 1).Putts) {putt in
                    HStack{
                        Text("Putt").font(.body)
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
                    Text("Putt").font(.body)
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
                    Button{}label: {  HStack{Text("Add Putt");Image(systemName: "plus.rectangle")}}
                    Spacer()
                }.font(.title2)
        
                
            }
            .padding()
        }
    }
}


struct HoleSelectView: View {
    var HoleNumber: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).stroke()
            Text("\(HoleNumber)").font(.body)
        }.padding(.horizontal)
        
    }
}

struct CollectData_Previews: PreviewProvider {
    static var previews: some View {
        CollectDataView()
    }
}
