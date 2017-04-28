//
//  Endpoints.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/26/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation
import UIKit

struct Help {
    
    /**
     This static method wraps the alerController for convenience
     
     - parameter title: title to be displayed.
     - parameter message: message to be shown on popup.
     - paramter myView: presenter view to be display alert 
     
     */
    static func alert(title: String, message: String, myView: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Ok")
        }
        alertController.addAction(okAction)
        myView.present(alertController, animated: true, completion: nil)
    }
}
