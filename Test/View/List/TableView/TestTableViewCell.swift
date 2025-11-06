//
//  TestTableViewCell.swift
//  Test
//
//  Created by Rz on 06/11/25.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bodyLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLbl)
        contentView.addSubview(bodyLbl)
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            bodyLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5),
            bodyLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            bodyLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            bodyLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
