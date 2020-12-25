//
//  DetailPresenter.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 25-12-20.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var datoURLRecibed: DatoURLEntity?
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?

    // TODO: implement presenter methods
    func viewDidLoad() {
        if let dataRecibed = datoURLRecibed {
            view?.showDataInLabel(data: dataRecibed)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
