//
//  GameRulesViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import RxSwift

enum gameRulesJumpTo {
    case toMainScreen
}

class GameRulesViewController: UIViewController {

    public var eventHandler: ((gameRulesJumpTo)->())?

    private let disposeBag = DisposeBag()


    // MARK: - Privat Properties

    private var mainView: GameRulesView? {
        return self.view as? GameRulesView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = GameRulesView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.back3
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    private func bindView() {
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toMainScreen)
        }).disposed(by: disposeBag)
    }
}
