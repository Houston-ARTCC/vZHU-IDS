//
//  ContentView.swift
//  vZHU IDS
//
//  Created by Riley Harper on 10/22/20.
//Hi Romashov

import SwiftUI
import WebKit
import UIKit
class ViewController: UIViewController, WKUIDelegate {
var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
struct ContentView: View {

    @State private var selection = 1

    var body: some View {

        TabView() {
            Text("Pre-Duty Items")
            
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Pre-Duty")
                }.tag(1)

            Text("Second Content View")
                .tabItem {
                    Image(systemName: "paperclip")
                    Text("Documents")
                }.tag(2)

            Text("Third Content View")
                .tabItem {
                    Image(systemName: "cloud.bolt.rain")
                    Text("Current vATIS")
                }.tag(3)
            Text("Fourth Content View")
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Event Info")
                }.tag(4)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}





















}
