//
//  ConfigViewModel.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 12/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import Foundation

class ConfigViewModel {
    
    static private var mode = false
    
    //MARK: - Let of another screen
    let conventional = ConventionalGameViewModel()
    
    //MARK: - Data Passing
    func passLimits(time: String, points: String, timePlaceholder: String, pointsPlaceholder: String) -> Bool{
        
        resetCountForMode()
        if time == "0" || points == "0"{
            return false
        }
        if time == ""{
            conventional.setString(type: "T", string: timePlaceholder)
        }else{
            conventional.setString(type: "T", string: time)
        }
        if points == ""{
            conventional.setString(type: "P", string: pointsPlaceholder)
        }else{
            conventional.setString(type: "P", string: points)
        }
        return true
    }
    
    func getLimits(_ string: String) -> String{
        
        if string == "P"{
            let pointLimit = conventional.getLimits(string: "P")
            if pointLimit != ""{
                return pointLimit
            }
        }else{
            let timeLimit = conventional.getLimits(string: "T")
            if timeLimit != ""{
                return timeLimit
            }
        }
        return "3"
    }
    
    func changeMode(_ bool: Bool){
        
        ConfigViewModel.mode = bool
        if ConfigViewModel.mode {
            conventional.setMode(ConfigViewModel.mode)
        }else{
            conventional.setMode(ConfigViewModel.mode)
        }
    }
    
    func getMode() -> Bool{
        
        return ConfigViewModel.mode
    }
    
    private func resetCountForMode(){
        conventional.blueCounter = 1
        conventional.redCounter = 1
    }
}
