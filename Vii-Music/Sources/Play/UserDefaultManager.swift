//
//  UserDefaultManager.swift
//  Vii-Music
//
//  Created by Артем Орлов on 21.01.2023.
//

import Foundation

class UserDefaultManager {

    let defaults = UserDefaults.standard

    func getData() -> String {
        return defaults.string(forKey: "tracks") ?? ""
    }

    func setData(data: String) {
        defaults.set(data, forKey: "tracks")
    }


}
