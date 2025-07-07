//
//  ApiConfig.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 7/07/25.
//

struct ApiConfig {
    
    #if DEBUG
    static let baseUrl = "http://127.0.0.1:8000"
    #elseif STAGING
    static let baseUrl = "https://staging.recipetogether.com"
    #else
    let baseUrl = "https://api.recipetogether.com"
    #endif
    
    static let imageBaseUrl = "\(baseUrl)/images/"
    static let recipeEndpint = "\(baseUrl)/recipes"
    static let uploadImageEndpoint = "\(baseUrl)/upload-image"
}
