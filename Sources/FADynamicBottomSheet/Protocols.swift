//
//  Protocols.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

public protocol FADynamicBottomSheetProtocol: AnyObject {
    /// Need to call this function to dismiss.
    func dismissFADynamicBottomSheet()
}

public protocol FADynamicBottomSheetOutputProtocol: AnyObject {
    /// Will inform delegate is faDynamicBottomSheet is on top.
    func faDynamicBottomSheet(_ view: FADynamicBottomSheet, didContainerSlideWith container: UIView, isOnTop: Bool)


    /// Will inform delegate dismiss process completed.
    func faDynamicBottomSheet(_ didDismissCompletedWith: FADynamicBottomSheet)
}

public extension FADynamicBottomSheetOutputProtocol {
    func faDynamicBottomSheet(_ view: FADynamicBottomSheet, didContainerSlideWith container: UIView, isOnTop: Bool) {}
}
