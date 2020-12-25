//
//  DetailView.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 25-12-20.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var lblURL: UILabel!
    
    // MARK: Properties
    var presenter: DetailPresenterProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
}
