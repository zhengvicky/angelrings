//
//  ContentView.swift
//  Shared
//
//  Created by Vicky Zheng on 9/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TripsView().tabItem {}
            MainView().tabItem {}
            ProfileView().tabItem {}
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
