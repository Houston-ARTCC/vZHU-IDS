//
//  ATISRow.swift
//  vZHU IDS
//
//  Created by Joshua Seagrave on 12/11/20.
//

import SwiftUI

struct ATISRow: View {
    
    @ObservedObject var atisModel: ATISModel = ATISModel()
    @State private var showingAlert = false
    
    var facility : airport
    
    init(facility: airport) {
        self.facility = facility
    }
    
    var body: some View {
        VStack {
            Text(atisModel.response.facility).font(.system(size: 36)).bold()
            Spacer()
            HStack {
                Text(atisModel.response.atis_letter)
                    .font(.system(size: 36)).bold()
                Spacer()
                Text(atisModel.response.airport_conditions)
            }
            Spacer()
        }
        .onAppear {
            self.atisModel.getATISResults(facility: self.facility.airport)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("vATIS"), message: Text("It's all gone really rather wrong!"))
        }
    }
}

extension ATISRow {
    
    class ATISModel: ObservableObject {
        
        @Published private(set) var response = vAtisResponse()
                
        func getATISResults(facility: String) {
            HandleATISAPICall(url: vatis_url, airport: facility) { [weak self] result in
                self?.response = result
            }
        }
    }
}
