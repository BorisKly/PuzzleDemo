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

    var arrayOfImages: [UIImage] = []


    //let level1 = UIImage(named: "level1.pdf")

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
        self.arrayOfImages = PublicService().setRandomArrayOf16Images("level1.pdf")
        
        mainView?.mixedCollectionOfElementsOfPuzzle.delegate = self
        mainView?.mixedCollectionOfElementsOfPuzzle.dataSource = self

        bindView()
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
