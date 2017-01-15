//
//  ViewController.swift
//  TipCalulator
//
//  Created by David Cohen on 15/01/2017.
//  Copyright © 2017 David Cohen. All rights reserved.
//

import UIKit

// L'appel de UITextFieldDelegate permet la prise en charge des fonctions inclus, comme renitialiser le texte des qu'on clique dessus.

class ViewController: UIViewController, UITextFieldDelegate {
    
    var pourcentagePourboire:Int?
    
    // Déclaration des Outlet du storyboard -> Connection avce le code.
    
    @IBOutlet weak var montantFactureTextField: UITextField!
    
    @IBOutlet weak var pourboireSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var pourboireLabel: UILabel!
    
    @IBOutlet weak var montantTotalLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Déclaration de l'action des SegmentedControl sur sur la function pour changer de valeur.
        
        pourboireSegmentedControl.addTarget(self, action: #selector(ViewController.calculerPourcentage), for: UIControlEvents.valueChanged)
        
        // Déclaration de l'action du UITextFieldDelegate sur notre View. Ont lui indique bien qu'elle est FirstResponder.
        
        montantFactureTextField.delegate = self
        montantFactureTextField.becomeFirstResponder()
        
        
    }
    
    func calculerPourcentage() {
        // Ont indique l'index du SegmentedControl
        switch pourboireSegmentedControl.selectedSegmentIndex {
        case 0:
            print("Segement selectione : \(pourboireSegmentedControl.selectedSegmentIndex)")
            pourcentagePourboire = 15
        case 1:
            print("Segement selectione : \(pourboireSegmentedControl.selectedSegmentIndex)")
            pourcentagePourboire = 20
        case 2:
            print("Segement selectione : \(pourboireSegmentedControl.selectedSegmentIndex)")
            pourcentagePourboire = 25
        default:
            print("Pas de selection")
        }
        calculerPourboire(pourcent: Float(pourcentagePourboire!))
    }
    
    func calculerPourboire(pourcent:Float) {
        let pourboire = Float(montantFactureTextField.text!)! * pourcent / 100
        
        let montant = Float(montantFactureTextField.text!)
        
        // NSString nous permet d'indiquer que nous voulons 2 chiffres apres la virgule.
        let pourboireFormatStr = NSString(format: "%.2f", pourboire)
        let montantTotalFormatStr = NSString(format: "%.2f", pourboire + montant!)
        
        
        
        
        pourboireLabel.text = "$ \(pourboireFormatStr)"
        montantTotalLabel.text = "$ \(montantTotalFormatStr)"
    }
    
    // Ont appel une fonction UITextFieldDelegate qui permet de dire qu'ont peut commencer à ecrire.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        montantFactureTextField.text = ""
    }
    
    // Function qui nous permet de retirer le clavier lorsqu'ont touche une partie de l'écran. 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

