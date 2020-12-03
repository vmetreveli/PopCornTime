//
//  Localizations.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import Foundation


//------------------------------------

public struct Localizations {

/// Value: PopCornTime
public static var app_name: String = NSLocalizedString("app_name", comment: "")
// ------------------------------------

public struct Buttons {
    /// Value: Ok
    public static var ok: String = NSLocalizedString("ok", comment: "")
    /// Value: Cancel
    public static var cancel: String = NSLocalizedString("cancel", comment: "")
    /// Value: Yes
    public static var yes: String = NSLocalizedString("yes", comment: "")
    /// Value: No
    public static var no: String = NSLocalizedString("no", comment: "")
}
// ------------------------------------

public struct StatusMessage {
    /// Value: Wrong email format
    public static var incorrect_email: String = NSLocalizedString("incorrect_email", comment: "")
    /// Value: The password must contain at least 8 characters, including a capital letter and a number!
    public static var incorrect_password: String = NSLocalizedString("incorrect_password", comment: "")
    /// Value: Wrong name
    public static var incorrect_username: String = NSLocalizedString("incorrect_username", comment: "")
    /// Value: Field can't be empty
    public static var field_cant_be_empty: String = NSLocalizedString("field_cant_be_empty", comment: "")
    /// Value:
    public static var password_doesnt_match: String = NSLocalizedString("password_doesnt_match", comment: "")
    /// Value: Opps! Something went wrong, try again
    public static var server_error: String = NSLocalizedString("server_error", comment: "")
    /// Value: There were problems with internet connection, try again
    public static var network_error: String = NSLocalizedString("network_error", comment: "")
    /// Value: Problems with check your location
    public static var location_error: String = NSLocalizedString("location_error", comment: "")
    /// Value: Opps! Something went wrong, try again.
    public static var somthing_was_wrong: String = NSLocalizedString("somthing_was_wrong", comment: "")
    /// Value: Something went wrong, try again
    public static var incorrect_server_response: String = NSLocalizedString("incorrect_server_response", comment: "")
    /// Value: Purchase status
    public static var purchase_status_title: String = NSLocalizedString("purchase_status_title", comment: "")
}
    
 
    
}
