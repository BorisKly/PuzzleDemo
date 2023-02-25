//
//  LevelFailedViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 25.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

enum failScreenJumpTo {
    case toLevels
    case toLevelOne
}

class LevelFailedViewController: UIViewController {

    public var eventHandler: ((failScreenJumpTo)->())?

    private let disposeBag = DisposeBag()

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
        bindView()
    }



    func bindView() {
        mainView?.backToLevelsButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toLevels)
        }).disposed(by: disposeBag)

        mainView?.reloadLevel.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toLevelOne)
        }).disposed(by: disposeBag)
    }
}
