//
//  TapGesture.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

extension FADynamicBottomSheet {

    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        backgroundView.addGestureRecognizer(tapGesture)
    }

    @objc private func handleCloseAction() {
        animateDismissView()
    }
}
