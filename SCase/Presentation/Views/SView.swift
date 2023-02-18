//
//  SView.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

class SView: UIView {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupUI()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.setupUI()
        self.setupConstraints()
    }

    // MARK: - Prepare UI

    func setupUI() {

    }

    func setupConstraints() {

    }
}
