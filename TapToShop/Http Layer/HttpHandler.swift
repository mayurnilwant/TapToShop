//
//  HttpHandler.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 25/01/2024.
//

//https://fakestoreapi.com/docs

import Foundation


enum HttpOperationType {
    
    case getAll
    case getById(Int)
    
}

extension HttpOperationType {
    
    func getHttpMethod() -> String {
        
        switch self {
        case .getAll, .getById(_):
            return "GET"
        }
    }
}

protocol ResourceEndPointProtocol {
    var path: String{get}
    var host: String{get}
    var scheme: String{get}
    var queries: [String: String]?{get set}
    var httpOperationType: HttpOperationType{get set}

}


extension ResourceEndPointProtocol {
    
    var host: String {
        return "fakestoreapi.com"
    }
    
    var scheme : String {
        return "https"
    }
    
    var url: URL? {
        
        var urlComponent = URLComponents()
        urlComponent.scheme = self.scheme
        urlComponent.host = self.host
        urlComponent.path = self.path
        
        if let _ = self.queries {
            
            urlComponent.queryItems = self.queries?.map{(name, value) in
                return URLQueryItem(name: name, value: value)
            }
        }
        
        return urlComponent.url
    }
}

struct ClothsResource : ResourceEndPointProtocol {

    var path: String {
        
        switch self.httpOperationType {
        case .getAll:
            return "/products"
        case .getById(let productId):
            return "/products/\(productId)"
        }
        
    }
    var queries: [String : String]?
    var httpOperationType: HttpOperationType
    
    init(queries: [String : String]? = nil, httpOperationType: HttpOperationType) {
        self.queries = queries
        self.httpOperationType = httpOperationType
    }
    
    
}


enum HttpError {
    
    case nilData
    case httpStatusError
    case invalidRequest
}

enum WebServiceFetchResult<T: Decodable> {
    case success(T?)
    case failure(HttpError)
}


protocol WebserviceManagerProtocol {
    
    var endPoint: ResourceEndPointProtocol? {get set}
    var header: [String: String]? {get set}
    func makeRequest() -> URLRequest?
    func fetch<T: Decodable>(type modelType: T.Type) async ->  WebServiceFetchResult<T>?
    
    init()
    init(withEndPoint endPoint: ResourceEndPointProtocol, andHeader header: [String: String]?)
}


extension WebserviceManagerProtocol {
    
    init(withEndPoint endPoint: ResourceEndPointProtocol, andHeader header: [String: String]?) {
        
        self.init()
        self.endPoint = endPoint
        guard header != nil else {return}
        self.header = header!
        
    }
    
    func makeRequest() -> URLRequest? {
        
        
        guard let url = self.endPoint?.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint?.httpOperationType.getHttpMethod()
        return urlRequest
        
    }
    
    
    func fetch<T: Decodable>(type modelType: T.Type) async ->  WebServiceFetchResult<T>? {
        
        guard self.makeRequest() != nil else {
            return nil
        }
        do {
            let (data, responseCode) = try await URLSession.shared.data(for: self.makeRequest()!)
            
            guard let statusCode = (responseCode as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                return WebServiceFetchResult.failure(.httpStatusError)
            }
            let parseObject = try? JSONDecoder().decode(modelType.self, from: data)
            
            return WebServiceFetchResult.success(parseObject)
                
        }catch (_) {
            
            return WebServiceFetchResult.failure(.nilData)
        }
    }
}


struct ClothsWebervicemanager : WebserviceManagerProtocol {
    
    var header: [String : String]?
    var endPoint: ResourceEndPointProtocol?
  
    init() {}
    
}

