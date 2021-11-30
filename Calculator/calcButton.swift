//
//  calcButton.swift
//  Calculator
//
//  Created by Mariam Latsabidze on 25.11.21.
//

import UIKit

@IBDesignable class calcButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height/2
        titleLabel?.textAlignment = .center
        
    }
}
