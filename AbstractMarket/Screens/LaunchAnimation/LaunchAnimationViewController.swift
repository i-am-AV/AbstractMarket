//
//  LaunchAnimationViewController.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 10.08.2022.
//

import UIKit

final class LaunchAnimationViewController: UIViewController {
    private lazy var contentView: LaunchAnimationView = LaunchAnimationView().prepareForAutoLayout()
    private let viewModel: LaunchAnimationViewModel
    private lazy var foregroundWindow: UIWindow = {
        let window: UIWindow = UIWindow()
        // Окно анимации должно находиться на 1 уровень выше главного окна приложения
        window.windowLevel = .normal + 1
        window.rootViewController = self

        return window
    }()

    // MARK: - Life cycle

    init(viewModel: LaunchAnimationViewModel = LaunchAnimationViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - LaunchAnimationDescription
extension LaunchAnimationViewController: LaunchAnimationDescription {
    func displayAnimation() {
        foregroundWindow.isHidden = false
        contentView.startAnimation(with: viewModel.state)
    }

    func dismiss(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.3) {
            self.foregroundWindow.alpha = 0
        } completion: { _ in
            completion?()
        }
    }
}
