//
//  ScreensCoordinator.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

enum AvailableScreens {
    case loadingScreen
    case mainScreen
    case settingsScreen
    case gameRulesScreen
    case levelsScreen
    case levelCompletedScreen(time: Int, level: Int)
    case levelFailedScreen
    case levelScreen(number: Int)
    case example
}


final class ScreensCoordinator: Coordinator {
    // MARK: -
    // MARK: Constants
    public let navigationController: UINavigationController
    // MARK: -
    // MARK: Properties
    private var navigationScreens: [AvailableScreens] = []
    // MARK: -
    // MARK: Init and Deinit
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    public func start() {
        self.jumpToScreen(.mainScreen)
    }
    // MARK: -
    // MARK: Methods

    private func mainScreen() {
        let controller =
            MainScreenViewController.startVC()
        controller.eventHandler = {[weak self] event in
            switch event {
            case .toGameRules:
                self?.jumpToScreen(.gameRulesScreen)
            case .toSettings:
                self?.jumpToScreen(.settingsScreen)
            case .toLevels:
                self?.jumpToScreen(.levelsScreen)
            case .toPrivacyPolicy:
                break
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func gameRulesScreen() {
        let controller =
            GameRulesViewController.startVC()
        controller.eventHandler = {[weak self] event in
            switch event {
            case .toMainScreen:
                self?.navigationController.popViewController(animated: true)
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func settingsScreen() {
        let controller =
            SettingsViewController.startVC()
        controller.eventHandler = {[weak self] event in
            switch event {
            case .toGameRusles:
                self?.navigationController.popViewController(animated: true)
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func levelsScreen() {
        let controller =
            LevelsViewController.startVC()

        controller.eventHandler = {[weak self] event in
            switch event {
            case .toMain:
                self?.navigationController.popViewController(animated: true)
            case .toLevelOne:
                self?.jumpToScreen(.levelScreen(number: 1))
            case .toLevelTwo:
                self?.jumpToScreen(.levelScreen(number: 2))
            case .toLevelThree:
                self?.jumpToScreen(.levelScreen(number: 3))

            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func levelScreen(level number: Int) {
        let controller =
            LevelOneViewController.startVC()
        controller.levelNumber = number
        controller.eventHandler = {[weak self] event in
            switch event {
            case .backToLevels:
                self?.navigationController.popViewController(animated: true)
            case .levelCompleted(let time):
                self?.jumpToScreen(.levelCompletedScreen(time: time, level: number))
            case .reloadPuzzle:
                break
            case .levelFailed:
                self?.jumpToScreen(.levelFailedScreen)
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func levelCompleted(time: Int, currentLevel: Int) {
        let controller =
            LevelCompletedViewController.startVC()
        controller.time = time
        controller.eventHandler = {[weak self] event in
            switch event {
            case .toLevelOne:
                self?.navigationController.popViewController(animated: true)
            case .toLevels:
                self?.jumpToScreen(.levelScreen(number: currentLevel))
            case .toLevelTwo:
                self?.jumpToScreen(.levelScreen(number: currentLevel + 1))
            }
        }

        self.navigationController.pushViewController(controller, animated: true)
    }

    private func levelFailed() {
        let controller =
            LevelFailedViewController.startVC()

        controller.eventHandler = {[weak self] event in
            switch event {
            case .toLevelOne:
                self?.navigationController.popViewController(animated: true)
            case .toLevels:
                self?.jumpToScreen(.levelsScreen)
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    func example() {
        let controller =
            ExampleViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }


}
// MARK: -
// MARK: Extensions
extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .loadingScreen:
            break
        case .mainScreen:
            self.mainScreen()
        case .settingsScreen:
            self.settingsScreen()
        case .gameRulesScreen:
            self.gameRulesScreen()
        case .levelsScreen:
            self.levelsScreen()
        case .levelScreen(let number):
            self.levelScreen(level: number)
        case .levelCompletedScreen(let data):
            self.levelCompleted(time: data.time, currentLevel: data.level)
        case .levelFailedScreen:
            self.levelFailed()
        case .example:
            self.example()
        }
    }
}
