//
//  LaunchAnimationView.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 15.08.2022.
//

import UIKit

final class LaunchAnimationView: UIView {
    // MARK: - Enums

    private enum Constants {
        static let logoImage: UIImage? = UIImage(systemName: "cart", withConfiguration: symbolConfiguration)
        private static let symbolConfiguration: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(
            pointSize: 100,
            weight: .medium,
            scale: .large
        )
    }

    // MARK: - UI properties

    private lazy var logoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: Constants.logoImage)
        imageView.tintColor = .white

        return imageView.prepareForAutoLayout()
    }()

    // MARK: - Public methods

    func startAnimation(with case: LaunchAnimationState) {
        // swiftlint:disable switch_case_alignment
        switch `case` {
            case .scale:
                scaleAnimation()
            case .move:
                moveAnimation()
            case .rotate:
                rotateAnimation()
            case .none:
                break
        }
        // swiftlint:enable switch_case_alignment
    }

    // MARK: - Life cycle

    init() {
        super.init(frame: .zero)
        addSubview(logoImageView)
        logoImageView.setToCenterSuperview()
    }

    override func setNeedsLayout() {
        super.setNeedsLayout()
        setMainGradientBackground()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Animations
private extension LaunchAnimationView {
    func scaleAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn) {
            self.logoImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        } completion: { _ in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn) {
                self.logoImageView.transform = CGAffineTransform(scaleX: 5, y: 5)
                self.logoImageView.alpha = 0
            }
        }
    }

    func moveAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
            self.logoImageView.frame.origin.x = self.frame.origin.x
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn) {
                self.logoImageView.frame.origin.x = UIScreen.main.bounds.maxX
                self.logoImageView.alpha = 0
            }
        }
    }

    func rotateAnimation() {
        UIView.animate(withDuration: 1, delay: 1.0, options: .curveEaseIn) {
            self.logoImageView.transform = CGAffineTransform(rotationAngle: .pi)
            self.logoImageView.transform = CGAffineTransform(scaleX: 10, y: 10)
            self.logoImageView.alpha = 0
        }
    }
}
