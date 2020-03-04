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
    @IBOutlet weak var redLimitLabel: UILabel!
    @IBOutlet weak var blueLimitLabel: UILabel!
    @IBOutlet weak var redAddButton: UIButton!
    @IBOutlet weak var blueAddButton: UIButton!
    @IBOutlet weak var redSubButton: UIButton!
    @IBOutlet weak var blueSubButton: UIButton!
    @IBOutlet weak var redPointsInMode: UILabel!
    @IBOutlet weak var bluePointsInMode: UILabel!
    
    //MARK: - Methods of Class
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if viewModel.isTrue(){
            redPointsInMode.text = "0/2"
            bluePointsInMode.text = "0/2"
        }else{
            redPointsInMode.text = ""
            bluePointsInMode.text = ""
        }
        viewModel.setInitialTime()
        defaultValues()
        redLimitLabel.text = viewModel.getPointLimit()
        blueLimitLabel.text = viewModel.getPointLimit()
        counterTimeLabel.text = viewModel.timeLeft
        self.navigationController?.isNavigationBarHidden = false
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func defaultValues(){
        
        viewModel.resetTimer()
        counterTimeLabel.text = viewModel.timeLeft
        redPointLabel.text = "0"
        bluePointLabel.text = "0"
        redAddButton.isEnabled = false
        blueAddButton.isEnabled = false
        redSubButton.isEnabled = false
        blueSubButton.isEnabled = false
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
        if viewModel.end{
            guard let RP = redPointLabel.text, let BP = bluePointLabel.text else { return }
            if viewModel.testTime(bluePoint: BP, redPoint: RP) != nil{
                let winner = viewModel.testTime(bluePoint: BP, redPoint: RP)
                switch winner {
                case .blueWinner:
                    if viewModel.isTrue(){
                        if viewModel.blueCounter < 2{
                            present(Alert().alertMode(), animated: true, completion: nil)
                            viewModel.blueCounter += 1
                            bluePointsInMode.text = "1/2"
                            viewModel.end = false
                            defaultValues()
                        }else{
                            present(Alert().createAlert(team: "Azul", draw: nil), animated: true, completion: nil)
                            viewModel.end = false
                            defaultValues()
                            viewModel.redCounter = 1
                            viewModel.blueCounter = 1
                            redPointsInMode.text = "0/2"
                            bluePointsInMode.text = "0/2"
                        }
                    }else{
                        present(Alert().createAlert(team: "Azul", draw: nil), animated: true, completion: nil)
                        viewModel.end = false
                        defaultValues()
                    }
                    break
                case .redWinner:
                    if viewModel.isTrue(){
                        if viewModel.redCounter < 2{
                            present(Alert().alertMode(), animated: true, completion: nil)
                            viewModel.redCounter += 1
                            redPointsInMode.text = "1/2"
                            viewModel.end = false
                            defaultValues()
                        }else{
                            present(Alert().createAlert(team: "Vermelho", draw: nil), animated: true, completion: nil)
                            viewModel.end = false
                            defaultValues()
                            viewModel.redCounter = 1
                            viewModel.blueCounter = 1
                            redPointsInMode.text = "0/2"
                            bluePointsInMode.text = "0/2"
                        }
                    }else{
                        present(Alert().createAlert(team: "Vermelho", draw: nil), animated: true, completion: nil)
                        viewModel.end = false
                        defaultValues()
                    }
                    break
                case .draw:
                    present(Alert().createAlert(team: "", draw: true), animated: true, completion: nil)
                    viewModel.end = false
                    defaultValues()
                    break
                case .none:
                    //nada
                    break
                }
            }
        }
    }
    
    //MARK: - Action's
    @IBAction func addRedPoint(_ sender: UIButton) {
        
        guard let string = redPointLabel.text else { return }
        if viewModel.addInCount(string: string){
            redPointLabel.text = viewModel.value
        }else{
            if viewModel.isTrue(){
                if viewModel.redCounter < 2{
                    present(Alert().alertMode(), animated: true, completion: nil)
                    viewModel.redCounter += 1
                    redPointsInMode.text = "1/2"
                    defaultValues()
                }else{
                    present(Alert().createAlert(team: "Vermelho", draw: nil), animated: true, completion: nil)
                    defaultValues()
                    viewModel.redCounter = 1
                    viewModel.blueCounter = 1
                    redPointsInMode.text = "0/2"
                    bluePointsInMode.text = "0/2"
                }
            }else{
                present(Alert().createAlert(team: "Vermelho", draw: nil), animated: true, completion: nil)
                defaultValues()
            }
        }
    }
    
    @IBAction func subRedPoint(_ sender: UIButton) {
        
        guard let string = redPointLabel.text else { return }
        redPointLabel.text = viewModel.subInCount(string: string)
    }
    
    @IBAction func addBluePoint(_ sender: UIButton) {
        
        guard let string = bluePointLabel.text else { return }
        if viewModel.addInCount(string: string){
            bluePointLabel.text = viewModel.value
        }else{
            if viewModel.isTrue(){
                if viewModel.blueCounter < 2{
                    present(Alert().alertMode(), animated: true, completion: nil)
                    viewModel.blueCounter += 1
                    bluePointsInMode.text = "1/2"
                    defaultValues()
                }else{
                    present(Alert().createAlert(team: "Azul", draw: nil), animated: true, completion: nil)
                    defaultValues()
                    viewModel.redCounter = 1
                    viewModel.blueCounter = 1
                    redPointsInMode.text = "0/2"
                    bluePointsInMode.text = "0/2"
                }
            }else{
                present(Alert().createAlert(team: "Azul", draw: nil), animated: true, completion: nil)
                defaultValues()
            }
        }
    }
    
    @IBAction func subBluePoint(_ sender: UIButton) {
        
        guard let string = bluePointLabel.text else { return }
        bluePointLabel.text = viewModel.subInCount(string: string)
    }
    
    @IBAction func playAndPauseTimer(_ sender: UIButton) {
        
        redAddButton.isEnabled = true
        blueAddButton.isEnabled = true
        redSubButton.isEnabled = true
        blueSubButton.isEnabled = true
        viewModel.startAndPauseTimer()
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        redAddButton.isEnabled = false
        blueAddButton.isEnabled = false
        redSubButton.isEnabled = false
        blueSubButton.isEnabled = false
        defaultValues()
    }
}
