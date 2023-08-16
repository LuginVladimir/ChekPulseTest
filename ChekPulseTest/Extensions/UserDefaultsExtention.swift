//
//  UserDefaultsExtention.swift
//  ChekPulseTest
//
//  Created by lugin on 16.08.23.
//

import Foundation

extension UserDefaults{

        private enum UserDafaultsDeys : String{
            case switchSate
            case signedUser
            case hasOnboarded
            case hasSubscription
        }
    
    var hasOnboarded: Bool {
        get{
            bool(forKey: UserDafaultsDeys.hasOnboarded.rawValue)
        }
        set{
           setValue(newValue, forKey: UserDafaultsDeys.hasOnboarded.rawValue)
        }
    }
    
    var hasSubscription: Bool {
        get{
            bool(forKey: UserDafaultsDeys.hasSubscription.rawValue)
        }
        set{
           setValue(newValue, forKey: UserDafaultsDeys.hasSubscription.rawValue)
        }
    }
    
    var switchIsOn: Bool {
        get{
//            UserDefaults.standard.bool(forKey: UserDafaultsDeys.switchSate.rawValue)
            bool(forKey: UserDafaultsDeys.switchSate.rawValue)
        }
        set{
//            UserDefaults.standard.setValue(newValue, forKey: UserDafaultsDeys.switchSate.rawValue)
           setValue(newValue, forKey: UserDafaultsDeys.switchSate.rawValue)
        }
    }
    
    var isUserSigned: User?{
        get {
            if let data = object(forKey: UserDafaultsDeys.signedUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
        }
        set {
            if (newValue == nil){
                removeObject(forKey: UserDafaultsDeys.signedUser.rawValue)
            } else{
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDafaultsDeys.signedUser.rawValue)
            }
            
        }
    }
}

struct UserDefaultManager {
    static let shared = UserDefaultManager()
    
    private init (){}
    
    var signeMan: User {
        set {
            
        }
        get {
            return User(firstName: "man'", lastName: "ger")
        }
    }
}

