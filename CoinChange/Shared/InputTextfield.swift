//
//  InputTextfield.swift
//  CoinChange
//
//  Created by User23 on 4/7/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class InputTextfield: UIControl {
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var textfield: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.textAlignment = .right
        t.borderStyle = .line
        return t
    }()
    
    @IBInspectable
    var title: String? = nil {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBInspectable
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textfield.keyboardType = keyboardType
        }
    }
    
    @IBInspectable
    var placeHolder: String? = nil {
        didSet {
            textfield.placeholder = placeHolder
        }
    }
    
    var value: String? {
        return textfield.text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        shareInitialization()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shareInitialization()
    }
    
    func shareInitialization() {
        
        addSubview(titleLabel)
        addSubview(textfield)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        textfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        textfield.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        textfield.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textfield.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
