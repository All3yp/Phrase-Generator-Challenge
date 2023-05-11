//
//  main.swift
//  PhraseGenerator
//
//  Created by userext on 09/05/23.
//

import Foundation

//enum MenuOption: Int, CaseIterable {
//case generateRandomPhrase = 1
//case addNewPhrase, removePhrase, showAllPhrases, searchPhraseByKeyword, quit
//
//    var description: String {
//        switch self {
//        case .generateRandomPhrase:
//            return "Gerar nova frase aleatória"
//        case .addNewPhrase:
//            return "Adicionar nova frase"
//        case .removePhrase:
//            return "Remover frase existente"
//        case .showAllPhrases:
//            return "Exibir lista de frases"
//        case .searchPhraseByKeyword:
//            return "Pesquisar frase por palavra-chave"
//        case .quit:
//            return "Sair"
//        }
//    }
//} //:EOF Enum
//
//var shouldQuit = false
//
//func generateRandomPhrase() {}
//func addNewPhrase(_ phrase: String) {}
//func removePhrase(_ phrase: String) {}
//func getAllPhrases() -> [String] { return [] }
//
//func searchPhraseByKeyword(_ phrase: String) -> [String] { return [] }
//
//while (!shouldQuit) {
//    print("Selecione uma opção:")
//    for option in MenuOption.allCases {
//        print("\(option.rawValue). \(option.description)")
//    }
//
//    if let input = readLine(),
//       let selectedOption = Int(input),
//       let option = MenuOption(rawValue: selectedOption) {
//        switch option {
//        case .generateRandomPhrase:
//            let randomPhrase: () = generateRandomPhrase()
//            print(randomPhrase)
//        case .addNewPhrase:
//
//            print("Digite a nova frase:\n")
//            if let newPhrase = readLine() {
//                addNewPhrase(newPhrase)
//                print("Nova frase adicionada com sucesso!\n")
//            }
//        case .removePhrase:
//            print("Digite a frase a ser removida:\n")
//            if let phraseToRemove = readLine() {
//                removePhrase(phraseToRemove)
//            }
//        case .showAllPhrases:
//            let phrases = getAllPhrases()
//            print("Lista de frases:\n")
//            for phrase in phrases {
//                print("- \(phrase)")
//            }
//        case .searchPhraseByKeyword:
//            print("Digite a palavra-chave:\n")
//            if let keyword = readLine() {
//                let matchingKeyword = searchPhraseByKeyword(keyword)
//                for phrase in matchingKeyword {
//                    print("Frases que contem /\(phrase)/\n")
//                }
//            }
//        case .quit:
//            break
//        }
//    } else {
//        print("Opção invalida\n")
//    }
//}

let jsonData: () = readFile()
//if let data = jsonData {
//    if let sampleRecordObj = parse(jsonData: data) {
//        //You can read sampleRecordObj just like below.
//        print("users list: \(sampleRecordObj.users)")
//        print("firstName:\(sampleRecordObj.users.first?.firstName ?? "")")
//    }
//
//}

let url = URL(filePath: "phrases.json")

do {
    let (data, _) = try await URLSession.shared.downloadTask(with: url)
    print(data)
}

let data = jsonData
let test = parse(jsonData: data)
print(test)
