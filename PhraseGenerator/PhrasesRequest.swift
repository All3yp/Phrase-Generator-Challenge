//
//  PhrasesRequest.swift
//  PhraseGenerator
//
//  Created by userext on 11/05/23.
//

import Foundation

class PhrasesRequest {
  
  func getURL() -> URL? {
      let readDocumentsURL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
      let readFileURL = readDocumentsURL.appendingPathComponent("phrases.json")
      return FileManager.default.fileExists(atPath: readFileURL.path) ? readFileURL : nil
  }

    func getPhrases2() -> [String] {
        guard let readFileURL = getURL()
        else { return [] }
        
        do {
            let data = try Data(contentsOf: readFileURL)
            let fraseData = try JSONDecoder().decode(Phrases.self, from: data)
            return fraseData.phrases
        } catch {
            print(error)
            return []
        }
    }
  
    // MARK: - AJEITA AQUI :(
  func removePhrase(_ phrase: String) {
      getPhrases { phrases in
          if phrases.contains(phrase) {
              let newPhrases = phrases.filter { $0 != phrase }
            self.savePhrases(newPhrases)
              print("A frase foi removida com sucesso.\n")
          } else {
              print("A frase não foi encontrada no arquivo JSON.\n")
          }
      }
  }
  
  func savePhrases(_ phrases: [String]) {
      let readDocumentsURL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
      let writeFileURL = readDocumentsURL.appendingPathComponent("phrases.json")
      let newFraseData = Phrases(phrases: phrases)
      let newFraseJSON = try! JSONEncoder().encode(newFraseData)
      try! newFraseJSON.write(to: writeFileURL, options: .atomic)
  }
  
  
}
