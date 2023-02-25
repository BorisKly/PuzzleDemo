//
//  LevelTwoViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 25.02.2023.
//

import UIKit
import PinLayout

class LevelTwoViewController: UIViewController {


    private var mainView: LevelTwoView? {
        return self.view as? LevelTwoView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = LevelTwoView(frame: CGRect.zero)
        self.view = codeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

    }
}
