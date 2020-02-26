//
//  ConvencionalGameViewModel.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 10/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import Foundation

class ConventionalGameViewModel {
    
    //MARK: - Static vars
    static var timeLimit: String = ""
    static var pointLimit: String = ""
    
    //MARK: - Vars
    var timer: Timer?
    var count: Int = 180
    var timeLeft = "3:00"
    var running = false
    
    //MARK: - Iniciate View
    func setString(type: String, string : String){
        if type == "P"{
            ConventionalGameViewModel.pointLimit = string
        }else if type == "T" {
            ConventionalGameViewModel.timeLimit = string
        }
    }
    
    func setInitialTime(){
        if ConventionalGameViewModel.timeLimit == ""{
            count = 180
            timeLeft = "3:00"
        }else{
            count = Util().convertStringToInt(string: ConventionalGameViewModel.timeLimit) * 60
            let min = (count%3600)/60
            timeLeft = "\(min):00"
        }
    }
    
    //MARK: - Points
    func addInCount(string: String) -> String{
        
        var limit = Util().convertStringToInt(string: ConventionalGameViewModel.pointLimit)
        var interger = Util().convertStringToInt(string: string)
        if ConventionalGameViewModel.pointLimit == ""{
            limit = 3
            if interger < limit{
                interger += 1
            }
        }else{
            if interger < limit{
                interger += 1
            }
        }
            
        return Util().convertIntToString(int: interger)
    }
    
    func subInCount(string: String) -> String{
        
        var interger = Util().convertStringToInt(string: string)
        if interger > 0{
            interger -= 1
            return Util().convertIntToString(int: interger)
        }
        return "0"
    }
    
    //MARK: - Timer
    func startAndPauseTimer(){
        
        if running == false {
            running = true
            if timer == nil{
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(subTimer), userInfo: nil, repeats: true)
            }
        }else{
            self.stopTimer()
        }
    }
    
    func resetTimer(){
        
        self.stopTimer()
        setInitialTime()
    }
    
    private func stopTimer(){
        
        running = false
        timer?.invalidate()
        timer = nil
    }
    
    @objc func subTimer(){
        
        if count == 0 {
            stopTimer()
        }else{
            count -= 1
            let min = (count%3600)/60
            let sec = (count%3600)%60
            timeLeft = "\(min):\(sec)"
        }
    }
}
