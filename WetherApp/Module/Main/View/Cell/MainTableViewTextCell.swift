//
//  MainTableViewTextCell.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import UIKit

class MainTableViewTextCell: UITableViewCell {

    enum ViewMetrics {
        static let margins = NSDirectionalEdgeInsets(top: 10.0, leading: 16, bottom: 10.0, trailing: 16)
        static let minHeight: CGFloat = 60.0

        static let iconImageMargin: CGFloat = 26.0
        static let iconImageSize = CGSize(width: 24.0, height: 24.0)
        static let switchImageSize = CGSize(width: 38.0, height: 23.0)
    }

    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.baselineAdjustment = .alignCenters
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryView = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentView.setDirectionalLayoutMargins(ViewMetrics.margins)

        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(countryLabel)
        labelStackView.addArrangedSubview(stateLabel)

        contentView.addSubview(labelStackView)

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: ViewMetrics.minHeight),

            labelStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }

    func configure(with viewModel: MainViewModelCell) {
        nameLabel.text = viewModel.name
        countryLabel.text = viewModel.country
        stateLabel.text = viewModel.state
    }
}
