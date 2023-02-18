//
//  Service.swift
//  SCase
//
//  Created by Hasan Oztunc on 18.02.2023.
//

import Foundation

final class Service {

    // MARK: - Singleton

    static let shared = Service()

    // MARK: - Privates

    private let dataProvider: DataSource.Type
    private let alertPresenter: SAlertPresenterProtocol
    private var retryCounter = 1
    private var maxAttemps = 5

    // MARK: - Initialization

    private init() {
        self.dataProvider = DataSource.self
        self.alertPresenter = SAlertPresenter.shared
    }

    // MARK: - Internal API

    func request(next: String?,
                 success successHandler: @escaping (FetchResponse) -> Void,
                 error errorHandler: ((FetchError) -> Void)? = nil) {
        self.dataProvider.fetch(next: next) { response, error in
            if let response {
                successHandler(response)
                return
            }

            self.retryExponentially(next: next,
                                    error: error,
                                    success: successHandler,
                                    error: errorHandler)
        }
    }

    // MARK: - Helpers

    private func retryExponentially(next: String?,
                                    error: FetchError?,
                                    success successHandler: @escaping (FetchResponse) -> Void,
                                    error errorHandler: ((FetchError) -> Void)?) {
        guard self.retryCounter < maxAttemps else {
            self.retryCounter = 1
            self.handlerError(with: error, errorHandler)
            return
        }

        let waitTime = TimeInterval(pow(Double(retryCounter), Double(retryCounter)))

        DispatchQueue.global().asyncAfter(deadline: .now() + waitTime) {
            self.retryCounter += 1
            self.request(next: next,
                         success: successHandler,
                         error: errorHandler)
        }
    }

    private func handlerError(with error: FetchError?, _ errorHandler: ((FetchError) -> Void)?) {
        if let errorHandler {
            errorHandler(error!)
        } else {
            guard let errorMessage = error?.errorDescription else { return }
            self.alertPresenter.show {
                SAlertData(title: nil,
                           message: errorMessage,
                           buttons: ["OK"],
                           handler: nil)
            }
        }
    }
}
