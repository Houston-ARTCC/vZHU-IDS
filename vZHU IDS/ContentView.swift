//
//  ContentView.swift
//  vZHU IDS
//
//  Created by Riley Harper on 10/22/20.
//  Hi Romashov

//
//  Welcome Britain
//  Keep America Hot
//
//  God Save the Queen


import SwiftUI

//  this code, as previously acknowledged, is VERY messy and quite possibly
//  deprecated. However, I am not going to fix it now, it will probably work
//  until one of us decides to make it prettier.

func HandleAPICall(url : String) -> NSDictionary? {
    var request : NSMutableURLRequest = NSMutableURLRequest()
    request.URL = NSURL(string: url)
    request.HTTPMethod = "GET"

    NSURLConnection.sendAsynchronousRequest(
        request, queue: NSOperationQueue(), completionHandler:{ 
            (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(
                data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary

            return jsonResult
        }
    )
    return nil
}

    
struct ContentView: View {

    @State private var selection = 1

    var body: some View {

        TabView() {
            
//          ############# PRE-DUTY ITEMS #############

            Text("Pre-Duty Items")
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Pre-Duty")
                }.tag(1)

//          ################# vATIS  #################

            var atis_url : String = "https://zhuartcc.org/api/vatis/"
            var atis_jsonResult : NSDictionary = HandleAPICall(url: atis_url) // DO NOT FORCE UNWRAP

            if (atis_jsonResult != nil) {
                // process atis_jsonResult
            } else {
                Text("No vATIS Facility Found! Ensure Using Latest vATIS Profile")
            }
                .tabItem {
                    Image(systemName: "cloud.bolt.rain")
                    Text("Weather (vATIS)")
                }.tag(2)

//          ################### TMU ###################

            var tmu_url : String = "https://zhuartc.org/api/tmis/"
            var tmu_jsonResult : NSDictionary = HandleAPICall(url: tmu_url) // DO NOT FORCE UNWRAP

            if (tmu_jsonResult != nil) {
                // process tmu_jsonResult
            } else {
                Text("Something Something TMU API Error") // Riley can clean this up later
            }
                .tabItem {
                    Image(systemName: "airplane")
                    Text("TMU Notices")
                }.tag(3)
        } 
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






















}
