//
//  ATISView.swift
//  vZHU IDS
//
//  Created by Joshua Seagrave on 12/4/20.
//

import SwiftUI


struct ATISView: View {

    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            Text("ATIS").font(.system(size: 72)).bold().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            List(airports) { airport in
                ATISRow(facility: airport)
            }
        }
    }
}

struct ATISView_Previews: PreviewProvider {
    static var previews: some View {
        ATISView()
    }
}


