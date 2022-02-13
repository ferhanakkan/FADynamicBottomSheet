//
//  FAScrollView.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

final class FAScrollView: UIScrollView {

    let containerView: UIView = {
        let view = UIView()
        view.prepareForNSLayout()
        return view
    }()

    // MARK: - Initilizer
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        layout()
    }

    private func layout() {
        addSubview(containerView)
        containerView.pinToSuperView()
        containerView.widthAnchor.constraint(equalTo: self.widthAnchor).activate()
    }
}
