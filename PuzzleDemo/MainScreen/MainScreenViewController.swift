//
//  MainScreenViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import RxCocoa
import RxSwift

enum mainScreenJumpTo {
    case toGameRules
    case toSettings
    case toLevels
    case toPrivacyPolicy
}

class MainScreenViewController: UIViewController {

    public var eventHandler: ((mainScreenJumpTo)->())?

    // MARK: - Privat Properties

    private let disposeBag = DisposeBag()


    private var mainView: MainScreenView? {
        return self.view as? MainScreenView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = MainScreenView(frame: CGRect.zero)
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    func bindView() {
        mainView?.gameRulesButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toGameRules)
        }).disposed(by: disposeBag)

        mainView?.settingsButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toSettings)
        }).disposed(by: disposeBag)

        mainView?.playButton.rx.tap.bind(onNext: { [weak self] in
            self?.eventHandler?(.toLevels)
        }).disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
