//
//  APIHelper.swift
//  Rick et Morty API
//
//  Created by Jeremy Piris on 20/02/2019.
//  Copyright © 2019 Jeremy Piris. All rights reserved.
//

import Foundation

typealias ApiCompletion = (_ next: String?, _ personnages: [Personnage]?, _ errorString: String?) -> Void

class APIHelper {
    
    private let _baseUrl = "https://rickandmortyapi.com/api/"
    
    var urlPersonnages: String {
        return _baseUrl + "character/"
    }
    
    func getPersos(_ string: String, completion: ApiCompletion?) {
        
        if let url = URL(string: string) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion?(nil, nil, error!.localizedDescription)
                }
                
                if data != nil {
                    // Convertir notre JSON
                    do {
                        let reponseJSON = try JSONDecoder().decode(APIResult.self, from: data!)
                        for perso in reponseJSON.results {
                            completion?(reponseJSON.info.next, reponseJSON.results, nil)
                        }
                    } catch {
                        completion?(nil, nil, error.localizedDescription)
                    }
                } else {
                    completion?(nil, nil, "Aucune data dispo")
                }
            }.resume()
            
        } else {
            completion?(nil, nil, "Url Invalide")
        }
    }
    
    
}
