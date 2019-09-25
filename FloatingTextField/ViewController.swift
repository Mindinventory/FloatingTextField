//
//  ViewController.swift
//  FloatingTextField
//
//  Created by mac-0005 on 04/07/19.
//  Copyright © 2019 mac-0005. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cnNavHieght: NSLayoutConstraint! {
        didSet {
            cnNavHieght.constant = 64
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: FloatingTextFieldDelegate {
    
    func floatingTextFieldRightViewClick(_ textField: UITextField) {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
    }
    
    func floatingTextFieldLeftViewClick(_ textField: UITextField) {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
    }
    
}

