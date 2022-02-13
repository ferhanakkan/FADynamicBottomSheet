//
//  FADynamicBottomSheetProtocol.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import Foundation

extension FADynamicBottomSheet: FADynamicBottomSheetProtocol {
    public func dismissFADynamicBottomSheet() {
        animateDismissView()
    }
}
