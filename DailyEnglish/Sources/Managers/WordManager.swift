//
//  WordManager.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/13/25.
//

import Foundation
import CoreData

class WordManager {
    static let shared = WordManager()
    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DailyEnglish")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func createWord(definition: String, isLiked: Bool, isSaved: Bool, isShared: Bool, language: String, pronunciation: String, word: String) {
        let context = persistentContainer.viewContext
        let newWord = Word(context: context)
        newWord.definition = definition
        newWord.isLiked = isLiked
        newWord.isSaved = isSaved
        newWord.isShared = isShared
        newWord.language = language
        newWord.pronunciation = pronunciation
        newWord.word = word
        
        saveContext()
    }

    func loadSampleWords() {
        let sampleWords = [
            ("Apple", "A fruit that is red, green, or yellow.", false, false, false, "English", "ˈæp.əl"),
            ("Banana", "A long yellow fruit.", false, false, false, "English", "bəˈnæn.ə"),
            ("Cat", "A small domesticated carnivorous mammal.", false, false, false, "English", "kæt"),
            ("Dog", "A domesticated carnivorous mammal.", false, false, false, "English", "dɔɡ"),
            ("Elephant", "A large mammal with a trunk.", false, false, false, "English", "ˈɛl.ɪ.fənt"),
            ("Fish", "A limbless cold-blooded vertebrate animal.", false, false, false, "English", "fɪʃ"),
            ("Grape", "A berry, typically green or purple.", false, false, false, "English", "ɡreɪp"),
            ("House", "A building for human habitation.", false, false, false, "English", "haʊs"),
            ("Ice", "Frozen water.", false, false, false, "English", "aɪs"),
            ("Juice", "A drink made from the extraction of fruit or vegetable.", false, false, false, "English", "dʒuːs")
        ]
        
        for word in sampleWords {
            createWord(definition: word.1, isLiked: word.2, isSaved: word.3, isShared: word.4, language: word.5, pronunciation: word.6, word: word.0)
        }
    }

    func fetchWords() -> [Word]? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetch failed: \(error)")
            return nil
        }
    }

    func updateWord(word: Word, definition: String, isLiked: Bool, isSaved: Bool, isShared: Bool, language: String, pronunciation: String) {
        word.definition = definition
        word.isLiked = isLiked
        word.isSaved = isSaved
        word.isShared = isShared
        word.language = language
        word.pronunciation = pronunciation
        
        saveContext()
    }

    func deleteWord(word: Word) {
        let context = persistentContainer.viewContext
        context.delete(word)
        saveContext()
    }

    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
