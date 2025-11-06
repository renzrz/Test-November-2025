//
//  ListVC.swift
//  Test
//
//  Created by Rz on 06/11/25.
//

import UIKit

class ListVC: UIViewController {

    private var viewModel = ListViewModel(postsService: PostsServices())

    private lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false // Important
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Posts"
        view.backgroundColor = .white

        setupLayout()
        setupBinding()

        Task {
            await viewModel.getDataPosts()
        }
    }

    private func setupLayout() {
        view.addSubview(listTableView)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupBinding() {
        viewModel.didUpdateData = { [weak self] in
            self?.listTableView.reloadData()
        }

        viewModel.didFail = { [weak self] message in
            self?.showErrorAlert(message)
        }
    }

    private func showErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        let post = viewModel.posts[indexPath.row]
        cell.titleLbl.text = post.title
        cell.bodyLbl.text = post.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedPost = viewModel.posts[indexPath.row]
        let selectedDetailVM = DetailTestViewModel()
        selectedDetailVM.selectedPost = selectedPost
        let detailVC = DetailTestVC(viewModel: selectedDetailVM)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
