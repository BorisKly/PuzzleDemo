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
    case levelFailed
}

class LevelOneViewController: UIViewController {

    public var eventHandler: ((levelOneJumpTo)->())?

    private let disposeBag = DisposeBag()

    let level1 = "level1.pdf"

    var timer: Timer?

    var arrayOf16Images: [UIImage] = []



    // MARK: - Privat Properties

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

        self.arrayOf16Images = PublicService.shared.setArrayOf16Images(level1, mixed: true)
        print(arrayOf16Images.count)

        mainView?.mixedCollectionOfElementsOfPuzzle.delegate = self
        mainView?.mixedCollectionOfElementsOfPuzzle.dataSource = self

        bindView()
    }

    func whenAnyCellPressed() {
        timer = Timer.scheduledTimer(withTimeInterval: 180.0, repeats: false) { timer in
            self.attemptFailed()
        }
    }

    private func attemptFailed() {
        self.eventHandler?(.levelFailed)
    }

    private func attemptSucceded(){
        timer?.invalidate()
        self.eventHandler?(.levelCompleted)
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
