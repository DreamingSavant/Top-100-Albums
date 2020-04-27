//
//  MainCoordinator.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set}
    var navigationController: UINavigationController { get }
    func start()
}

extension Coordinator {
    func appendAndStart(coordinator: Coordinator) {
        children.append(coordinator)
        coordinator.start()
    }
}

//final class MainCoordinator: NSObject, Coordinator {
//    lazy var children: [Coordinator?]
//
//    var navigationController: UINavigationController
//
//    func start() {
//        print("ok")
//    }
//
//
//}
