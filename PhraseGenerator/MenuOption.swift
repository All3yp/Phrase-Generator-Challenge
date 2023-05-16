//
//  MenuOption.swift
//  PhraseGenerator
//
//  Created by userext on 12/05/23.
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
} 
