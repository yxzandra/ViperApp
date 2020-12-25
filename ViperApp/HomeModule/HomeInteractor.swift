//
//  HomeInteractor.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 12-12-20.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var arrayURL = [DatoURLEntity]()

    func interactorGetData() {
        remoteDatamanager?.externalGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func returnData(with category: [CategoryResponse]) {
        //EL INTERACTOR DEBE ENVIARLE LOS DATOS AL PRESENTER
        print("Estoy obteniendo estos datos: \(category)")
        for url in category {
            let datoUrl = DatoURLEntity(datoURL: url.links.linksSelf.first?.href ?? "")
            arrayURL.append(datoUrl)
        }
        print("Le paso al presenter: \(self.arrayURL)")
        // PASARLE LOS DATOS AL PRESENTER
    }
}
