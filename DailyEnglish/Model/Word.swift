import Foundation

struct Word: Identifiable, Codable, Equatable {
    let id: UUID
    let word: String
    let phonetic: String
    let definition: String
    let audioUrl: URL?
    var isLiked: Bool
    var isSaved: Bool
    
    init(id: UUID = UUID(), word: String, phonetic: String, definition: String, audioUrl: URL? = nil, isLiked: Bool = false, isSaved: Bool = false) {
        self.id = id
        self.word = word
        self.phonetic = phonetic
        self.definition = definition
        self.audioUrl = audioUrl
        self.isLiked = isLiked
        self.isSaved = isSaved
    }
    
    static func == (lhs: Word, rhs: Word) -> Bool {
        lhs.id == rhs.id &&
        lhs.word == rhs.word &&
        lhs.phonetic == rhs.phonetic &&
        lhs.definition == rhs.definition &&
        lhs.audioUrl == rhs.audioUrl &&
        lhs.isLiked == rhs.isLiked &&
        lhs.isSaved == rhs.isSaved
    }
} 