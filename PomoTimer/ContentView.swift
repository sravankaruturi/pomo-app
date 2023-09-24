//
//  ContentView.swift
//  PomoTimer
//
//  Created by Sravan Karuturi on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var formatter = DateComponentsFormatter()
    
    var body: some View {

        VStack{
            
            Text("Time Left")
                .font(.largeTitle)
                .padding(50)
            
            ZStack{
                
                VStack{
                    
                    Text(vm.time)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .alert("Timer Done!", isPresented: $vm.showingAlert){
                            Button("Continue", role: .cancel){
                                
                            }
                        }
                    
                    Slider(value: $vm.minutes, in: 1...25, step: 1)
                        .padding()
                        .frame(width: 200)
                        .disabled(vm.isActive)
                        .animation(.easeInOut, value: vm.minutes)
                    
                }
                .padding()
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(Circle().trim(from: 0.0, to: CGFloat(vm.percentageDone)).stroke(style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round,
                        lineJoin: .round
                    )).foregroundColor(.orange)
                    )
                
            }
            
            HStack(spacing: 10){
                Button(action: StartTimer, label: {Text("Start Timer")})
                    .disabled(vm.isActive)
                
                Button(action: ResetTimer, label: {Text("Reset Timer")})
                    .tint(.red)
            }
            .padding()
            .buttonStyle(.bordered)
        }
        .padding()
        .onReceive(timer, perform: { _ in
            vm.updateCountDown()
        })
    }
    
    func StartTimer(){
        vm.start(minutes: vm.minutes)
    }
    
    func ResetTimer(){
        vm.reset()
    }
    
}

#Preview {
    ContentView()
}
