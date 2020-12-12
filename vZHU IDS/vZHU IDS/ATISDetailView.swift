//
//  ATISDetailView.swift
//  vZHU IDS
//
//  Created by Joshua Seagrave on 12/11/20.
//

import SwiftUI

struct ATISDetailView: View {
    
    var details : [String]
    var airport : String
    
    init(details: [String], airport: String) {
        self.details = details
        self.airport = airport
    }
    
    var body: some View {
        
        VStack (spacing: 50) {
            Spacer()
            Text(airport).font(.system(size: 36)).bold().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            if(details.count > 0) {
                VStack (alignment: .leading, spacing: 10) {
                    Text("ATIS " + details[2]).bold().font(.system(size: 24)).bold().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.bottom, 30.0)
                    Text("Conditions:").bold()
                    Text(details[3])
                    Text("NOTAM:").bold()
                    Text(details[4])
                }.padding(.horizontal, 30.0)
                
            } else {
                Text("No ATIS available.").padding(.top, 50.0)
            }
            Spacer()
            Spacer()
        }
    }
}

struct ATISDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ATISDetailView(details: [], airport: "")
    }
}
