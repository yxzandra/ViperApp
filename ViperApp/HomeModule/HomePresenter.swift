//
//  HomePresenter.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 12-12-20.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.interactorGetData()
        view?.loadActivity()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods

    func interactorPushDataPresenter(receivedData: [DatoURLEntity]) {
        //LE DECIMOS A LA VISTA QUE CARGUE LOS DATOS
        view?.stopAndHideActivity()
        view?.presenterPushDataView(receivedData: receivedData)
    }
}
