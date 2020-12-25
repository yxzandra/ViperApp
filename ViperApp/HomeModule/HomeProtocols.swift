//
//  HomeProtocols.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 12-12-20.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func presenterPushDataView(receivedData: [DatoURLEntity])
    func loadActivity()
    func stopAndHideActivity()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(receivedData: [DatoURLEntity])
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }

    func interactorGetData()
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }

    func externalGetData()
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func returnData(with category: [CategoryResponse])
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
