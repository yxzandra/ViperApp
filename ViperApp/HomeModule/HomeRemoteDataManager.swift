//
//  HomeRemoteDataManager.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 12-12-20.
//  
//

import Foundation
import Alamofire

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {

    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var getUrl = [CategoryResponse]()

    func externalGetData() {
        AF.request("https://cfeapps.com/wp-json/wp/v2/categories", method: .get).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    self.getUrl =  try decoder.decode([CategoryResponse].self, from: response.data!)
                    self.remoteRequestHandler?.returnData(with: self.getUrl)
                } catch {
                    print("No se pudo parsear el archivo, error: \(error.localizedDescription)")
                }
            } else {
                print("Ha ocurrido un error: \(String(response.response!.statusCode))")
            }
        }
    }
}

