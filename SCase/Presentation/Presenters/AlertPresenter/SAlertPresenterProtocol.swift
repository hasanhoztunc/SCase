//
//  SAlertPresenter.swift
//  SCase
//
//  Created by Hasan Oztunc on 18.02.2023.
//

import Foundation

protocol SAlertPresenterProtocol {

    func show(handler: @escaping SAlertHandler)
    func dismiss()
}
