//
//  PanGesture.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

extension FADynamicBottomSheet {

    func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }

    @objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let isDraggingDown = translation.y > 0

        let newHeight = currentContainerHeight - translation.y

        switch gesture.state {
        case .changed:
            if newHeight < maximumContainerHeight {
                containerViewHeightConstraint?.constant = newHeight
                view.layoutIfNeeded()
            }

        case .ended:
            if newHeight < defaultHeight {
                self.animateDismissView()
                delegate?.faDynamicBottomSheet(self, didContainerSlideWith: containerScrollView, isOnTop: false)
            }
            else if newHeight < defaultHeight {
                animateContainerHeight(defaultHeight)
                delegate?.faDynamicBottomSheet(self, didContainerSlideWith: containerScrollView, isOnTop: false)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                animateContainerHeight(defaultHeight)
                delegate?.faDynamicBottomSheet(self, didContainerSlideWith: containerScrollView, isOnTop: false)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                animateContainerHeight(maximumContainerHeight)
                delegate?.faDynamicBottomSheet(self, didContainerSlideWith: containerScrollView, isOnTop: true)
            }
        default:
            break
        }
    }
}
