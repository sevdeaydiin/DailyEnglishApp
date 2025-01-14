import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPageIndex = 0
    @Published var userName = ""
    @Published var selectedAge: String?
    @Published var selectedGender: String?
    @Published var selectedCommitment: String?
    @Published var selectedTimeSpent: String?
    @Published var selectedOption: String?
    @Published var notificationSettings = NotificationSettings()
    
    var totalSteps: Int {
        pages.count + 1
    }
    
    var shouldShowContinueButton: Bool {
        if currentPage.type == .welcome {
            return true
        }
        if currentPage.options != nil {
            return selectedOption != nil
        }
        if currentPage.inputField {
            return !userName.isEmpty
        }
        return true
    }
    
    var lastPageTitle: String {
        "Ready to Take the Leap, \(userName)?"
    }
    
    let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "Tailor your word recommendations",
            subtitle: "Answer a few questions to get personalized word suggestions",
            buttonTitle: "Continue",
            options: nil,
            inputField: false,
            skipButton: false,
            type: .welcome,
            image: "book",
            showNotificationSettings: false
        ),
        OnboardingPage(
            title: "What do you want to be called?",
            subtitle: "Your name is used to personalize your experience",
            buttonTitle: "Continue",
            options: nil,
            inputField: true,
            skipButton: false,
            type: .name,
            image: nil,
            showNotificationSettings: false
        ),
        OnboardingPage(
            title: "What's your motivation for learning new words?",
            subtitle: "Select an option to continue",
            buttonTitle: "Continue",
            options: [
                "To improve my daily communication",
                "To express myself better in conversations",
                "To ace my language exams",
                "To enhance my professional vocabulary",
                "Other"
            ],
            inputField: false,
            skipButton: true,
            type: .source,
            image: nil,
            showNotificationSettings: false
        ),
        OnboardingPage(
            title: "Learn words with daily reminders",
            subtitle: "Allow notifications to get daily words",
            buttonTitle: "Allow and Save",
            options: nil,
            inputField: false,
            skipButton: true,
            type: .notifications,
            image: nil,
            showNotificationSettings: true
        ),
        OnboardingPage(
            title: "How challenging should it be?",
            subtitle: nil,
            buttonTitle: "Continue",
            options: [
                "Keep it light and easy.",
                "I want a bit of a challenge.",
                "Give me something advanced, I love pushing my limits!"
            ],
            inputField: false,
            skipButton: true,
            type: .level,
            image: nil,
            showNotificationSettings: false
        )
    ]
    
    var currentPage: OnboardingPage {
        if currentPageIndex == pages.count {
            return OnboardingPage(
                title: lastPageTitle,
                subtitle: "Start your personalized journey today and see the difference in no time.",
                buttonTitle: "Continue",
                options: nil,
                inputField: false,
                skipButton: false,
                type: .lastText,
                image: nil,
                showNotificationSettings: false
            )
        }
        return pages[currentPageIndex]
    }
    
    func nextPage() {
        selectedOption = nil
        if currentPageIndex < pages.count {
            if currentPage.type == .notifications {
                // Bildirim izinlerini iste
                requestNotificationPermissions()
            }
            currentPageIndex += 1
        } else {
            completeOnboarding()
        }
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            // Bildirim ayarlarını kaydet
            if granted {
                UserDefaults.standard.set(self.notificationSettings.frequency, forKey: "notificationFrequency")
                UserDefaults.standard.set(self.notificationSettings.startTime, forKey: "notificationStartTime")
                if let endTime = self.notificationSettings.endTime {
                    UserDefaults.standard.set(endTime, forKey: "notificationEndTime")
                }
            }
        }
    }
    
    func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
        UserDefaults.standard.set(userName, forKey: "userName")
        if let selectedOption = selectedOption {
            UserDefaults.standard.set(selectedOption, forKey: "userLevel")
        }
        
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: MainFeedView())
            }
        }
    }
    
    func isLastPage() -> Bool {
        return currentPageIndex == pages.count
    }
} 
