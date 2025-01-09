//
//  ViewController.swift
//  TienYu_Flights
//
//  Created by Kedia on 2025/1/9.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Task { [weak self] in
            guard let self else { return }
            await self.viewModel.fetchAllJourneys()
            Task { @MainActor in
                self.tableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    private let viewModel: ViewControllerVM = ViewControllerVM()
    private let cellIdentifier = "cell"
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfJourneys()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let journey = viewModel.journey(at: indexPath.row) else { return cell }
        cell.textLabel?.text = journey
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // Implement delegate methods if needed
}

