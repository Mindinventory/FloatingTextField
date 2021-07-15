//
//  ViewController.swift
//  FloatingTextField
//
//  Created by mac-0005 on 04/07/19.
//  Copyright © 2019 mac-0005. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var btnRadio: UIButton!
    @IBOutlet weak var cnNavHieght: NSLayoutConstraint! {
        didSet {
            cnNavHieght.constant = 64
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnSignup.layer.cornerRadius = CGFloat(15)
        btnSignup.clipsToBounds = true
        
    }

    
}

//MARK:- left and right button events of FloatingTextField
extension ViewController: FloatingTextFieldDelegate {
    
    func floatingTextFieldRightViewClick(_ textField: UITextField) {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
        
        
        if let view = textField.rightView as? UIButton {
            if view.tag == 0 {
                if #available(iOS 13.0, *) {
                    view.tag = 1
                    view.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                } else {
                    // Fallback on earlier versions
                }
            } else {
                view.tag = 0
                if #available(iOS 13.0, *) {
                    view.setImage(UIImage(systemName: "eye"), for: .normal)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
    func floatingTextFieldLeftViewClick(_ textField: UITextField) {
        //textField.isSecureTextEntry = !textField.isSecureTextEntry
        /// do neccessory code here on left button tap of textfield
        
    }
    
    func floatingTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let bool = (textField.textContentType == .telephoneNumber ? (textField.text?.count ?? 0 < 10) : true)
        
        return bool
    }
    
}

extension ViewController {
    
    @IBAction func onSelectRadiobtn(_ sender: UIButton) {
        
        if sender.tag == 0 {
            sender.tag = 1
            btnRadio.setImage(UIImage(named: "ic_btn_radio_select"), for: .normal)
        } else {
            sender.tag = 0
            btnRadio.setImage(UIImage(named: "ic_btn_radio_unselect"), for: .normal)
        }
    }
}
