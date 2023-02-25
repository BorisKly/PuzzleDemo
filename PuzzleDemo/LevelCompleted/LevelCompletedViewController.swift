//
//  LevelCompletedViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

enum complitedScreenJumpTo {
    case toLevels
    case toLevelOne
    case toLevelTwo
}

class LevelCompletedViewController: UIViewController {

    public var eventHandler: ((complitedScreenJumpTo)->())?

    private let disposeBag = DisposeBag()

    var time: Int = 1

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
        let minutes =  time / 60
        let seconds = time % 60
        mainView?.timeLabel.text = "TIME: 0\(minutes) : \(seconds) "

        mainView?.bestTimeLabel.text = "BEST TIME: 01 : 20 "


        bindView()

    }

    func bindView() {
        mainView?.backToLevelsButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toLevels)
        }).disposed(by: disposeBag)

        mainView?.reloadLevel.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toLevelOne)
        }).disposed(by: disposeBag)

        mainView?.toLevelTwo.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toLevelTwo)
        }).disposed(by: disposeBag)
    }
}
