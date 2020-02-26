//
//  ConvencionalGameViewController.swift
//  Master_of_Pebolim
//
//  Created by Marcello Pontes Domingos on 10/02/20.
//  Copyright © 2020 BRQ. All rights reserved.
//

import UIKit

class ConventionalGameViewController: UIViewController {

    //MARK: - Let ViewModel
    let viewModel = ConventionalGameViewModel()
    
    //MARK: - Outlet's
    @IBOutlet weak var redPointLabel: UILabel!
    @IBOutlet weak var bluePointLabel: UILabel!
    @IBOutlet weak var counterTimeLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        redPointLabel.text = "0"
        bluePointLabel.text = "0"
        viewModel.setInitialTime()
        counterTimeLabel.text = viewModel.timeLeft
        self.navigationController?.isNavigationBarHidden = false
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    //MARK: Methods of orientation
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    //MARK: Objc Method of time in label
    @objc func setTime(){
        counterTimeLabel.text = viewModel.timeLeft
    }
    
    //MARK: - Action's
    @IBAction func addRedPoint(_ sender: UIButton) {
        
        guard let string = redPointLabel.text else { return }
        redPointLabel.text = viewModel.addInCount(string: string)
    }
    
    @IBAction func subRedPoint(_ sender: UIButton) {
        
        guard let string = redPointLabel.text else { return }
        redPointLabel.text = viewModel.subInCount(string: string)
    }
    
    @IBAction func addBluePoint(_ sender: UIButton) {
        
        guard let string = bluePointLabel.text else { return }
        bluePointLabel.text = viewModel.addInCount(string: string)
    }
    
    @IBAction func subBluePoint(_ sender: UIButton) {
        
        guard let string = bluePointLabel.text else { return }
        bluePointLabel.text = viewModel.subInCount(string: string)
    }
    
    @IBAction func playAndPauseTimer(_ sender: UIButton) {
        
        viewModel.startAndPauseTimer()
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        viewModel.resetTimer()
        counterTimeLabel.text = viewModel.timeLeft
        redPointLabel.text = "0"
        bluePointLabel.text = "0"
    }
}
