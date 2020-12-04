//
//  APIHandler.swift
//  vZHU IDS
//
//  Created by user188128 on 12/4/20.
//

import Foundation

let vatis_url : String = "zhuartcc.org/api/vatis/"
let tmu_url : String = "zhuartcc.org/api/tmu/"
let tmu_key : String = "$wF%50Wy"

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

func HandleAPICall(url: String, airport: String? = nil, key: String? = nil, completionHandler: @escaping ([String]) -> Void) {
    
    let m_url = URL(string: url + airport!)
    var request = URLRequest(url: m_url!)
    
    if (key != nil) {
        request.addValue(key!, forHTTPHeaderField: "tmu_key")
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
