//
//  RequestRouter.swift
//  MangaReader
//
//  Created by vakhushti metreveli on 26.11.20.
//

import Foundation
import Alamofire

protocol RequestRouter: URLRequestConvertible{
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get}
}

extension RequestRouter {
    
    func asURLRequest() throws -> URLRequest {
        let idToken = UserDefaults.standard.string(forKey: Constant.UserDefaultKeys.ID_TOKEN) ?? ""
      // let headers: HTTPHeaders = [.authorization(bearerToken: idToken)]
        
        let url = try Constant.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        urlRequest.httpMethod = method.rawValue
        //rlRequest.headers = headers
       
        return urlRequest
    }
}
