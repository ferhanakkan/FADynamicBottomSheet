//
//  Animations.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

// MARK: - Animastions
extension FADynamicBottomSheet {

    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.containerViewHeightConstraint?.constant = height
            self?.view.layoutIfNeeded()
        }
        currentContainerHeight = height
    }

    func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.containerViewBottomConstraint?.constant = 0
            self?.view.layoutIfNeeded()
        }
    }

    func animateShowBackgroundView() {
        backgroundView.alpha = 0
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.backgroundView.alpha = 1
        }
    }

    func animateDismissView() {
        backgroundView.alpha = 1
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            self.backgroundView.alpha = 0
            self.containerViewBottomConstraint?.constant = self.containerScrollView.frame.height
            self.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.dismiss(animated: true) {
                self.delegate?.faDynamicBottomSheet(self)
            }
        }
    }
}
