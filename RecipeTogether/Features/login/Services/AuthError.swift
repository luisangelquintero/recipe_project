
enum AuthError: LocalizedError {
    case badURL, badResponse, decodeFailed
    var errorDescription: String? {
        switch self {
        case .badURL: "Bad login URL"
        case .badResponse: "Invalid email or password"
        case .decodeFailed: "Could not read server response"
        }
    }
}


//enum AuthError: LocalizedError, Equatable, Sendable {
//    case badURL
//    case badResponse(status: Int)   // carry the status code
//    case decodeFailed(underlying: Error?)
//    
//    var errorDescription: String? {
//        switch self {
//        case .badURL:
//            "Bad login URL"
//        case .badResponse(let status):
//            "Login failed (HTTP \(status)). Check your email and password."
//        case .decodeFailed:
//            "Could not read server response."
//        }
//    }
//}
