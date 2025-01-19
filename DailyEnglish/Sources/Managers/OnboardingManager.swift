//
//  OnboardingManager.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/19/25.
//

import Foundation

protocol OnboardingService {
    func onboardingComplete(
        deviceId: String,
        name: String,
        source: String,
        age: String,
        gender: String,
        commitment: String,
        timeSpent: String,
        notificationStartTime: String,
        notificationEndTime: String,
        notificationFrequency: Int,
        level: String,
        goal: [String],
        interested: [String]
    ) async throws -> User
}

final class OnboardingManager: OnboardingService {
    private let networkManager: NetworkService
        
        init(networkManager: NetworkService) {
            self.networkManager = networkManager
        }
    
    func onboardingComplete(
        deviceId: String,
        name: String,
        source: String,
        age: String,
        gender: String,
        commitment: String,
        timeSpent: String,
        notificationStartTime: String,
        notificationEndTime: String,
        notificationFrequency: Int,
        level: String,
        goal: [String],
        interested: [String]) async throws -> User {
            let body: [String: Any] = [
                "deviceId": deviceId,
                "name": name,
                "source": source,
                "age": age,
                "gender": gender,
                "commitment": commitment,
                "timeSpent": timeSpent,
                "notificationStartTime": notificationStartTime,
                "notificationEndTime": notificationEndTime,
                "notificationFrequency": notificationFrequency,
                "level": level,
                "goal": goal,
                "interested": interested
            ]
            let endpoint = UserEndpoint.onboarding(body: body)
            return try await networkManager.fetch(with: endpoint)
    }
}
