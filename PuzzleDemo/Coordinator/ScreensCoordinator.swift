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
    case levelCompletedScreen
    case levelFailedScreen
    case firstLevelScreen(time: Int)
    case secondLevelScreen
    case thirdLevelScreen

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
        let time = 10
        controller.eventHandler = {[weak self] event in
            switch event {
            case .toMain:
                self?.navigationController.popViewController(animated: true)
            case .toLevelOne:
                self?.jumpToScreen(.firstLevelScreen(time: time))
            case .toLevelTwo:
                break
            case .toLevelThree:
                break
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func firstLevelScreen() {
        let controller =
            LevelOneViewController.startVC()
        controller.eventHandler = {[weak self] event in
            switch event {
            case .backToLevels:
                self?.navigationController.popViewController(animated: true)
            case .levelCompleted:
                self?.jumpToScreen(.levelCompletedScreen)
            case .reloadPuzzle:
                break
            case .levelFailed:
                self?.jumpToScreen(.levelFailedScreen)
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func levelCompleted() {
        let controller =
            LevelCompletedViewController.startVC()

        self.navigationController.pushViewController(controller, animated: true)
    }

    private func levelFailed() {
        let controller =
            LevelFailedViewController.startVC()
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
        case .firstLevelScreen:
            self.firstLevelScreen()
        case .secondLevelScreen:
            break
        case .thirdLevelScreen:
            break
        case .levelCompletedScreen:
            self.levelCompleted()
        case .levelFailedScreen:
            self.levelFailed()
        }
    }
}
