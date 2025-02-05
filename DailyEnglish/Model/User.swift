//
//  User.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/19/25.
//

import Foundation

struct User: Decodable, Identifiable {
    var _id: String
    var id: String { return _id }
    var deviceId: String
    let name: String
    let source: String
    let age: String
    let gender: String
    let commitment: String
    let timeSpent: String
    let notificationStartTime: String
    let notificationEndTime: String
    let notificationFrequency: Int
    let level: String
    let goal: [String]
    let interested: [String]
}
