import Foundation
import AVFoundation
import SwiftUI
import CoreData

class MainFeedViewModel: ObservableObject {
    @Published var words: [Word] = []
    @Published var currentIndex: Int = 0
    @Published var isLoading = false
    private var audioPlayer: AVPlayer?
    private let wordManager = WordManager.shared
    
    init() {
        loadWords()
    }
    
    private func loadWords() {
        if let fetchedWords = wordManager.fetchWords(), !fetchedWords.isEmpty {
            self.words = fetchedWords
        } else {
            wordManager.loadSampleWords()
            self.words = wordManager.fetchWords() ?? []
        }
    }
    
    var currentWord: Word? {
        guard !words.isEmpty, currentIndex >= 0, currentIndex < words.count else { return nil }
        return words[currentIndex]
    }
    
    func moveToNext() {
        guard currentIndex < words.count - 1 else { return }
        currentIndex += 1
    }
    
    func moveToPrevious() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
    }
    
    func toggleLike() {
        guard let word = currentWord else { return }
        wordManager.updateWord(
            word: word,
            definition: word.definition ?? "",
            isLiked: !word.isLiked,
            isSaved: word.isSaved,
            isShared: word.isShared,
            language: word.language ?? "English",
            pronunciation: word.pronunciation ?? ""
        )
        loadWords()
    }
    
    func toggleSave() {
        guard let word = currentWord else { return }
        wordManager.updateWord(
            word: word,
            definition: word.definition ?? "",
            isLiked: word.isLiked,
            isSaved: !word.isSaved,
            isShared: word.isShared,
            language: word.language ?? "English",
            pronunciation: word.pronunciation ?? ""
        )
        loadWords()
    }
    
    func playPronunciation() {
        // TODO: Implement audio playback functionality
    }
    
    func share() {
        guard let word = currentWord else { return }
        wordManager.updateWord(
            word: word,
            definition: word.definition ?? "",
            isLiked: word.isLiked,
            isSaved: word.isSaved,
            isShared: true,
            language: word.language ?? "English",
            pronunciation: word.pronunciation ?? ""
        )
        loadWords()
    }
} 
