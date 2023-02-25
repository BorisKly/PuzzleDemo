//
//  LevelFailedViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 25.02.2023.
//

import UIKit

class LevelFailedViewController: UIViewController {

    private var mainView: LevelFailedView? {
        return self.view as? LevelFailedView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = LevelFailedView(frame: CGRect.zero)
        self.view = codeView

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
