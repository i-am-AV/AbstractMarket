//
//  LaunchAnimationViewModel.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 16.08.2022.
//

import Foundation

enum LaunchAnimationState: CaseIterable {
    case scale
    case move
    case rotate
    case none
}

final class LaunchAnimationViewModel {
    private(set) var state: LaunchAnimationState

    init(stateGenerator: LaunchAnimationStateGeneratorDescription = LaunchAnimationStateGenerator()) {
        state = stateGenerator.generateState()
    }
}
