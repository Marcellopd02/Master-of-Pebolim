//
//  Util.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 10/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import Foundation

class Util {

    func convertStringToInt(string: String) -> Int{
        
        guard let integer = Int(string) else {return 0}
        return integer
    }
    
    func convertIntToString(int: Int) -> String{
        
        let string = String(describing: int)
        return string
    }
}
