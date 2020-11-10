//
//  ContentView.swift
//  vZHU IDS
//
//  Created by Riley Harper on 10/22/20.
//  Hi Romashov
//  Welcome Britain
//  Keep America Hot


import SwiftUI


    
struct ContentView: View {

    @State private var selection = 1

    var body: some View {

        TabView() {
            
            Text("Pre-Duty Items")
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Pre-Duty")
                }.tag(1)

            var url : String = "https://zhuartcc.org/api/vatis/"
            var request : NSMutableURLRequest = NSMutableURLRequest()
            request.URL = NSURL(string: url)
            request.HTTPMethod = "GET"

            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
                let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary

                if (jsonResult != nil) {
                    // process jsonResult
                } else {
                   Text("No vATIS Facility Found Ensure Using Latest vATIS Profile")
                }
                .tabItem {
                    Image(systemName: "cloud.bolt.rain")
                    Text("Weather (vATIS)")
                }.tag(2)
            Text("Fourth Content View")
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
