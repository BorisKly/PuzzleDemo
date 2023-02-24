//
//  LevelOneViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

enum levelOneJumpTo {
    case backToLevels
    case reloadPuzzle
    case levelCompleted
}

class LevelOneViewController: UIViewController {

    public var eventHandler: ((levelOneJumpTo)->())?

    private let disposeBag = DisposeBag()

    public var model = LevelOneModel()

    private var timer: Timer?

    // MARK: - Privat Properties

    //private let disposeBag = DisposeBag()

    private var mainView: LevelOneView? {
        return self.view as? LevelOneView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = LevelOneView(frame: CGRect.zero)
        self.view = codeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
        mainView?.mixedCollectionOfElementsOfPuzzle.delegate = self
        mainView?.mixedCollectionOfElementsOfPuzzle.dataSource = self

        bindView()
    }

    @objc func updateTime(_ timer: Timer) {
       // mainView?.timer.text = self.timer.
        print("timer fired!")
    }

    func bindView() {
        mainView?.backToLevels.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.backToLevels)
        }).disposed(by: disposeBag)
//
//        mainView?.reloadLevel.rx.tap.bind(onNext: { [weak self] in
//            print("reload Puzzle") // ||||||||||||||||
//        }).disposed(by: disposeBag)
    }

}
