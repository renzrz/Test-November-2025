//
//  DetailTestVC.swift
//  Test
//
//  Created by Rz on 06/11/25.
//

import UIKit

class DetailTestVC: UIViewController {

    var viewModel = DetailTestViewModel()

    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var detailLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()


    init(viewModel: DetailTestViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }


    private func setupUI() {
        title = "Detail Posts"
        view.backgroundColor = .white

        view.addSubview(mainView)
        mainView.addSubview(titleLbl)
        mainView.addSubview(detailLbl)

        NSLayoutConstraint.activate([
            // mainView
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            // titleLbl
            titleLbl.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            titleLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            titleLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),

            // detailLbl
            detailLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 15),
            detailLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            detailLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            detailLbl.bottomAnchor.constraint(lessThanOrEqualTo: mainView.bottomAnchor, constant: -15)
        ])
    }
    
    private func loadData() {
        titleLbl.text = viewModel.selectedPost?.title
        detailLbl.text = viewModel.selectedPost?.body
    }
}
