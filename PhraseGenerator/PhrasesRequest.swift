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
    
     func getting(completion: @escaping (_ phrase: [String]) -> Void) {
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
    
}
