//
//  Helpers.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

extension FADynamicBottomSheet {

    func getSafeAreaInset() -> CGFloat {
        // -TODO: Can remove but after iOS 13 developer can delete Scene delegate and there will be triggered.
        if let windowBottomSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            return windowBottomSafeArea
        }

        if let windowBottomSafeArea = UIApplication.shared.windows.first?.safeAreaInsets.bottom {
            return windowBottomSafeArea
        }
        return .zero
    }

    func calculateDefaultHeight(with newHeight: CGFloat) -> CGFloat {
        newHeight > maximumContainerHeight ? maximumContainerHeight * 0.7 : newHeight
    }
}
