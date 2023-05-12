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
      return "Gerar nova frase aleatória"
    case .addNewPhrase:
      return "Adicionar nova frase"
    case .removePhrase:
      return "Remover frase existente"
    case .showAllPhrases:
      return "Exibir lista de frases"
    case .searchPhraseByKeyword:
      return "Pesquisar frase por palavra-chave"
    case .quit:
      return "Sair"
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
  print("Selecione uma opção:")
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
      print("Digite a nova frase:\n")
      if let newPhrase = readLine() {
        phraseRequest.getPhrases { phrases in
            let newPhrases = phrases + [newPhrase]
          phraseRequest.savePhrases(newPhrases)
        }
        print("Nova frase adicionada com sucesso!\n")
      }
      
    case .removePhrase:
      print("Digite a frase a ser removida:\n")
      if let phraseToRemove = readLine() {
        phraseRequest.removePhrase(phraseToRemove)
      }
      
    case .showAllPhrases:
      phraseRequest.getPhrases({ phrase in
        print("- \(phrase)\n")
      })
      
    case .searchPhraseByKeyword:
      print("Digite a palavra-chave:\n")
      if let keyword = readLine() {
        searchPhraseByKeyword(keyword) { results in
          if results.isEmpty {
            print("Nenhuma frase foi encontrada com a palavra-chave especificada.")
          } else {
            print("Frases encontradas:")
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
    print("Opção invalida\n")
  }
}
