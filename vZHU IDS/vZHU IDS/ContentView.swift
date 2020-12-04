enter_tmu_key//
//  ContentView.swift
//  vZHU IDS
//
//  Copyright © Riley Harper and Joshua Seagrave 2020
//  Comments wherever they make sense to organize and seperate
//
//  God Save the Queen


import SwiftUI

private let vatis_url : String = "zhuartcc.org/api/vatis/"
private let tmu_url : String = "zhuartcc.org/api/tmu/"
private let tmu_key : String = "enter_tmu_key"

struct vAtisResponse: Codable {
    let facility : String
    let config_profile : String
    let atis_letter: String
    let airport_conditions: String
    let notams: String
}

struct tmuResponse: Codable {
    let info: String
    let time_issued: String
    let time_expires: String
}

func HandleAPICall(url: String, airport: String?, key: String?, completionHandler: @escaping ([String]) -> Void) {
    
    let m_url = URL(string: url + airport!)
    var request = URLRequest(url: m_url!)
    
    if (key != nil) {
        request.addValue(key!, forHTTPHeaderField: "api_key")
    }
    
    
    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        
        if let error = error {
            // handle the error here
            return
        }
        
        guard let httpResonse = response as? HTTPURLResponse, (200...299).contains(httpResonse.statusCode) else {
            // handle the error here
            return
        }
        
        if let data = data {
            if airport != nil, let apiReturn = try? JSONDecoder().decode(vAtisResponse.self, from: data) {
                completionHandler([apiReturn.facility, apiReturn.config_profile, apiReturn.atis_letter, apiReturn.airport_conditions, apiReturn.notams] ?? [])
            }
            else if key != nil, let apiReturn = try? JSONDecoder().decode(tmuResponse.self, from: data) {
                completionHandler([apiReturn.info, apiReturn.time_issued, apiReturn.time_expires] ?? [])
                
            }
            else
            {
                return
            }
        }
        
    })
    
    task.resume()
    
}

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
}

struct ContentView_Previews: PreviewProvider { //  creates preview in Xcode no need to remove on release
    static var previews: some View {
        ContentView()
    }
}
