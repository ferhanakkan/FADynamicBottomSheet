//
//  NSLayoutConstraints+Extensions.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

public extension NSLayoutConstraint {

    @discardableResult
    func activate() -> Self {
        NSLayoutConstraint.activate([self])
        return self
    }
}
