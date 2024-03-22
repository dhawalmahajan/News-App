//
//  DocumentViewModel.swift
//  Sample Project
//
//  Created by Dhawal Mahajan on 21/03/24.
//

import UIKit
protocol APIService {
    func getAPI(completion: @escaping () -> Void)
}



class DocumentViewModel: NSObject, APIService  {
    private struct K {
        static let BASE_URL = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=j5GCulxBywG3lX211ZAPkAB8O381S5SM"
    }
    private var model: Model? = nil
    func getAPI(completion: @escaping () -> Void) {
        guard let url = URL(string: K.BASE_URL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, res, error in
            if error != nil {
                debugPrint(error as Any)
            }
            if let data = data {
                if let model = try? JSONDecoder().decode(Model.self, from: data) {
                    self.model = model
                    completion()
                }
            }
        }.resume()
    }
   
}

//MARK: Table delegates and datasource
extension DocumentViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.response.docs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DocumentCell.identifier, for: indexPath) as? DocumentCell, let doc = model?.response.docs[indexPath.row] else {return UITableViewCell()}
        cell.configureCell(doc: doc)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
     return 100
    }
}
