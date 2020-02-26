//
//  ConfigViewModel.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 12/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import Foundation

class ConfigViewModel {
    
    let conventional = ConventionalGameViewModel()
    
    func passLimits(time: String, points: String){
        conventional.setString(type: "T", string: time)
        conventional.setString(type: "P", string: points)
    }
}
