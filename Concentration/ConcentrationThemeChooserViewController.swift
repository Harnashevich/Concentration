//
//  ConsentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Andrei Harnashevich on 13.07.23.
//

import UIKit

class ConsentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷️🎳⛳️",
        "Animals": "🐶🐔🦊🐼🦀🐪🐓🐋🐙🦄🐵",
        "Faces": "😀😂😎😫😰😴😵‍💫🤔😘😷",
    ]
    

    
//    @IBAction func changeTheme(_ sender: Any) {
//        performSegue(withIdentifier: "Choose Theme", sender: sender)
//    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as?  UIButton)?.currentTitle, let theme = themes[themeName]  {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
}


