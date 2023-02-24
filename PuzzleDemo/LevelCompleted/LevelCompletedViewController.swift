//
//  LevelCompletedViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

class LevelCompletedViewController: UIViewController {

    private var mainView: LevelCompletedView? {
        return self.view as? LevelCompletedView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = LevelCompletedView(frame: CGRect.zero)
        self.view = codeView

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
