//
//  SettingsView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

class SettingsView: UIView {
    private let tableView = UITableView()
    
    private let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel = SettingsViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView {
    func setupSubviews() {
        addSubview(tableView)
        
        setupTableView()
        setupSubviewsConstraints()
    }
    
    func setupTableView() {
        tableView.register(SettingsViewCell.self, forCellReuseIdentifier: SettingsViewCell.cellIdentifier)
        tableView.dataSource = self
    }
    
    func setupSubviewsConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension SettingsView: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsViewCell.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = viewModel.getCellFor(indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.getHeaderFor(section)
    }
}
