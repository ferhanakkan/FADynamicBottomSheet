//
//  FADynamicBottomSheet.swift
//  
//
//  Created by Ferhan Akkan on 12.02.2022.
//

import UIKit

public final class FADynamicBottomSheet: UIViewController {

    // MARK: - Computed Properties
    var dismissibleHeight: CGFloat {
        return defaultHeight * 0.2
    }

    var maximumContainerHeight: CGFloat {
        view.frame.height - (Constant.topOffset.rawValue + view.safeAreaInsets.top)
    }
    
    // MARK: - Properties
    var currentContainerHeight: CGFloat = .zero
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?

    weak var delegate: FADynamicBottomSheetOutputProtocol?

    var inputContainerView: UIView?
    var defaultHeight: CGFloat = .zero

    let topBar: UIView = {
        let view  = UIView()
        view.prepareForNSLayout()
        view.backgroundColor = .black.withAlphaComponent(0.08)
        view.layer.cornerRadius = 2
        view.clipsToBounds = true
        return view
    }()

    let containerScrollView: FAScrollView = {
        let view  = FAScrollView()
        view.prepareForNSLayout()
        view.layer.cornerRadius = Constant.containerRadius.rawValue
        view.backgroundColor = .white
        return view
    }()

    let backgroundView: UIView = {
        let view = UIView()
        view.prepareForNSLayout()
        view.alpha = 0
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()

    /// - TAG: Initialization
    init(inputContainerView: UIView) {
        self.inputContainerView = inputContainerView

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// - TAG: Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        commonInit()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animateShowBackgroundView()
        animatePresentContainer()
    }

    func commonInit() {
        guard let inputContainerView = inputContainerView else { return }
        setupView()
        setConstraints(with: inputContainerView)
        setupPanGesture()
        setupTapGesture()
    }
}

