//
//  SettingsViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import RxCocoa
import RxSwift

enum mainScrJumpTo {
    case toGameRusles
}

class SettingsViewController: UIViewController {

    public var eventHandler: ((mainScrJumpTo)->())?

    // MARK: - Privat Properties

    private let disposeBag = DisposeBag()


    private var mainView: SettingsView? {
        return self.view as? SettingsView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = SettingsView(frame: CGRect.zero)
//        codeView.backgroundColor = Colors.back1
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    func bindView() {
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toGameRusles)
        }).disposed(by: disposeBag)
    }
}
