//
//  BackendManager.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 26.11.20.
//
import Foundation
import Alamofire

typealias SuccessBlock = () -> Void
typealias SuccessBlockWithResult = (Any) -> Void
typealias ErrorBlock = (StatusMessage) -> Void
typealias CompletionBlock = (StatusMessage) -> Void
typealias StatusMessageBlock = (StatusMessage) -> Void

protocol BackendManagerType {
    func sendRequest(_ router: RequestRouter, successBlock: @escaping SuccessBlockWithResult, errorBlock: @escaping ErrorBlock)

}

class BackendManager: BackendManagerType {
    enum ResponseStatus: String {
        case success
        case fail
    }
    
    func sendRequest(_ router: RequestRouter, successBlock: @escaping SuccessBlockWithResult, errorBlock: @escaping ErrorBlock) {
        let request = AF.request(router)
        request.validate().responseJSON { (response) in
             //print(ConsoleHeader.http(), "[Request headers]:", router.urlRequest?.headers ?? "", response.debugDescription)
            switch response.result {
            case .success(let json):
                successBlock(json)
            case .failure(let error):
                if let afError = error.asAFError {
                switch afError {
                case .sessionTaskFailed(let sessionError):
                    if let urlError = sessionError as? URLError {
                        if urlError._code == NSURLErrorNotConnectedToInternet {
                            errorBlock(.networkError(message: error.localizedDescription))
                            return
                        }
                    }
                default:
                    break
                }
                    guard let data = response.data else { errorBlock(.unknown(message: error.localizedDescription, code: 444))
                        return
                    }
                    do {
                        let backendError = try JSONDecoder().decode(BackendError.self, from: data)
                        errorBlock(.serverError(message: backendError.description(), code: 444))
                    } catch {
                        errorBlock(.unknown(message: error.localizedDescription, code: 444))
                    }
                }
            }
        }
    }
    
}

struct BackendError: Decodable {
    let code: Int
    let message: String
    
    func description() -> String {
        guard code == 5234 else {
            return message
        }
        
        return "serverMessage_invalidNumber"
    }
}


