//
//  Phrases.swift
//  PhraseGenerator
//
//  Created by userext on 09/05/23.
//

import Foundation
/*
 Brainstorming de ideias 💡

Criar um txtzin para armazenar as frases. ✅
Criar um txtzin para guardar as frases (Na hora que ele ler ele escreve)
Criar uma func p ler o arquivo de texto e armazenar as frases em uma matriz;
Criar uma func p gerar uma frase aleatória a partir da matriz de frases armazenadas;
Criar uma opção de menu (switchzin de menu classico) para permitir que o usuário peça uma nova frase aleatória;
Criar opções de menu adicionais para permitir que o usuário adicione ou remova frases do arquivo de texto;
Criar uma opção de menu pro usuário pesquisar por uma palavra(?) (tinha pensado em ID mas ID so se fosse como dicionario) e exibir uma frase  que a possui;
Implementar tratamento de erros para exceções como quando o arquivo de texto não existir ou não puder ser aberto.
*/


// MARK: - LOOP PRA LER ARRAY DE FRASES


//let frases = ["Eu adoro gatinhos", "Pizza de calabresa é muito bom", "Cheguei atrasado na faculdade hoje", "Queimei a língua tomando chocolate quente"]
//
//func PrintarFrase (array: [String]) -> String {
//    if let fraseAleatoria = array.randomElement() {
//        return(fraseAleatoria) } else {
//            return("Lista de frases vazia")
//        }
//
//}
//
//print(PrintarFrase(array: frases))

// MARK: - FILE MANAGER

//guard let fileURL = Bundle.main.url(forResource: "Frases", withExtension: "txt") else {
//    fatalError("Não foi possível encontrar o arquivo.")
//}
//
//do {
//    let contents = try String(contentsOf: fileURL)
//    let frases = contents.components(separatedBy: .newlines)
//
//    let randomIndex = Int.random(in: 0..<frases.count)
//    let fraseAleatoria = frases[randomIndex]
//
//    print("A frase aleatória é: \(fraseAleatoria)")
//} catch {
//    fatalError("Erro ao ler o arquivo.")
//}

