//
//  UIKitExtension.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 06.06.2024.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
}








