//
//  AppConfigurator.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

final class AppConfigurator {

    private var coordinator: Coordinator?

    init(window: UIWindow) {
        self.configure(window: window)
    }

    private func configure(window: UIWindow) {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        navigationController.navigationBar.isHidden = true
        self.coordinator = ScreensCoordinator(navigationController: navigationController)
        self.coordinator?.start()
        window.makeKeyAndVisible()
    }
}
