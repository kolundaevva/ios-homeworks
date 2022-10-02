//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 29.09.2022.
//

import UIKit

struct PostViewModel {
    struct Cell {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int
        var sizes: FeedCellSizes
    }

    var cells: [Cell]
}

class UserViewController: UIViewController {

    let userHeaderView = UserHeaderView()
    private let cellLayoutCalculator: CellLayoutCalculatorProtocol = CellLayoutCalculator()

    let tableView: UITableView = {
        let view = UITableView(frame: CGRect(), style: .grouped)
        return view
    }()

    let posts = [Post(author: "Popov Vlad", description: "Просмотреть фильм проще, чем прочесть его сценарий. Во время киносеанса мы в большинстве случаев избавлены от умственного труда. Воображение просто «поедает» готовые, навязанные фильмом, образы.", image: "post1", likes: 10, views: 30), Post(author: "Test1", description: "", image: "post2", likes: 3, views: 100), Post(author: "Test 3", description: "12313", image: "post3", likes: 100, views: 100)]

    var postViewModel = PostViewModel.init(cells: [])
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view.addSubview(userHeaderView)
//
//        userHeaderView.frame = view.frame
//        userHeaderView.configure(name: "Hipster Cat", status: "Waiting for something...")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Profile"
//        navigationController?.navigationBar.backgroundColor = .white
//        view.backgroundColor = .lightGray
//    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view = tableView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view = tableView
        setupTableView()
        userHeaderView.configure(name: "Hipster Cat", status: "Waiting for something...")
        calculate()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.reuseIdentifier)
    }
    private func calculate() {
        for post in posts {
            let size = cellLayoutCalculator.sizes(postText: post.description, image: post.image)
            let cell = PostViewModel.Cell(author: post.author, description: post.description, image: post.image, likes: post.likes, views: post.views, sizes: size)
            postViewModel.cells.append(cell)
        }
//        tableView.reloadData()
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.cells.count + 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return userHeaderView
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.reuseIdentifier) as! PhotosTableViewCell
            cell.configure(with: ["0", "1", "2", "3"])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 165
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.reuseIdentifier) as! PhotosTableViewCell
            cell.configure(with: ["0", "1", "2", "3"])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as! PostTableViewCell
            let post = postViewModel.cells[indexPath.row - 1]
            cell.configure(with: post)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 165 : postViewModel.cells[indexPath.row - 1].sizes.totalHeight
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 165 : postViewModel.cells[indexPath.row - 1].sizes.totalHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photosVC = PhotosViewController()
            photosVC.photos = ["0", "1", "2", "3"]
            navigationController?.pushViewController(photosVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }

    }

}
