//
//  ContentView.swift
//  vZHU IDS
//
//  Copyright © Riley Harper and Joshua Seagrave 2020
//  Comments wherever they make sense to organize and seperate


import SwiftUI

struct ContentView: View { //  Forms Physical View
    var body: some View {
        TabView {
            Text("Pre-Duty Placeholder")
                .tabItem {
                    Image(systemName:"list.dash")
                    Text("Pre-Duty")
        }
            Text("vATIS Placeholder")
            .tabItem {
                Image(systemName: "list.dash")
                Text("vATIS")
    }
    }
}

struct ContentView_Previews: PreviewProvider { //  creates preview in Xcode no need to remove on release
    static var previews: some View {
        ContentView()
    }
}
}
