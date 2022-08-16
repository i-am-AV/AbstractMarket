//
//  LaunchAnimationStateGenerator.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 16.08.2022.
//

import Foundation

final class LaunchAnimationStateGenerator: LaunchAnimationStateGeneratorDescription {
    /// Метод рандомного генерирования варианта анимации загрузки
    /// - Returns: Возвращает рандомный кейс анимации
    func generateState() -> LaunchAnimationState {
        guard
            let randomState: LaunchAnimationState = LaunchAnimationState.allCases.randomElement()
        else {
            return .none
        }
        return randomState
    }
}
