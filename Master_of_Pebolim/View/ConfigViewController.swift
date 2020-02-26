//
//  ConfigViewController.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 12/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    let viewModel = ConfigViewModel()

    @IBOutlet weak var timeLimit: UITextField!
    @IBOutlet weak var pointLimit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    @IBAction func saveConfig(_ sender: UIButton) {
        guard let time = timeLimit.text, let point = pointLimit.text else {return}
        viewModel.passLimits(time: time, points: point)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func restaureConfig(_ sender: UIButton) {
        viewModel.passLimits(time: "3", points: "3")
        navigationController?.popViewController(animated: true)
    }
}
