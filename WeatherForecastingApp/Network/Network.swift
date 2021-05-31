import Foundation

//existe alguma forma de deixar esse typealias privado?

typealias APIResponse<T> = Result<[T], CustomError>

protocol NetworkProtocol {
    func request<T: Decodable>(url: Endpoint, completion: @escaping (APIResponse<T>) -> Void)
}

class Network: NetworkProtocol {
    func request<T: Decodable>(url: Endpoint, completion: @escaping (APIResponse<T>) -> Void) {
        
        guard let url = URL(string: url.value) else {
            completion(.failure(.apiError))
            return }

        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: url) { [self] (data, response, error) in
            
            if error != nil {
                completion(.failure(.domainError))
                return
            }
            
            guard let responseStatus = response as? HTTPURLResponse,
                  case 200..<300 = responseStatus.statusCode else {
                self.handleErrorHTTPResponse(response: response) { (error) in  //precisaria de um [weak self] aqui?
                    completion(.failure(error))
                }
                return
            }
            
            guard let jsonData = data else {
                completion(.failure(.jsonDataError))
                return }
            
            self.decodableJSON(jsonData: jsonData, completion: completion)
        }
        
        dataTask.resume()
    }
}

private extension Network {
    private func handleErrorHTTPResponse(response: URLResponse?,
                                         completion: @escaping (CustomError) -> Void) {
        
        if let response = response as? HTTPURLResponse {
            switch response.statusCode {
            case 401:
                completion(.authenticationError)
            case 404:
                completion(.notFound)
            case 422:
                completion(.badRequest)
            case 500:
                completion(.internalServerError)
            default:
                completion(.genericError(response.statusCode))
            }
        }
    }
    
    private func decodableJSON<T: Decodable>(jsonData: Data,
                                             completion: @escaping (APIResponse<T>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: jsonData)
            completion(.success([decoded]))
        } catch {
            completion(.failure(.decodableError(error)))
        }
    }
}

