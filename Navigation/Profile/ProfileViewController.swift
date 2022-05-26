//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let postModel: [PostModel] = PostModel.makePostModel()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//  MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModel.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postModel[indexPath.row - 1])
            cell.reciverOfDataFromeCell = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupLabel("")
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
    }
}

//  MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.backgroundColor = .systemGray6
        return section == 0 ? header : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220:0
    }
}

//  MARK: - Расширение для делегата

protocol DelegateOfReciverOfDataFromeCell {
    func addLikes(likesInLabel: String) -> String
    func showPhoto(viewsInLabel: String, postPhoto: UIImage) -> String
}

extension ProfileViewController: DelegateOfReciverOfDataFromeCell {

    func showPhoto(viewsInLabel: String, postPhoto: UIImage) -> String {
        
        let viewForDataFromeCell: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            view.alpha = 1
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let zoomImageView: UIImageView = {
            let view = UIImageView()
            view.image = postPhoto
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFit
            return view
        }()

        view.addSubview(viewForDataFromeCell)
        viewForDataFromeCell.addSubview(zoomImageView)

        NSLayoutConstraint.activate([

            viewForDataFromeCell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewForDataFromeCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForDataFromeCell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForDataFromeCell.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            zoomImageView.topAnchor.constraint(equalTo: viewForDataFromeCell.topAnchor),
            zoomImageView.leadingAnchor.constraint(equalTo: viewForDataFromeCell.leadingAnchor),
            zoomImageView.bottomAnchor.constraint(equalTo: viewForDataFromeCell.bottomAnchor),
            zoomImageView.trailingAnchor.constraint(equalTo: viewForDataFromeCell.trailingAnchor)
        ])

        lazy var tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        viewForDataFromeCell.addGestureRecognizer(tap)

        func addViews(viewsInLabel: String) -> String {
            let views = (Int(viewsInLabel) ?? 0) + 1
            let viewsInLabel: String
            viewsInLabel = "\(views)"
            return viewsInLabel
        }
        return addViews(viewsInLabel: viewsInLabel)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    func addLikes(likesInLabel: String) -> String {
        let likes = (Int(likesInLabel) ?? 0) + 1
        let likesInLabel: String
        likesInLabel = "\(likes)"
        return likesInLabel
    }
}

extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonPushed() {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }
}
