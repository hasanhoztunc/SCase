//
//  SHomeViewModel.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import Foundation

final class HomeViewModel: SViewModel {

    // MARK: - Internal APIs

    weak var delegate: HomeViewModelDelegate?

    // MARK: Privates

    private var nextPage: String?

    // MARK: - Prepare

    override func prepare() {
        super.prepare()

        self.fetchPeople(with: nil)
    }

    // MARK: - Internal APIs

    func fetchNextPage() {
        self.fetchPeople(with: self.nextPage)
    }

    func refreshPage() {
        self.fetchPeople(with: nil)
    }

    // MARK: - Privates

    private func fetchPeople(with page: String?) {
        self.service.request(next: page,
                             success: { [weak self] response in
            let people = response.people.distinct()

            self?.nextPage = response.next

            self?.delegate?.usersDidFetch(people)
        })
    }
}
