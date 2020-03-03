//
//  ConfigViewModel.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 12/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import Foundation

class ConfigViewModel {
    
    //MARK: - Let of another screen
    let conventional = ConventionalGameViewModel()
    
    //MARK: - Data Passing
    func passLimits(time: String, points: String) -> Bool{
        if time == "0" || points == "0"{
            return false
        }
        conventional.setString(type: "T", string: time)
        conventional.setString(type: "P", string: points)
        return true
    }
}
