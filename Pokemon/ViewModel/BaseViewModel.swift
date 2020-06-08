//
//  BaseViewModel.swift
//  Pokemon
//
//  Created by Raffger Sese on 6/1/20.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    var dataSource:DataSource
    var restClient:RESTClient
    
    init() {
        restClient = RESTClient()
        dataSource = DataSource(withClient: restClient, baseURLString: "https://pokeapi.co/api/v2/pokemon")
    }
}
