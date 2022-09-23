//
//  Angel_RingsApp.swift
//  Shared
//
//  Created by Vicky Zheng on 9/11/22.
//

import SwiftUI

@main
struct Angel_RingsApp: App {
    init() {
        <#code#>
    }
    
    @StateObject private var main: Main
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(main)
        }
    }
}

struct Angel_RingsApp_Previews: PreviewProvider {
    static let main = Main()
    static var previews: some View {
        ContentView().environmentObject(main)
    }
}
