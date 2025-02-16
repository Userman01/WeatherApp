//
//  MainView.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

final class MainView: UIView {
    
    private enum ViewMetrics {
        static let layoutMargins = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
    }
    
    private var delegate: MainViewControllerDelegate?
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.layoutMargins = ViewMetrics.layoutMargins
        tableView.backgroundColor = .clear
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.refreshControl = refreshControl
        return tableView
    }()
    
    init(frame: CGRect,
         tableViewDelegate: UITableViewDelegate,
         tableViewDataSource: UITableViewDataSource,
         delegate: MainViewControllerDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        setupLayout()
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadDataTableView() {
        tableView.reloadData()
    }
    
    private func setupLayout() {
        backgroundColor = .backgroundColor
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        delegate?.didRefreshControl()
        sender.endRefreshing()
    }
}
