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
//            ForEach(vm.roundList[0..<vm.numberRounds()],  id: \.self) { i in
//                Text("HERE WE ARE AT\(i.id)")
//            }
            
            NavigationLink(destination: intermediateView()){NewRoundView()}.navigationTitle("Count Caddie")
                
//                .simultaneousGesture(TapGesture().onEnded{
//                vm.addRound(value: "BHCC 10/18", desc: "HERE")
//            })
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
//                Button(action: {}, label: {Text("Begin Round (Goodluck!)").font(.headline).frame(height:55).background(Color.accentColor).cornerRadius(10)})
   
    }
}

struct BeginRoundView: View {
    var body: some View {
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
            Text("Begin Round (Goodluck!)").foregroundColor(.white).font(.headline)
                .font(.largeTitle)
        }
        .padding(.horizontal).frame(maxHeight: UIScreen.main.bounds.size.height/10)
//                Button(action: {}, label: {Text("Begin Round (Goodluck!)").font(.headline).frame(height:55).background(Color.accentColor).cornerRadius(10)})
   
    }
}




struct intermediateView: View{
//  THIS HAS BEEN AN ONGOING ISSUE BECAUSE OF THE UI TEXTFIELD. This is the log error that it produces, based off stack overflow this is a bug on apples end.
//    [LayoutConstraints] Unable to simultaneously satisfy constraints.
//        Probably at least one of the constraints in the following list is one you don't want.
//        Try this:
//            (1) look at each constraint and try to figure out which you don't expect;
//            (2) find the code that added the unwanted constraint or constraints and fix it.
//    (
//        "<NSLayoutConstraint:0x60000208ba20 'accessoryView.bottom' _UIRemoteKeyboardPlaceholderView:0x12970b500.bottom == _UIKBCompatInputView:0x129118530.top   (active)>",
//        "<NSLayoutConstraint:0x6000020d0320 'assistantHeight' SystemInputAssistantView.height == 45   (active, names: SystemInputAssistantView:0x12854bba0 )>",
//        "<NSLayoutConstraint:0x600002088af0 'assistantView.bottom' SystemInputAssistantView.bottom == _UIKBCompatInputView:0x129118530.top   (active, names: SystemInputAssistantView:0x12854bba0 )>",
//        "<NSLayoutConstraint:0x600002088d70 'assistantView.top' V:[_UIRemoteKeyboardPlaceholderView:0x12970b500]-(0)-[SystemInputAssistantView]   (active, names: SystemInputAssistantView:0x12854bba0 )>"
//    )
//
//    Will attempt to recover by breaking constraint
//    <NSLayoutConstraint:0x600002088d70 'assistantView.top' V:[_UIRemoteKeyboardPlaceholderView:0x12970b500]-(0)-[SystemInputAssistantView]   (active, names: SystemInputAssistantView:0x12854bba0 )>
//
//    Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
//    The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.
    // https://stackoverflow.com/questions/62455042/unable-to-simultaneously-satisfy-constraints-with-keyboard-and-uitoolbar
    // https://github.com/hackiftekhar/IQKeyboardManager/issues/1616
    @EnvironmentObject var vm: ViewModel
    @State private var id = ""
    @State private var desc = ""
    @State private var advancedPutting = false
    @State private var speed = 9.0
    @State private var isEditing = false
   
    
    var body: some View {
       
       
        VStack {
            
            Form {
                Section(header: Text("General"), footer: Text("Round name needs to be unique.")) {
                    TextField(text: $id, prompt: Text("Unique Round Name")) {
                           Text("Round Name")
                    }.autocorrectionDisabled(true).disableAutocorrection(true)
                       TextField(text: $desc, prompt: Text("Description")) {
                           Text("Description")
                       }.autocorrectionDisabled(true).disableAutocorrection(true)
                }
                Section(header: Text("Round Options")){
                    Toggle("Advanced Putting Stats", isOn: $advancedPutting)
                }
                
                Section(header: Text("User Profiles")) {
                    Text(String(format: "Number of Holes: %.0f", speed))
                        .foregroundColor(isEditing ? .red : .blue)
                    Slider(
                                value: $speed,
                                in: 1...18,
                                step: 1,
                                onEditingChanged: { editing in
                                    isEditing = editing
                                }
                            )
                }
                Section(){
                    Button("Clear Current Inputs") {
                        desc = ""
                        id = ""
                        advancedPutting = false
                    }
                }
            }
            NavigationLink(destination: CollectDataView()){BeginRoundView()}.navigationTitle("New Round").simultaneousGesture(TapGesture().onEnded{
                vm.addRound(value: id, desc: desc)
            })

        }
           
        
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomePageView()
        }
        
    }
}
