//
//  UIView+Extensions.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

extension UIView {

    func prepareForNSLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func pinToSuperView() {
        guard let superview = superview else {
            assertionFailure("The View you want to pin haven't superview")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
