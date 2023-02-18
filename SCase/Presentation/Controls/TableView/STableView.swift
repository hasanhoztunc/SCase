//
//  STableView.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

final class STableView<TData>: UITableView {

    // MARK: - Public API

    var tableData: [TData]? {
        didSet {
            self.reloadData()

            if self.tableData?.isEmpty ?? false {
                self.backgroundView = self.emptyLabel
            }
        }
    }

    // MARK: - UI Elements

    private let emptyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "There is no data available"
        label.textAlignment = .center
        return label
    }()

    // MARK: - Initialization

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
