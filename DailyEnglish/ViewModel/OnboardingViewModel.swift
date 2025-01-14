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
    @Published var selectedOptions: Set<String> = []
    @Published var notificationSettings = NotificationSettings()
    
    var totalSteps: Int {
        pages.count + 1
    }
    
    var shouldShowContinueButton: Bool {
        let page = currentPage
        
        // Name input kontrolü
        if page.inputField {
            return !userName.isEmpty
        }
        
        // Options kontrolü
        if let _ = page.options {
            if page.allowMultipleSelection {
                return !selectedOptions.isEmpty
            } else {
                return selectedOption != nil
            }
        }
        
        // Diğer tüm sayfalar için true
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
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "How did you hear about Vocabulary?",
            subtitle: "Select an option to continue",
            buttonTitle: "Continue",
            options: [
                "TikTok",
                "Instagram",
                "App Store",
                "Friend/Family",
                "Other"
            ],
            inputField: false,
            skipButton: false,
            type: .source,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "Tailor your word recommendations",
            subtitle: "Answer a few questions to get personalized word suggestions",
            buttonTitle: "Continue",
            options: nil,
            inputField: false,
            skipButton: false,
            type: .welcome,
            image: "book",
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "How old are you?",
            subtitle: "Your age is used yo personalize your content",
            buttonTitle: "Continue",
            options: [
                "13 to 17",
                "18 to 24",
                "25 to 34",
                "35 to 44",
                "45 to 54",
                "55+"
            ],
            inputField: false,
            skipButton: false,
            type: .age,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "Which option represents you best?",
            subtitle: "Select an option to continue",
            buttonTitle: "Continue",
            options: [
                "Female",
                "Male",
                "Prefer not to say",
            ],
            inputField: false,
            skipButton: false,
            type: .gender,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: false
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
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "Tailor your word recommendations",
            subtitle: "Answer a few questions to get personalized word suggestions",
            buttonTitle: "Continue",
            options: nil,
            inputField: false,
            skipButton: false,
            type: .welcome,
            image: "book",
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "How many days in a row will you learn words?",
            subtitle: "Commit to building a learning habit by coming back every day",
            buttonTitle: "Continue",
            options: [
                "3 days",
                "7 days",
                "21 days",
            ],
            inputField: false,
            skipButton: false,
            type: .commitment,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "How much time will you devote to learning?",
            subtitle: "You can always change your goal later",
            buttonTitle: "Continue",
            options: [
                "1 minute a day",
                "3 minute a day",
                "5 minute a day",
            ],
            inputField: false,
            skipButton: false,
            type: .timeSpent,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "Learn words with daily reminders",
            subtitle: "Allow notifications to get daily words",
            buttonTitle: "Allow and Save",
            options: nil,
            inputField: false,
            skipButton: false,
            type: .notifications,
            image: nil,
            showNotificationSettings: true,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "What's your vocabulary level?",
            subtitle: "Select an option to continue",
            buttonTitle: "Continue",
            options: [
                "Beginner",
                "Intermadiate",
                "Advanced"
            ],
            inputField: false,
            skipButton: true,
            type: .level,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: false
        ),
        OnboardingPage(
            title: "Do you have a spesific goal in mind",
            subtitle: "Select at least one option to continue",
            buttonTitle: "Continue",
            options: [
                "Enhance my lexicon",
                "Get ready for a test",
                "Improve my job propects",
                "Enjoy learning new words",
                "Other"
            ],
            inputField: false,
            skipButton: false,
            type: .goal,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: true
        ),
        OnboardingPage(
            title: "Which topics are you interested in",
            subtitle: "Select at least one to continue",
            buttonTitle: "Continue",
            options: [
                "Society",
                "Words in foreign languages",
                "Human body",
                "Emotions",
                "Business",
                "Other"
            ],
            inputField: false,
            skipButton: false,
            type: .interested,
            image: nil,
            showNotificationSettings: false,
            allowMultipleSelection: true
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
                showNotificationSettings: false,
                allowMultipleSelection: false
            )
        }
        return pages[currentPageIndex]
    }
    
    func toggleOption(_ option: String) {
        if currentPage.allowMultipleSelection {
            if selectedOptions.contains(option) {
                selectedOptions.remove(option)
            } else {
                selectedOptions.insert(option)
            }
        } else {
            selectedOption = option
        }
    }
    
    func isOptionSelected(_ option: String) -> Bool {
        if currentPage.allowMultipleSelection {
            return selectedOptions.contains(option)
        } else {
            return selectedOption == option
        }
    }
    
    func nextPage() {
        if currentPage.allowMultipleSelection {
            selectedOptions = []
        } else {
            selectedOption = nil
        }
        
        if currentPageIndex < pages.count {
            if currentPage.type == .notifications {
                requestNotificationPermissions()
            }
            currentPageIndex += 1
        } else {
            completeOnboarding()
        }
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
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
        if !selectedOptions.isEmpty {
            UserDefaults.standard.set(Array(selectedOptions), forKey: "userMotivations")
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
