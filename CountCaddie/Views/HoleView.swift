//
//  HoleView.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/15/23.
//

import SwiftUI

struct HoleView: View {
    var body: some View {
        VStack{
            Text("Hole Number")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            List{
                Text("Fairway Hit")
                Text("Green Hit")
                Text("# Putts")
                Text("Up and Down")
                Text("Final Score")
            }
        }
    }
}

struct HoleView_Previews: PreviewProvider {
    static var previews: some View {
        HoleView()
    }
}
