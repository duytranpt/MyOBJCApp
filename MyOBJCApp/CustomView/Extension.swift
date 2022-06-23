//
//  Extension.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 21/06/2022.
//

import Foundation

extension String {

    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }

}
