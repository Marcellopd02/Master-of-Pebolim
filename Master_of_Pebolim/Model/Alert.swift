//
//  Alert.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 27/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import UIKit

class Alert{
    func createAlert(team: String, draw: Bool?) -> UIAlertController{
        let alertController = UIAlertController(title: "PARABÉNS!", message: "Time \(team) venceu!", preferredStyle: .alert)
        let backAlertAction = UIAlertAction(title: "Voltar", style: .cancel, handler: nil)
        alertController.addAction(backAlertAction)
        if let draw = draw{
            if draw{
                alertController.title = "Empate"
                alertController.message = "Não há vencedores"
                return alertController
            }
        }
        return alertController
    }
}
