//
//  ATISRow.swift
//  vZHU IDS
//
//  Created by Joshua Seagrave on 12/11/20.
//

import SwiftUI

struct ATISRow: View {
    
    @ObservedObject var atisModel: ATISModel = ATISModel()
    @State var showDetail = false
    
    var facility : airport
    
    init(facility: airport) {
        self.facility = facility
    }
    
    var body: some View {
        
        VStack {
            Text(facility.airport).font(.system(size: 36)).bold().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                if(atisModel.response.count > 0) {
                    Spacer()
                    Text(atisModel.response[2])
                        .font(.system(size: 36)).bold()
                    Spacer()
                    Spacer()
                }
                  
                if(atisModel.response.count > 0){
                    Text(atisModel.response[3]).frame(maxWidth: .infinity, alignment: .leading).multilineTextAlignment(.leading).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                } else {
                    Text("No ATIS Found.").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
        }
        .onTapGesture {
            self.showDetail.toggle()
        }
        .onAppear {
            self.atisModel.getATISResults(facility: self.facility.airport)
        }
        .sheet(isPresented: $showDetail) {
            ATISDetailView(details: atisModel.response, airport: facility.airport)
        }
    }
}

extension ATISRow {
    
    class ATISModel: ObservableObject {
        
        //@Published private(set) var response = vAtisResponse()
        @Published private(set) var response : [String] = []
                
        func getATISResults(facility: String) {
            HandleAPICall(url: vatis_url, airport: facility) { [weak self] result in
                print(result)
                self?.response = result
            }
        }
    }
}
