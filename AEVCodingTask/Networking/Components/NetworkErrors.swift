import Foundation

enum NetworkErrors: String, Error {
    case badInput = "Die Eingabe war Fehlerhaft. Versuchen Sie es noch einmal."
    case noData = "Es konnten keine Daten emfangen werden."
}
