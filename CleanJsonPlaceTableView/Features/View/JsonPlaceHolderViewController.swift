//
//  JsonPlaceHolderViewController.swift
//  CleanJsonPlaceTableView
//
//  Created by AKIN on 25.09.2022.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var tableViewJsonPlaceHolder: UITableView!
    // MARK: - Properties
    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService: JsonPlaceHolderService = JsonPlaceHolderService()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellNib()
        initDelegate()
        initService()
    }
    // MARK: - Functions
    private func initDelegate() {
        tableViewJsonPlaceHolder.delegate = jsonTableView
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        jsonTableView.delegate = self
    }
    
    private func initService() {
        jsonService.fetchAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }
    }
    
    private func cellNib() {
        let cellNib = UINib(nibName: "JsonPlaceHolderTableViewCell", bundle: nil)
        tableViewJsonPlaceHolder.register(cellNib, forCellReuseIdentifier: "cell")
    }
}

extension JsonPlaceHolderViewController: JsonTableViewOutput {
    func onSelected(item: POSTModel) {
        print(item.title)
    }
    
    
}
