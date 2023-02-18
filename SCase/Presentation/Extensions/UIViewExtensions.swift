//
//  UIViewExtensions.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

extension UIView {

    @discardableResult
    func bottomConstraint(to viewAnchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.bottomAnchor.constraint(equalTo: viewAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func leadingConstraint(to viewAnchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.leadingAnchor.constraint(equalTo: viewAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func trailingConstraint(to viewAnchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.trailingAnchor.constraint(equalTo: viewAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func topConstraint(to viewAnchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        self.topAnchor.constraint(equalTo: viewAnchor, constant: constant).isActive = true
        return self
    }
}
