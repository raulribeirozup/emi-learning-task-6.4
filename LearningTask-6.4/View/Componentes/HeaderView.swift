//
//  HeaderView.swift
//  LearningTask-6.5
//
//  Created by rafael.rollo on 12/04/2022.
//

import UIKit

class HeaderView: UIView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    static func com(titulo: String) -> HeaderView {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 48))
        headerView.label.text = titulo
        return headerView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        applyTheme()
        addViews()
        addConstraints()
    }
    
    private func applyTheme() {
        backgroundColor = .secondarySystemBackground
    }
    
    private func addViews() {
        addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
        ])
    }
    
}
