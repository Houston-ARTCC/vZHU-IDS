//
//  APIHandler.swift
//  vZHU IDS
//
//  Created by Joshua Seagrave on 12/4/20.
//

import Foundation
import RestEssentials

let vatis_url : String = "https://zhuartcc.org/api/vatis/K"
let tmu_url : String = "https://zhuartcc.org/api/tmu/"
let tmu_key : String = "$wF%50Wy"

let airports : [airport] = [airport(airport: "AUS"),
                            airport(airport: "BPT"),
                            airport(airport: "BTR"),
                            airport(airport: "CLL"),
                            airport(airport: "CRP"),
                            airport(airport: "CWF"),
                            airport(airport: "CXO"),
                            airport(airport: "DWH"),
                            airport(airport: "EFD"),
                            airport(airport: "GPT"),
                            airport(airport: "HOU"),
                            airport(airport: "IAH"),
                            airport(airport: "LCH"),
                            airport(airport: "LFT"),
                            airport(airport: "MSY"),
                            airport(airport: "NEW"),
                            airport(airport: "NGP"),
                            airport(airport: "POE"),
                            airport(airport: "SAT"),
                            airport(airport: "SGR"),
                            airport(airport: "TME"),]

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

func HandleAPICall(url: String, airport: String? = nil, key: String? = nil, completionHandler: @escaping ([String]) -> Void) {

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
