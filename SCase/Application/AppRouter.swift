//
//  AppRouter.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

final class AppRouter {

    // MARK: - Internals

    var window: UIWindow?

    // MARK: - Initialization

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }

    // MARK: - Helpers

    func startTheApp() {
        let viewController = HomeViewController()

        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}
