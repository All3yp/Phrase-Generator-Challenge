import Foundation
func readFile() {
    // Obtenha o caminho completo do arquivo
    guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Frases.txt").path else {
        fatalError("Não foi possível encontrar o arquivo.")
    }
    // Verifique se o arquivo existe
    if FileManager.default.fileExists(atPath: path) {
        do {
            // Leia os dados do arquivo
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            // Converta os dados em uma string legível
            let fileContents = String(data: data, encoding: .utf8)
            print("O arquivo contém: \(fileContents ?? "")")
        } catch {
            fatalError("Erro ao ler os dados do arquivo.")
        }
    } else {
        fatalError("O arquivo não existe.")
    }
}
