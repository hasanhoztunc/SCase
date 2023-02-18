//
//  AppContainer.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import Foundation

let app = AppContainer()

final class AppContainer {

    let router = AppRouter()
    let service = Service.shared
}
