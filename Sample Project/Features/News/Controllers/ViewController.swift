//
//  ViewController.swift
//  Sample Project
//
//  Created by Dhawal Mahajan on 21/03/24.
//

import SwiftUI



class ViewController: UIViewController {
    //MARK : Can be injected instead of initializing
   private let documentViewModel = DocumentViewModel()
    
    //MARK: Properties
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(DocumentCell.self, forCellReuseIdentifier: DocumentCell.identifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = documentViewModel
        tv.dataSource = documentViewModel
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 86
        return tv
    }()
    
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        setView()
        documentViewModel.getAPI {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setView() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}


//MARK: Preview Providers
struct ViewControllerPreivew: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
private struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
