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
let gettingRequest = PhrasesRequest()

func addNewPhrase(_ phrase: String) {}

func searchPhraseByKeyword(_ phrase: String) -> [String] { return [] }

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
      gettingRequest.get { phrase in
        print("- \(String(describing: phrase.randomElement()))\n")
      }
    case .addNewPhrase:
      print("Digite a nova frase:\n")
      if let newPhrase = readLine() {
        addNewPhrase(newPhrase)
        print("Nova frase adicionada com sucesso!\n")
      }
    case .removePhrase:
      print("Digite a frase a ser removida:\n")
      if let phraseToRemove = readLine() {
        gettingRequest.get { phrase in
          if phrase.contains(phraseToRemove) {
            gettingRequest.remove(phraseToRemove)
            print("Frase removida com sucesso:\n")
            print("- \(phraseToRemove)\n")
          } else {
            print("A frase não foi encontrada no arquivo JSON.\n")
          }
        }
      }
    case .showAllPhrases:
      gettingRequest.get { phrase in
        print("- \(phrase)\n")
      }
    case .searchPhraseByKeyword:
      print("Digite a palavra-chave:\n")
      if let keyword = readLine() {
        let matchingKeyword = searchPhraseByKeyword(keyword)
        for phrase in matchingKeyword {
          print("Frases que contem /\(phrase)/\n")
        }
      }
    case .quit:
      shouldQuit = true
    }
  } else {
    print("Opção invalida\n")
  }
}
