//
//  StatusMessage.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import Foundation


enum StatusMessage: Error, Equatable {

    static func == (lhs: StatusMessage, rhs: StatusMessage) -> Bool {
        lhs.code == rhs.code
    }

    case networkError(message: String)
    case locationError(message: String)
    case parsError
    case unknown(message: String, code: Int?)
    case serverError(message: String, code: Int?)
    case serverSuccess(message: String)
    case warning(message: String)
    case retry(message: String, retry: () -> Void)
    case custom(title: String, message: String)
    case purchaseStatus(message: String)

    var title: String {
        switch self {
        case .networkError:
            return Localizations.StatusMessage.network_error
        case .locationError:
            return Localizations.StatusMessage.location_error
        case .parsError:
            return Localizations.StatusMessage.server_error
        case .unknown:
            return Localizations.StatusMessage.somthing_was_wrong
        case .purchaseStatus:
            return Localizations.StatusMessage.purchase_status_title
        case .custom(let title, _):
            return title
        case .serverError, .serverSuccess, .warning, .retry:
            return ""
        }
    }

    var description: String {
        switch self {
        case .networkError(let message):
            return message
        case .locationError(let message):
            return message
        case .parsError:
            return Localizations.StatusMessage.incorrect_server_response
        case .unknown(let message, _):
            return message
        case .serverError(let message, _), .serverSuccess(let message):
            return message
        case .warning(let message), .retry(let message, _):
            return message
        case .custom(_, let message):
            return message
        case .purchaseStatus(let message):
            return message
        }
    }

    var isSuccess: Bool {
        switch self {
        case .serverSuccess:
            return true
        default:
            return false
        }
    }

    var code: Int {
        switch self {
        case .serverError(_, let code):
            return code ?? 0
        default:
            return 0
        }
    }
}
