//
//  RESTClient.swift
//  Pokemon
//
//  Created by Raffger Sese on 6/1/20.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

enum Endpoint {
    case PokemonList(limit:Int, offset:Int, nextUrl: String?)
    case PokemonDetail(url:String)
}

class RESTClient {
    func getData(from url: URL, completion: @escaping (Data?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            completion(data)
        }
        task.resume()
    }
}
