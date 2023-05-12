//
//  PhrasesRequest.swift
//  PhraseGenerator
//
//  Created by userext on 11/05/23.
//

import Foundation

struct Frase: Codable {
  let frases: [String]
}

class PhrasesRequest {
  
  func get(completion: @escaping (_ phrase: [String]) -> Void) {
    let _: URLSession = URLSession.shared
    let readDocumentsURL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
    let readFileURL = readDocumentsURL.appendingPathComponent("phrases.json")
    do {
      let data = try Data(contentsOf: readFileURL)
      let fraseData = try JSONDecoder().decode(Frase.self, from: data)
      completion(fraseData.frases)
    } catch {
      print(error)
      completion([])
    }
  }
  
  func remove(_ phrase: String) {
    get { phrases in
      if phrases.contains(phrase) {
        let newPhrases = phrases.filter { $0 != phrase }
        let readDocumentsURL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let writeFileURL = readDocumentsURL.appendingPathComponent("phrases.json")
        let newFraseData = Frase(frases: newPhrases)
        let newFraseJSON = try! JSONEncoder().encode(newFraseData)
        try! newFraseJSON.write(to: writeFileURL, options: .atomic)
      } else {
        print("A frase não foi encontrada no arquivo JSON.\n")
      }
    }
  }
  
}
