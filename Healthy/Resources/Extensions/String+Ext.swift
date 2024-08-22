//
//  String+Ext.swift
//  Healthy
//
//  Created by Alex Neumark on 16.08.2024.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
