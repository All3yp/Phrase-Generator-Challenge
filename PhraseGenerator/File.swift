import Foundation

func readFile() {
    // Obter o caminho completo do arquivo
    guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("phrases.json").path else {
        fatalError("Não foi possível encontrar o arquivo.")
    }
    // Verificar se o arquivo existe
    if FileManager.default.fileExists(atPath: path) {
        do {
            // Ler os dados do arquivo
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            // Converter os dados em uma string legível

            let fileContents = String(data: data, encoding: .utf8)
//            print("O arquivo contém: \(fileContents ?? "")")
            
        } catch {
            fatalError("Erro ao ler os dados do arquivo.")
        }
    } else {
        fatalError("O arquivo não existe.")
    }
}

func parse(jsonData: Data) -> Frase? {
    do {
        let decodedData = try JSONDecoder().decode(Frase.self, from: jsonData)
        return decodedData
    } catch {
        print("error: \(error)")
    }
    return nil
}
