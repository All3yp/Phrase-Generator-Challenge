//
//  main.swift
//  PhraseGenerator
//
//  Created by userext on 09/05/23.
//

import Foundation

var shouldQuit = false

let phraseRequest = PhrasesRequest()

func addNewPhrase(_ phrase: String) {}

func searchPhraseByKeyword(_ keyword: String) -> [String] {
    let phrase = phraseRequest.getPhrases2()
    let results = phrase.filter { $0.lowercased().contains(keyword.lowercased()) }
    return results
  }

let phrases = phraseRequest.getPhrases2()
if let randomPhrase = phrases.randomElement() {
    print("-", randomPhrase, "\n")
}

while (!shouldQuit) {
    print(Constants.selectAnOption)
  for option in MenuOption.allCases {
    print("\(option.rawValue). \(option.description)")
  }
  
  if let input = readLine(),
     let selectedOption = Int(input),
     let option = MenuOption(rawValue: selectedOption) {
    switch option {
      
    case .generateRandomPhrase:
        if let randomPhrase = phrases.randomElement() {
            print("-", randomPhrase, "\n")
        }
      
    case .addNewPhrase:
        print(Constants.typeNewPhrase)
        if let newPhrase = readLine() {
            let phrase = phraseRequest.getPhrases2()
            let newPhrases = phrase + [newPhrase]
            phraseRequest.savePhrases(newPhrases)
            print(Constants.phrasedAddedWithSucess)
        }
    case .removePhrase:
        print(Constants.typePhraseToRemove)
      if let phraseToRemove = readLine() {
        phraseRequest.removePhrase(phraseToRemove)
      }
        
    case .showAllPhrases:
        let array = phraseRequest.getPhrases2()
        array.forEach { phrase in
            print(phrase)
        }
      
    case .searchPhraseByKeyword:
        print(Constants.typeKeyword)
      if let keyword = readLine() {
          
          let searchKey = searchPhraseByKeyword(keyword)
          if searchKey.isEmpty {
              print(Constants.anyPhraseNotFound)
          } else {
              print(Constants.phrasesFounded)
            for phrase in searchKey {
              print("- \(phrase)")
            }
          }
        }
    case .quit:
      shouldQuit = true
    }
  } else {
      print(Constants.invalidOption)
  }
}
