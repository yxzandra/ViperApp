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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
