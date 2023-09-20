//
//  ContentView.swift
//  PomoTimer
//
//  Created by Sravan Karuturi on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var endTime: Date = Date(timeInterval: 1500, since: Date())
    
    private var formatter = DateComponentsFormatter()
    
    var body: some View {
        VStack (spacing: 50) {
            Text("Time Left")
                .font(.subheadline)
            
            let currTime = Date()
            let timeInt = currTime.distance(to: endTime)
            
            Text(formatter.string(from: timeInt)!)
            
            Button(action: ResetTimer, label: {Text("Reset Timer")})
            
        }
        .padding()
    }
    
    func ResetTimer(){
        endTime = Date(timeInterval: 1500, since: Date())
    }
}

#Preview {
    ContentView()
}
