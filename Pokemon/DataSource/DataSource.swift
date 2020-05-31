//
//  DataSource.swift
//  Pokemon
//
//  Created by Raffger Sese on 6/1/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import Foundation

class DataSource {
    
    var baseURLString:String!
    var restClient:RESTClient!
    
    init(withClient client:RESTClient, baseURLString:String) {
        self.restClient = client
        self.baseURLString = baseURLString
    }
    
    func getPokemonList(limit: Int, offset: Int, nextUrl: String?, completion: @escaping(PokemonListResult?) -> Void) {
        getData(atEndpoint: .PokemonList(limit: limit, offset: offset, nextUrl: nextUrl), withType: PokemonListResult.self) { data in
                let pokemonsListResult = data as? PokemonListResult
                completion(pokemonsListResult)
            }
    }
    
    func getPokemonDetail(url: String, completion: @escaping(PokemonDetail?) -> Void) {
        getData(atEndpoint: .PokemonDetail(url: url), withType: PokemonDetail.self) { data in
                let pokemonDetail = data as? PokemonDetail
                completion(pokemonDetail)
            }
    }
}
    
    

//MARK: Private functions
extension DataSource {
    
    private func decodeData<T>(data:Data, type:T.Type) -> Decodable? where T:Decodable {
        
        let decoder = JSONDecoder()
        var decodedData:Decodable?
        do {
            decodedData = try decoder.decode(type, from: data)
        }
        catch {
            //Todo: Do error handling
        }
        return decodedData
    }
    
    private func getData<T>(atEndpoint endpoint: Endpoint, withType type:T.Type, completion:@escaping (Decodable?) ->Void) where T:Decodable {
        
        guard let url = getURL(forEndpoint: endpoint) else {
            completion(nil)
            return
        }
        restClient.getData(from: url, completion: { (data) in
            guard let data = data else {
                completion(nil)
                return
            }
            let decodedData = self.decodeData(data: data, type:type)
            completion(decodedData)
        })
    }
    
    private func getURL(forEndpoint endpoint:Endpoint) -> URL? {
        
        var urlString:String?
        switch endpoint {
        case .PokemonList(let limit, let offset, let nextUrl):
            if (nextUrl != nil) {
                urlString = nextUrl
            } else {
                urlString = baseURLString + "?limit=\(limit)" + "&offset=\(offset)"
            }
        case .PokemonDetail(let url):
            urlString = url
        }
        
        guard let string = urlString else {return nil}
        return URL(string: string)
    }
}

