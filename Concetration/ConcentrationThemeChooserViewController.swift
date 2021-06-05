//
//  ConcentrationThemeChooserViewController.swift
//  Concetration
//
//  Created by Saber on 03/06/2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    
    var themes = ["Sports": "⚽️🏀🏈⚽️🏀🏈",
                  "Animals": "🐱🐕‍🦺🦊🐱🐕‍🦺🦊",
                  "Faces": "🔥👻😁👈🏻🥸👺"]
    override class func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Show Theme" :
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                    lastSeguedToViewcontroller = cvc
                }
            }
        default:
            break
        }
    }
    private var splitDetailsConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    private var lastSeguedToViewcontroller: ConcentrationViewController?
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitDetailsConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                    cvc.theme = theme
            } else if let cvc = lastSeguedToViewcontroller {
                navigationController?.pushViewController(cvc, animated: true)
            }
        } else {
        
        performSegue(withIdentifier: "Show Theme", sender: sender)
    }
    }
}
