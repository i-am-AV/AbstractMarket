//
//  UIViewExtension.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 10.08.2022.
//

import UIKit

// MARK: - Layout
extension UIView {
    /// Метод, устанавливающий свойство **translatesAutoresizingMaskIntoConstraints** в значение *false*
    /// - Returns: Возвращает сам элемент
    func prepareForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func setToCenterSuperview() {
        guard let superview = superview else {
            assertionFailure("Superview не задан.")
            return
        }
        NSLayoutConstraint.activate(
            [
                centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ]
        )
    }
}

// MARK: - Gradient
extension UIView {
    /// Метод, устанавливающий основной градиент приложения на фон элемента
    /// - Parameters:
    ///   - colors: Массив цветов градиента
    ///   - startPoint: Начальная точка градиента. Устанавливается первый цвет из массива
    ///   - endPoint: Конечная точка градиента.
    func setMainGradientBackground(
        colors: [CGColor] = CGColor.mainGradient,
        startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
        endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)
    ) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds

        // Устанавливаем слой с градиентом на нулевую позицию, чтобы не перекрывать другие элементы
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
