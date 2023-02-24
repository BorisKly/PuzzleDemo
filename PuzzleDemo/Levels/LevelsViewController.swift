//
//  LevelsViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

enum levelsJumpTo {
    case toMain
    case toLevelOne
    case toLevelTwo
    case toLevelThree

}

class LevelsViewController: UIViewController {

    public var eventHandler: ((levelsJumpTo)->())?

    public let model = LevelsViewModel()

    // MARK: - Privat Properties

    private let disposeBag = DisposeBag()

    private var mainView: LevelsView? {
        return self.view as? LevelsView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = LevelsView(frame: CGRect.zero)
        self.view = codeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.collectionOfLevels.delegate = self
        mainView?.collectionOfLevels.dataSource = self
        bindView()
    }



    func bindView() {
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toMain)
        }).disposed(by: disposeBag)
    }
}
