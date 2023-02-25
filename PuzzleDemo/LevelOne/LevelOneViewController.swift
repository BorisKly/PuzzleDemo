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

    var time = 10 {
        didSet { mainView?.timer.text = "\(time)" }
    }
    var timer: Timer?

    var arrayOf16Images: [UIImage] = []
    var imageOrder: [Int] = []
    let correctOrder = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]



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
        self.arrayOf16Images = PublicService.shared.setArrayOf16Images(level1, mixed: false)

        setTimer()

        imageOrder = Array(0...15).shuffled()

        mainView?.mixedCollectionOfElementsOfPuzzle.delegate = self
        mainView?.mixedCollectionOfElementsOfPuzzle.dataSource = self

        bindView()
    }

    private func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(tick) ,
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func tick(){
        time -= 1
        if time == 0 {
            timer?.invalidate()
            attemptFailed()
        }
    }

    // MARK: - Privat Methods

    private func attemptFailed() {
        self.eventHandler?(.levelFailed)
    }

    private func attemptSucceded(){
        timer?.invalidate()
        self.eventHandler?(.levelCompleted)
    }

    private func bindView() {

        mainView?.backToLevels.rx.tap
            .bind(onNext: { [weak self] in
            self?.eventHandler?(.backToLevels)
        }).disposed(by: disposeBag)

    }

}
