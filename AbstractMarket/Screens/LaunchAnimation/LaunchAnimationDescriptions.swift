//
//  LaunchAnimationDescriptions.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 16.08.2022.
//

import Foundation

protocol LaunchAnimationStateGeneratorDescription {
    func generateState() -> LaunchAnimationState
}

protocol LaunchAnimationDescription {
    func displayAnimation()
    func dismiss(completion: (() -> Void)?)
}
