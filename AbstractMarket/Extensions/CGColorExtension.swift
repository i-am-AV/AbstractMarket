//
//  CGColorExtension.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 15.08.2022.
//

import UIKit

extension CGColor {
    /// Основной градиент приложения
    static var mainGradient: [CGColor] {
        return [startColor, endColor]
    }

    private static var startColor: Self {
        // Устанавливаем цвет в диапазоне от 0 до 1
        Self(red: 52.0/255.0, green: 199.0/255.0, blue: 89.0/255.0, alpha: 1.0)
    }

    private static var endColor: Self {
        Self(red: 0.0/255.0, green: 255.0/255.0, blue: 63.0/255.0, alpha: 1.0)
    }
}
