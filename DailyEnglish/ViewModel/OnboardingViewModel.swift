import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPageIndex = 0
    @Published var userName = ""
    @Published var selectedAge: String?
    @Published var selectedGender: String?
    @Published var selectedCommitment: String?
    @Published var selectedTimeSpent: String?
    
    let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "Expand your Vocabulary in 1 minute a day",
            subtitle: "Learn 10,000+ new words with a new daily habit that takes just 1 minute",
            buttonTitle: "Get started",
            options: nil,
            inputField: false,
            skipButton: false,
            type: .welcome
        ),
        OnboardingPage(
            title: "How did you hear about Vocabulary?",
            subtitle: "Select an option to continue",
            buttonTitle: "Continue",
            options: ["TikTok", "Instagram", "Facebook", "App Store", "Web search", "Friend/family", "Other"],
            inputField: false,
            skipButton: false,
            type: .source
        ),
        OnboardingPage(
            title: "How old are you?",
            subtitle: "Your age is used to personalize your content",
            buttonTitle: "Continue",
            options: ["13 to 17", "18 to 24", "25 to 34", "35 to 44", "45 to 54", "55+"],
            inputField: false,
            skipButton: false,
            type: .age
        ),
        OnboardingPage(
            title: "Which option represents you best?",
            subtitle: "Select an option to continue",
            buttonTitle: "Continue",
            options: ["Female", "Male", "Other", "Prefer not to say"],
            inputField: false,
            skipButton: false,
            type: .gender
        ),
        OnboardingPage(
            title: "What do you want to be called?",
            subtitle: "Your name is used to personalize your experience",
            buttonTitle: "Continue",
            options: nil,
            inputField: true,
            skipButton: true,
            type: .name
        ),
        OnboardingPage(
            title: "How many days in a row will you learn words?",
            subtitle: "Commit to building a learning habit by coming back every day",
            buttonTitle: "Continue",
            options: ["3 days", "7 days", "21 days"],
            inputField: false,
            skipButton: true,
            type: .commitment
        ),
        OnboardingPage(
            title: "How much time will you devote to learning?",
            subtitle: "You can always change your goal later",
            buttonTitle: "Continue",
            options: ["1 minute a day", "3 minutes a day", "5 minutes a day"],
            inputField: false,
            skipButton: true,
            type: .timeSpent
        )
    ]
    
    var currentPage: OnboardingPage {
        pages[currentPageIndex]
    }
    
    func nextPage() {
        if currentPageIndex < pages.count - 1 {
            currentPageIndex += 1
        } else {
            completeOnboarding()
        }
    }
    
    func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
        // Burada kullanıcı tercihlerini kaydetme işlemleri yapılabilir
    }
    
    func isLastPage() -> Bool {
        return currentPageIndex == pages.count - 1
    }
} 