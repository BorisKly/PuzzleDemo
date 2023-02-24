//
//  Coordinator.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
