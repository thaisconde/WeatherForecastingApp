import Foundation

enum CustomError: LocalizedError {
    case domainError
    case apiError
    case decodableError(Error)
    case jsonDataError
    case dataTaskError(Error)
    case authenticationError
    case notFound
    case badRequest
    case internalServerError
    case genericError(Int)
    
    var errorDescription: String {
        switch self {
        case .domainError:
            return "Found Domain Error"
        case .apiError:
            return "Found API URL error."
        case let .decodableError(error):
            return "Found error \(error)"
        case .jsonDataError:
            return "Found Json Data error"
        case let .dataTaskError(error):
            return "Found Data Task error. Error \(error)"
        case .authenticationError:
            return "Error 401: Authentication Error"
        case .notFound:
            return "Error 404: Not Found"
        case .badRequest:
            return "Error 422: Bad Request"
        case .internalServerError:
            return "Error 500: Internal Server Error"
        case let .genericError (code):
            return "Generic Error with Code: \(code)"
        }
    }
}
