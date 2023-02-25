//
//  LevelThreeViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 25.02.2023.
//

import UIKit
import PinLayout

class LevelThreeViewController: UIViewController {


    private var mainView: LevetThreeView? {
        return self.view as? LevetThreeView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = LevetThreeView(frame: CGRect.zero)
        self.view = codeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
