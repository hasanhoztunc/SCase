//
//  SAlertPresenter.swift
//  SCase
//
//  Created by Hasan Oztunc on 18.02.2023.
//

import UIKit

final class SAlertPresenter: SAlertPresenterProtocol {

    // MARK: - Singleton

    static let shared = SAlertPresenter()

    // MARK: - Privates

    private var alertWindow: UIWindow?

    // MARK: - Initialization

    private init() {}

    func show(handler: @escaping SAlertHandler) {
        guard self.alertWindow == nil else {
            return
        }

        let connectedScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        self.alertWindow = UIWindow(frame: UIScreen.main.bounds)
        self.alertWindow?.windowLevel = .alert
        self.alertWindow?.backgroundColor = .clear

        let contentViewController = UIViewController()
        contentViewController.modalPresentationStyle = .fullScreen
        contentViewController.modalTransitionStyle = .crossDissolve
        contentViewController.view.backgroundColor = .clear

        self.alertWindow?.rootViewController = contentViewController
        self.alertWindow?.windowScene = connectedScene
        self.alertWindow?.makeKeyAndVisible()

        let alertViewController = self.generateAlert(data: handler())
        contentViewController.present(alertViewController, animated: true)
    }

    func dismiss() {
        let alertViewController = self.alertWindow?.rootViewController as? UIAlertController
        alertViewController?.dismiss(animated: true)

        self.alertWindow?.resignKey()
        self.alertWindow = nil
    }

    private func generateAlert(data: SAlertData) -> UIAlertController {
        let alertController = UIAlertController(title: data.title,
                                                message: data.message,
                                                preferredStyle: .alert)

        data.buttons.enumerated().forEach { [weak self] item in
            let style: UIAlertAction.Style

            if item.offset == data.buttons.count - 1 {
                style = .destructive
            } else {
                style = .default
            }

            let alertAction = UIAlertAction(title: item.element, style: style) { _ in
                data.handler?(item.offset)
                self?.dismiss()
            }

            alertController.addAction(alertAction)
        }

        return alertController
    }
}
