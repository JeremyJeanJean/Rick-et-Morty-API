//
//  SettingsController.swift
//  Rick et Morty API
//
//  Created by Jeremy Piris on 22/02/2019.
//  Copyright © 2019 Jeremy Piris. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwitch()
        setupNameLabel()

    }
    
    func setupSwitch() {
        statusSwitch.setOn(UserDefaultsHelper().getStatus(), animated: true)
        statusLbl.text = "Statut: " + UserDefaultsHelper().getStatusString()

    }
    
    func setupNameLabel() {
        let name = UserDefaultsHelper().getName()
        if name == "" {
            nameTF.placeholder = "Entrez un prénom"
        } else {
            nameTF.text = name
        }
    }
    

    @IBAction func saveAction(_ sender: Any) {
        UserDefaultsHelper().setName(string: nameTF.text)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SwitchChanged(_ sender: UISwitch) {
        UserDefaultsHelper().setStatus(bool: sender.isOn)
        setupSwitch()
    }
    

}
