//
//  ConfigViewController.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 12/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    //MARK: - Let ViewModel
    let viewModel = ConfigViewModel()

    //MARK: - Outlet's
    @IBOutlet weak var timeLimit: UITextField!
    @IBOutlet weak var pointLimit: UITextField!
    @IBOutlet weak var switchMode: UISwitch!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        timeLimit.placeholder = viewModel.getLimits("T")
        pointLimit.placeholder = viewModel.getLimits("P")
        switchMode.isOn = viewModel.getMode()
    }
    
    //MARK: Methods of orientation
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        
        return true
    }
    
    //MARK: - Action's
    @IBAction func saveConfig(_ sender: UIButton) {
        
        guard let time = timeLimit.text, let point = pointLimit.text else {return}
        guard let timePlaceholder = timeLimit.placeholder, let pointPlaceholder = pointLimit.placeholder else {return}
        if viewModel.passLimits(time: time, points: point, timePlaceholder: timePlaceholder, pointsPlaceholder: pointPlaceholder){
            navigationController?.popViewController(animated: true)
        }else{
            present(Alert().alertConfig(), animated: true, completion: nil)
        }
    }
    
    @IBAction func restaureConfig(_ sender: UIButton) {
        
        timeLimit.text = "3"
        pointLimit.text = "3"
        switchMode.isOn = false
        viewModel.changeMode(switchMode.isOn)
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        
        if switchMode.isOn {
            viewModel.changeMode(switchMode.isOn)
        }else{
            viewModel.changeMode(switchMode.isOn)
        }
    }
}
