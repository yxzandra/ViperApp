//
//  HomeView.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 12-12-20.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var homeTable: UITableView!
    @IBOutlet weak var homeActivity: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var arrayViewURL = [DatoURLEntity]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {

    // TODO: implement view output methods
    func presenterPushDataView(receivedData: [DatoURLEntity]) {
        self.arrayViewURL = receivedData
        homeTable.reloadData()
    }

    func loadActivity() {
        DispatchQueue.main.async {
            self.homeActivity.startAnimating()
        }
    }

    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.homeActivity.stopAnimating()
            self.homeActivity.hidesWhenStopped = true
        }
    }

    func hideTableView(isHide: Bool) {
        DispatchQueue.main.async {
            self.homeTable.isHidden = isHide
        }
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewURL.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = arrayViewURL[indexPath.row].datoURL
        return cell
    }


}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailView(with: arrayViewURL[indexPath.row])
    }
}
