//
//  SettingsPresenter.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/27/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class SettingsPresenter: UIViewController {

    @IBOutlet var usernameTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextBox.text = InstagramUser.username
        
    }
    
    @IBAction func changeUsernameButtonPressed(_ sender: Any) {
        
        InstagramUser.changeUser(newUsername: self.usernameTextBox.text!)
        
        Help.alert(title: "Success", message: "You've changed the name of your stalkee ;)", myView: self)
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
