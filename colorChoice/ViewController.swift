//
//  ViewController.swift
//  colorChoice
//
//  Created by Stepan Vasilyeu on 11/17/19.
//  Copyright © 2019 Stepan Vasilyeu. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func setColor(_ color: UIColor)
}

protocol ColorData {
    var currentColor: UIColor? { get set }
}

class ViewController: UIViewController, ColorData {

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
    
    var delegate: ViewControllerDelegate?
    var currentColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green

        setViewColor()
        setValueLabel(for: redNumberLabel, greenNumberLabel, blueNumberLabel)
        setValueTextField(for: redNumberTextField, greenNumberTextField, blueNumberTextField)
        
        addDoneButtonTo(redNumberTextField, greenNumberTextField, blueNumberTextField)
    }

    // Изменение цветов слайдерами
    @IBAction func modularRGBSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redNumberLabel.text = stringsSliderValue(from: sender)
            redNumberTextField.text = stringsSliderValue(from: sender)
        case 1:
            greenNumberLabel.text = stringsSliderValue(from: sender)
            greenNumberTextField.text = stringsSliderValue(from: sender)
        case 2:
            blueNumberLabel.text = stringsSliderValue(from: sender)
            blueNumberTextField.text = stringsSliderValue(from: sender)
        default:
            break
        }
        
        setViewColor()
    }
    
    @IBAction func doneButton() {
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // Присваивание цвета View
    private func setViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha:1.0)
    }
    
    private func setValueTextField(for textFields: UITextField...) {
        textFields.forEach { textFields in
            switch textFields.tag {
            case 0: redNumberTextField.text = stringsSliderValue(from: redSlider)
            case 1: greenNumberTextField.text = stringsSliderValue(from: greenSlider)
            case 2: blueNumberTextField.text = stringsSliderValue(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { labels in
            switch labels.tag {
            case 0: redNumberLabel.text = stringsSliderValue(from: redSlider)
            case 1: greenNumberLabel.text = stringsSliderValue(from: greenSlider)
            case 2: blueNumberLabel.text = stringsSliderValue(from: blueSlider)
            default: break
            }
        }
    }
    
    // Значения RGB
    private func stringsSliderValue(from sliders: UISlider) -> String {
        return String(format: "%.2f", sliders.value)
    }

}



// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text Field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.value = currentValue
                setValueLabel(for: redNumberLabel)
            case 1:
                greenSlider.value = currentValue
                setValueLabel(for: greenNumberLabel)
            case 2:
                blueSlider.value = currentValue
                setValueLabel(for: blueNumberLabel)
            default: break
            }
            
            setViewColor()
        } else {
            showAlert(title: "Wrong Format!", message: "Please enter correct value")
        }
    }
    
}



extension ViewController {
    
    // Метод для отображения кнопки "Готово" на цифровой клавиатуре
    private func addDoneButtonTo(_ textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title:"Done",
                                             style: .done,
                                             target: self,
                                             action: #selector(didTapDone))
            
            let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil,
                                                action: nil)
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    // AlertController для показывания сообщения при неправильном вооде цифр, вызывается в другом extension
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlertAction)
        present(alert, animated: true)
    }
}

