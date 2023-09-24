//
//  ContentViewModel.swift
//  PomoTimer
//
//  Created by Sravan Karuturi on 9/24/23.
//

import Foundation

extension ContentView{
    
    final class ViewModel : ObservableObject {
        
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "5:00"
        @Published var minutes: Float = 5.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        private var seconds: Float = 0.0
        
        var percentageDone: Float{
            if !isActive{
                return 1.0
            }
            
            let totalTime : Float = Float(initialTime) * 60
            let remainingTime : Float = Float(minutes) * 60 + seconds
            let perc = remainingTime / totalTime
            
            print(perc)
            
            return perc
        }
        
        private var initialTime = 0
        private var endDate = Date()
        
        func start(minutes: Float){
            self.initialTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
        
        func reset(){
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        }
        
        func updateCountDown(){
            guard isActive else{
                return
            }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "0:00"
                self.showingAlert = true
                
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.seconds = Float(seconds)
            self.time = String(format: "%02d:%02d", minutes, seconds)
            
        }
        
    }
    
}
