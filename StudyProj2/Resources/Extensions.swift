//
//  Extensions.swift
//  StudyProj2
//
//  Created by Pratap Eknath Abhang on 17/09/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
