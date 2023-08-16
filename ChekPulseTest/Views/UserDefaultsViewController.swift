//
//  UserDefaultsViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 16.08.23.
//

import UIKit

class UserDefaultsViewController: UIViewController {
    
    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let switchState = UserDefaults.standard.switchIsOn
        updateBackgrounBySwitsh(isOn:switchState)
        
        let user = User(firstName: "FiestName", lastName: "LastName")
        let user2 = User(firstName: "Fi2222", lastName: "222222")
    
        UserDefaults.standard.isUserSigned = user
        UserDefaults.standard.isUserSigned = user2
        print("the signed \(UserDefaults.standard.isUserSigned)")
    }


    @IBAction func switchToggled(_ sender: UISwitch) {
        updateBackgrounBySwitsh(isOn:sender.isOn)
        UserDefaults.standard.switchIsOn = sender.isOn
    }
    
    private func updateBackgrounBySwitsh(isOn: Bool){
        view.backgroundColor = isOn ? .orange : .darkGray
        switchView.isOn = isOn
    }
}
