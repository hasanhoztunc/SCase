//
//  ViewController.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

final class HomeViewController: SViewController<HomeView, HomeViewModel> {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewSource.delegate = self
        self.viewModel.delegate = self
    }
}

// MARK: - ViewModel Delegate

extension HomeViewController: HomeViewDelegate {

    func tableViewDidRefresh() {
        self.viewModel.refreshPage()
    }

    func tableViewShouldShowNextPage() {
        self.viewModel.fetchNextPage()
    }
}

// MARK: - ViewSource Delegate

extension HomeViewController: HomeViewModelDelegate {
    func usersDidFetch(_ users: [Person]) {
        self.viewSource.viewData = users
    }
}
