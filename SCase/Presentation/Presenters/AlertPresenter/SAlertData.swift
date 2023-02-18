//
//  SAlertData.swift
//  SCase
//
//  Created by Hasan Oztunc on 18.02.2023.
//

import Foundation

typealias SAlertHandler = () -> SAlertData
typealias SAlertResultHandler = (_ index: Int) -> Void

struct SAlertData {

    public let title: String?
    public let message: String
    public let buttons: [String]
    public let handler: SAlertResultHandler?
}
