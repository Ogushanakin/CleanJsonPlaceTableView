//
//  JsonTableView.swift
//  CleanJsonPlaceTableView
//
//  Created by AKIN on 25.09.2022.
//

import UIKit

protocol JsonTableViewProtocol {
    func update(items: [POSTModel])
}

protocol JsonTableViewOutput: AnyObject {
    func onSelected(item: POSTModel)
}

final class JsonTableView: NSObject {
    
    private lazy var items: [POSTModel] = []
    
    ///Json TableView Output Models
    weak var delegate: JsonTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].Body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
}

extension JsonTableView: UITableViewDelegate, UITableViewDataSource { }
extension JsonTableView: JsonTableViewProtocol {
    func update(items: [POSTModel]) {
        self.items = items
    }
}
