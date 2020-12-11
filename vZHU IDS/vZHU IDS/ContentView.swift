//
//  ContentView.swift
//  vZHU IDS
//
//  Copyright © Riley Harper and Joshua Seagrave 2020
//  Comments wherever they make sense to organize and seperate
//
//  God Save the Queen

import SwiftUI

struct ContentView: View { //  Forms Physical View
    
    var body: some View {
        TabView {
            PreDutyView()
                .tabItem {
                    Image(systemName:"list.dash")
                    Text("Pre-Duty")
                }
            ATISView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("vATIS")
                }
            TMUView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("TMU")
                }
        }
    }

struct ContentView_Previews: PreviewProvider { //  creates preview in Xcode no need to remove on release
    static var previews: some View {
        ContentView()
    }
}
}
