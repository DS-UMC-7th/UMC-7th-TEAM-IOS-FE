//
//  HomeService.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import Foundation
import Alamofire

final class HomeService {
    
    static let shared = HomeService()
    private init() {}
    
    func fetchRecommendedBooks(sortedBy: String = "highest", page: Int = 0, size: Int = 3, completion: @escaping (Result<[BookModel], Error>) -> Void) {
        let baseURL = "http://ec2-3-39-137-120.ap-northeast-2.compute.amazonaws.com:8080/books"
        let parameters: [String: Any] = [
            "sortedBy": sortedBy,
            "page": page,
            "size": size
        ]
        
        AF.request(baseURL, method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: BookResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.result.books))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
