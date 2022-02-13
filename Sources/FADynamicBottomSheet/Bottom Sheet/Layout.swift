//
//  Layout.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

extension FADynamicBottomSheet {

    func setupView() {
        view.backgroundColor = .clear
    }

    func setConstraints(with inputContainerView: UIView) {
        view.addSubview(backgroundView)
        view.addSubview(containerScrollView)
        containerScrollView.addSubview(topBar)

        backgroundView.pinToSuperView()

        containerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        containerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()

        topBar.centerXAnchor.constraint(equalTo: containerScrollView.centerXAnchor).activate()
        topBar.topAnchor.constraint(equalTo: containerScrollView.topAnchor, constant: 16).activate()
        topBar.heightAnchor.constraint(equalToConstant: 4).activate()
        topBar.widthAnchor.constraint(equalToConstant: 44).activate()

        containerScrollView.addSubview(inputContainerView)
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        inputContainerView.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 16).activate()
        inputContainerView.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor).activate()
        inputContainerView.leadingAnchor.constraint(equalTo: containerScrollView.leadingAnchor).activate()
        inputContainerView.trailingAnchor.constraint(equalTo: containerScrollView.trailingAnchor).activate()

        self.view.layoutIfNeeded()
        defaultHeight = calculateDefaultHeight(with: containerScrollView.frame.height + getSafeAreaInset())
        currentContainerHeight = defaultHeight

        containerViewHeightConstraint = containerScrollView.heightAnchor.constraint(equalToConstant: defaultHeight).activate()
        containerViewHeightConstraint?.priority = .defaultHigh

        containerViewBottomConstraint = containerScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight).activate()
    }
}
