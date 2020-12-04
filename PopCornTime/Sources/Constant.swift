//
//  Constant.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import UIKit


public enum ConsoleHeader {
    case info(_ file: String = #file, _ function: String = #function, _ line: Int = #line)
    case attention (_ file: String = #file, _ function: String = #function, _ line: Int = #line)
    case http (_ file: String = #file, _ function: String = #function, _ line: Int = #line)
    case httpError (_ file: String = #file, _ function: String = #function, _ line: Int = #line)
    case dealloc (_ className: String)
}

extension ConsoleHeader: CustomStringConvertible {
    public var description: String {
        switch self {
        case .info(let file, let function, let line):
            return  "🔸 \(file.split(separator: "/").last ?? "") -> 🔸 Function: \(function) -> 🔸 Line: \(line)"
        case .attention(let file, let function, let line):
            return  "❗️ \(file.split(separator: "/").last ?? "") -> ❗️ Function: \(function) -> ❗️ Line: \(line)"
        case .http(let file, let function, let line):
            return  "🟢 \(file.split(separator: "/").last ?? "") -> 🟢 Function: \(function) -> 🟢 Line: \(line)"
        case .httpError(let file, let function, let line):
            return  "🔴 \(file.split(separator: "/").last ?? "") -> 🔴 Function: \(function) -> 🔴 Line: \(line)"
        case .dealloc(let className):
            return "🆘 - ☠️ \(className) is deallocated "
        }
    }
}

public func print(_ items: Any..., separator: String = "\n", terminator: String = "\n") {
    #if DEBUG
    var output = ""
    if let header = items.first as? ConsoleHeader {
        output = ([header] + items.dropFirst()).map { "\($0)" }.joined(separator: separator)
    } else {
        output = items.map { "\($0)" }.joined(separator: separator)
    }

    Swift.print("\n\(output)\n", terminator: terminator)
    #endif

    //CustomDebugger.shared.print(msg: output)
}


//==============================================================
// MARK: - Typealias
//==============================================================


//typealias SlidesCompletionHandler = (Result<[SlideModel], StatusMessage>) -> Void
//typealias BranchesCompletionHandler = (Result<BranchesWholeDataModel, StatusMessage>) -> Void
//typealias OffersCompletionHandler = (Result<[OfferModel], StatusMessage>) -> Void
typealias PopularMovieDataCompletionHandler = (Result<[PopularMovieModel], StatusMessage>) -> Void
// typealias TransactionHistoryHandler = (Result<[TransactionHistoryModel], StatusMessage>) -> Void
//
//typealias CompletionResult = (Result<[String: Any], StatusMessage>) -> Void
//typealias DismissCompletion = (_ result: Any?) -> Void
//typealias CompletionResultInt = (Result<Int, StatusMessage>) -> Void
//typealias CompletionResultString = (Result<String, StatusMessage>) -> Void
//typealias ConfigAlert = (statusMessage: StatusMessage, titleOK: String?, titleCancel: String?, action: ((UIAlertAction) -> Void)?, action2: ((UIAlertAction) -> Void)?)
////
//typealias CompletionResultUser = (Result<User?, StatusMessage>) -> Void


//==============================================================
// MARK: - Constant
//==============================================================

struct Constant {
    static let baseURL = "https://api.themoviedb.org/3/movie"
    static let imagebaseURL = "https://image.tmdb.org/t/p/w440_and_h660_face"
    
    struct NotificationCenterKey {
        static let userDidLogout = "NotificationCenterKey_UserDidLogout"
        static let userDidAutoLogout = "NotificationCenterKey_UserDidAutpLogout"
        static let deselectRow = "NotificationCenterKey_deselectRow"
        static let networkReachable = "NotificationCenterKey_NetworkReachable"
        static let networkUnReachable = "NotificationCenterKey_NetworkUnReachable"
        static let premiumPurchaseStateNotification = "NotificationCenterKey_updatePurchaseState"
        static let showConversationFromNotification = "NotificationCenterKey_ShowConversationFromNotification"
        static let showInterstitialAdMob = "NotificationCenterKey_ShowInterstitialAdMob"
        static let updateUnreadConversationsBadge = "NotificationCenterKey_updateUnreadConversationsBadge"
        static let sockedDidConnect = "NotificationCenterKey_sockedDidConnect"
    }

    struct Fonts {
        static let OpenSans = "OpenSans"
        static let OpenSansBold = "OpenSans-Bold"
        static let OpenSansSemibold = "OpenSans-Semibold"
        
        static let Helvetica = "HelveticaNeueLTGEOW82-45Lt"
        static let HelveticaBold = "HelveticaNeueLTGEOW82-75Bd"
        static let HelveticaCaps = "helveticaneue_caps.ttf"
//        static let HelveticaCaps = "HelveticaNeueLTGEO-55Roman"
        
        static let HelveticaMedium = "HelveticaNeueLTGEOW82-55Rm"

    }

    static var isiPhoneSE: Bool {
        let heightScreen = UIScreen.main.bounds.size.height
        return (heightScreen <= 568)
    }
    
    struct UserDefaultKeys {
        static var ID_TOKEN = "16469fcd24a79b005d4886e4e3c56ede"
        static var USER_DATA = "USER_DATA"
    }
 
}

