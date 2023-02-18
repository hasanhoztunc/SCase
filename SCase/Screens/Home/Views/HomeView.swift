//
//  HomeView.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

final class HomeView: SView {

    var viewData: [Person] = [] {
        didSet {
            self.canPaginate = true
            self.refreshControl.endRefreshing()
            self.usersTableView.tableData = viewData
        }
    }

    // MARK: - UI Elements

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(tableViewDidRefresh),
                                 for: .valueChanged)
        return refreshControl
    }()

    private lazy var usersTableView: STableView = {
        let tableView = STableView<Person>(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = self.refreshControl
        return tableView
    }()

    // MARK: - Internal APIs

    weak var delegate: HomeViewDelegate?

    // MARK: - Privates

    private var canPaginate = true

    // MARK: - Setup UI

    override func setupUI() {
        super.setupUI()

        self.addSubview(self.usersTableView)
    }

    override func setupConstraints() {
        super.setupConstraints()

        self.usersTableView
            .leadingConstraint(to: self.leadingAnchor)
            .topConstraint(to: self.topAnchor)
            .trailingConstraint(to: self.trailingAnchor)
            .bottomConstraint(to: self.bottomAnchor)
    }

    // MARK: - Private Helpers

    @objc
    private func tableViewDidRefresh() {
        self.delegate?.tableViewDidRefresh()
    }
}

// MARK: - TableView DataSource

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewData[indexPath.row].fullName
        return cell
    }
}

// MARK: - TableView Delegate

extension HomeView: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.usersTableView.contentOffset.y >= (self.usersTableView.contentSize.height - self.usersTableView.bounds.size.height) {
            if canPaginate {
                self.delegate?.tableViewShouldShowNextPage()
                self.canPaginate = false
            }
        }
    }
}
