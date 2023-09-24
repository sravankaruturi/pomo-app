//
//  ContentView.swift
//  PomoTimer
//
//  Created by Sravan Karuturi on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progressTime = 1500
    @State private var timer: Timer?
    @State private var isRunning = false
    
    var minutes: Int{
        progressTime/60
    }
    
    var seconds: Int{
        progressTime % 60
    }
    
    var progressBar: CGFloat{
        CGFloat(progressTime)/1500
    }
    
    private var formatter = DateComponentsFormatter()
    
    var body: some View {

        VStack{
            
            Text("Time Left")
                .font(.largeTitle)
                .padding(50)
            
            ZStack{
                
                let minString = String(format: "%02d", minutes)
                let secString = String(format: "%02d", seconds)
                Text("\(minString):\(secString)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(Circle().trim(from: 0.0, to: progressBar).stroke(style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round,
                        lineJoin: .round
                    )).foregroundColor(.orange)
                    )
                
            }
            
            HStack(spacing: 10){
                Button(action: StartTimer, label: {Text("Start Timer")})
                Button(action: PauseTimer, label: {Text("Pause Timer")})
            }
            .padding()
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    func StartTimer(){
        progressTime = 1500
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            progressTime -= 1
        })
    }
    
    func PauseTimer(){
        if isRunning{
            timer?.invalidate()
        }else{
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                progressTime -= 1
            })
        }
    }
    
}

#Preview {
    ContentView()
}
