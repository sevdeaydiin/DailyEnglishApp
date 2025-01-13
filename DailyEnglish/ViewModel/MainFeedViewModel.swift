import Foundation
import AVFoundation
import SwiftUI

class MainFeedViewModel: ObservableObject {
    @Published var words: [Word] = []
    @Published var currentIndex: Int = 0
    @Published var isLoading = false
    private var audioPlayer: AVPlayer?
    
    init() {
        // TODO: Initialize with actual word data
        loadSampleWords()
    }
    
    private func loadSampleWords() {
        words = [
            Word(
                word: "Serendipity",
                phonetic: "/ˌserənˈdipəti/",
                definition: "The occurrence and development of events by chance in a happy or beneficial way"
            ),
            Word(
                word: "Ephemeral",
                phonetic: "/əˈfem(ə)rəl/",
                definition: "Lasting for a very short time"
            ),
            Word(
                word: "Ubiquitous",
                phonetic: "/yo͞oˈbikwədəs/",
                definition: "Present, appearing, or found everywhere"
            )
        ]
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
        guard var word = currentWord else { return }
        word.isLiked.toggle()
        words[currentIndex] = word
        // TODO: Persist changes
    }
    
    func toggleSave() {
        guard var word = currentWord else { return }
        word.isSaved.toggle()
        words[currentIndex] = word
        // TODO: Persist changes
    }
    
    func playPronunciation() {
        guard let audioUrl = currentWord?.audioUrl else { return }
        audioPlayer = AVPlayer(url: audioUrl)
        audioPlayer?.play()
    }
    
    func share() {
        // TODO: Implement share functionality
    }
} 
