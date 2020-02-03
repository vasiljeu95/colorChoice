//
//  SecondViewController.swift
//  colorChoice
//
//  Created by Stepan Vasilyeu on 2/3/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ViewController
        colorVC.delegate = self
        colorVC.currentColor = view.backgroundColor
    }

}

// MARK: - ColorDelegate
extension SecondViewController: ViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
