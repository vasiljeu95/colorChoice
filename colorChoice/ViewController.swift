//
//  ViewController.swift
//  colorChoice
//
//  Created by Stepan Vasilyeu on 11/17/19.
//  Copyright © 2019 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var redNumberLabel: UILabel!
    @IBOutlet var greenNumberLabel: UILabel!
    @IBOutlet var blueNumberLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redNumberTextField: UITextField!
    @IBOutlet var greenNumberTextField: UITextField!
    @IBOutlet var blueNumberTextField: UITextField!
    
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = .black
        // MARK: Slider
        // red slider
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.tintColor = .red
        // green slider
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.tintColor = .green
        // blue slider
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.tintColor = .blue
        
        // MARK: TextField
        redNumberTextField.text = String(redSlider.value)
        redNumberTextField.textAlignment = .right
        greenNumberTextField.text = String(redSlider.value)
        greenNumberTextField.textAlignment = .right
        blueNumberTextField.text = String(redSlider.value)
        blueNumberTextField.textAlignment = .right
        
        // MARK: Label
        redNumberLabel.text = String(redSlider.value)
        redNumberLabel.textAlignment = .right
        greenNumberLabel.text = String(redSlider.value)
        greenNumberLabel.textAlignment = .right
        blueNumberLabel.text = String(redSlider.value)
        blueNumberLabel.textAlignment = .right
    }

    @IBAction func redSliderAction() {
        redNumberTextField.text = String(redSlider.value)
        redNumberLabel.text = String(redSlider.value)
        
        colorView.backgroundColor = .red
        colorView.backgroundColor = colorView.backgroundColor?.withAlphaComponent(CGFloat(redSlider.value))
        
        colorViewColor()
    }
    
    @IBAction func greenSliderAction() {
        greenNumberTextField.text = String(greenSlider.value)
        greenNumberLabel.text = String(greenSlider.value)
        
        colorView.backgroundColor = .green
        colorView.backgroundColor = colorView.backgroundColor?.withAlphaComponent(CGFloat(greenSlider.value))
        
        colorViewColor()
    }
    
    @IBAction func blueSliderAction() {
        blueNumberTextField.text = String(blueSlider.value)
        blueNumberLabel.text = String(blueSlider.value)
        
        colorView.backgroundColor = .blue
        colorView.backgroundColor = colorView.backgroundColor?.withAlphaComponent(CGFloat(blueSlider.value))
        
        colorViewColor()
    }
    
    func colorViewColor () {

        colorView.backgroundColor = UIColor(
        red: CGFloat(redSlider.value),
        green: CGFloat(greenSlider.value),
        blue: CGFloat(blueSlider.value),
        alpha:1.0)

    }
    
    
    
//    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        let currentValue = Int(sender.value)
//        let backgroundColor = UIColor(
//            red: CGFloat(currentValue),
//            green: CGFloat(currentValue),
//            blue: CGFloat(currentValue),
//            alpha:1.0
//        )
//        self.view.backgroundColor = backgroundColor
//
//    }

}

