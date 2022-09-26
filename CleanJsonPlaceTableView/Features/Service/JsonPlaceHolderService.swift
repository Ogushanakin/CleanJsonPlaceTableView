//
//  JsonPlaceHolderService.swift
//  CleanJsonPlaceTableView
//
//  Created by AKIN on 25.09.2022.
//

import Alamofire

protocol JsonPlaceHolderProtocol {
    func fetchAllPosts(onSuccess:@escaping ([POSTModel])-> Void, onFail:@escaping (String?) -> Void)
}

enum JsonPlaceHolderPath: String {
    case POSTS = "/atilsamancioglu/BTK-iOSDataSet/master/dataset.json"
}

extension JsonPlaceHolderPath {
    func withBaseUrl() -> String {
        return "https://raw.githubusercontent.com\(self.rawValue)"
    }
}

struct JsonPlaceHolderService: JsonPlaceHolderProtocol {
    func fetchAllPosts(onSuccess:@escaping ([POSTModel]) -> Void, onFail:@escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.POSTS.withBaseUrl(), method: .get).validate().responseDecodable(of: [POSTModel].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
