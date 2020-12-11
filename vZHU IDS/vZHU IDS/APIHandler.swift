//
//  APIHandler.swift
//  vZHU IDS
//
//  Created by Joshua Seagrave on 12/4/20.
//

import Foundation
import RestEssentials

let vatis_url : String = "https://zhuartcc.org/api/vatis/"
let tmu_url : String = "https://zhuartcc.org/api/tmu/"
let tmu_key : String = "$wF%50Wy"

let airports : [airport] = [airport(airport: "KMSY")]

struct airport: Identifiable {
    let id = UUID()
    let airport : String
}

struct vAtisResponse: Codable, Identifiable {
    let id : Int
    let facility : String
    let config_profile : String
    let atis_letter: String
    let airport_conditions: String
    let notams: String
    
    init() {
        id = 0
        facility = ""
        config_profile = ""
        atis_letter = ""
        airport_conditions = ""
        notams = ""
    }
}

struct tmuResponse: Codable {
    let info: String
    let time_issued: String
    let time_expires: String
}

func HandleATISAPICall (url: String, airport: String, completionHandler: @escaping (vAtisResponse) -> Void) {

    guard let rest = RestController.make(urlString: url + airport) else {
        print("some badness has occurred in making the URL call")
        return
    }
        
    rest.get(vAtisResponse.self) { result, httpResponse in
        do {
            let response = try result.value()
            completionHandler(response)
                
        } catch {
            print("the response you've gotten isn't quite what we expected")
            print(result)
        }
    }
}


func HandleTMUAPICall (url: String, key: String, completionHandler: @escaping (tmuResponse) -> Void) {
    guard let rest = RestController.make(urlString: url) else {
        // handle bad url here
        return
    }
    rest.get(tmuResponse.self) { result, httpResponse in
        do {
            //something
        } catch {
            //something else
        }
    }
}
