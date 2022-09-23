//
//  MainView.swift
//  Angel Rings
//
//  Created by Vicky Zheng on 9/22/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var main: Main
    let beige = Color(red: 0.9804, green: 0.9333, blue: 0.7725)
    
    var profile: RoundedRectangle { RoundedRectangle(cornerRadius: 10) }
    
    
    var body: some View {
        ZStack {
            beige.ignoresSafeArea()
            VStack {
                Text(main.getCaution())
                ZStack {
                    let buttonSize = 190.0;
                    let shadowSize = 220.0;
                    
                    let (innerCircle, OuterCircle) = main.getColor()
                    
                    OuterCircle
                        .clipShape(Circle())
                        .frame(width: shadowSize, height: shadowSize)
                    Button(main.getState()) {
                        main.activated.toggle()
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .frame(width: buttonSize, height: buttonSize)
                    .background(innerCircle)
                    .clipShape(Circle())
                }.padding([.top, .bottom], 30)
                Text(main.getCurrentInstructions())
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let main = Main()
    static var previews: some View {
        MainView().environmentObject(main)
    }
}
