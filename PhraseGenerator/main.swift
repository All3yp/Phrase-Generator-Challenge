//
//  main.swift
//  PhraseGenerator
//
//  Created by userext on 09/05/23.
//

import Foundation

enum MenuOption: Int, CaseIterable {
  case generateRandomPhrase = 1
  case addNewPhrase, removePhrase, showAllPhrases, searchPhraseByKeyword, quit
  
  var description: String {
    switch self {
    case .generateRandomPhrase:
        return Constants.generateRandomPhrase
    case .addNewPhrase:
        return Constants.addNewPhrase
    case .removePhrase:
        return Constants.removePhrase
    case .showAllPhrases:
        return Constants.showAllPhrases
    case .searchPhraseByKeyword:
        return Constants.searchPhraseByKeyword
    case .quit:
        return Constants.quit
    }
  }
} //:EOF Enum

var shouldQuit = false

let phraseRequest = PhrasesRequest()

func addNewPhrase(_ phrase: String) {}

func searchPhraseByKeyword(_ keyword: String, _ completion: @escaping (_ results: [String]) -> Void) {
    phraseRequest.getPhrases { phrase in
      let results = phrase.filter { $0.lowercased().contains(keyword.lowercased()) }
      completion(results)
    }
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
      phraseRequest.getPhrases({ phrase in
        print("- \(String(describing: phrase.randomElement()))\n")
      })
      
    case .addNewPhrase:
        print(Constants.typeNewPhrase)
      if let newPhrase = readLine() {
        phraseRequest.getPhrases { phrases in
            let newPhrases = phrases + [newPhrase]
          phraseRequest.savePhrases(newPhrases)
        }
          print(Constants.phrasedAddedWithSucess)
      }
      
    case .removePhrase:
        print(Constants.typePhraseToRemove)
      if let phraseToRemove = readLine() {
        phraseRequest.removePhrase(phraseToRemove)
      }
      
    case .showAllPhrases:
      phraseRequest.getPhrases({ phrase in
        print("- \(phrase)\n")
      })
      
    case .searchPhraseByKeyword:
        print(Constants.typeKeyword)
      if let keyword = readLine() {
        searchPhraseByKeyword(keyword) { results in
          if results.isEmpty {
              print(Constants.anyPhraseNotFound)
          } else {
              print(Constants.phrasesFounded)
            for phrase in results {
              print("- \(phrase)")
            }
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
