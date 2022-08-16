//
//  AppDelegate.swift
//  AbstractMarket
//
//  Created by Alex Vasilyev on 08.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var launchAnimation: LaunchAnimationDescription? = LaunchAnimationViewController()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        launchAnimation?.displayAnimation()
        // Удаляем из памяти после отработки анимации
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.launchAnimation?.dismiss { [weak self] in
                guard let self = self else { return }
                self.launchAnimation = nil
            }
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()

        return true
    }
}
