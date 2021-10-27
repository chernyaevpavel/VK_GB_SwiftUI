//
//  APIService.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 12.10.2021.
//

import Foundation
import Alamofire


class APIService {
    private let sheme = "https"
    private let host = "api.vk.com"
    private let versionAPI = "5.131"
    
    private func getSessionToken() -> String? {
        let sessionToken = Session.shared.token
        if sessionToken.isEmpty {
            print("Не удалось получить ключ доступа к приложению")
            return nil
        }
        return sessionToken
    }
    
    func getFriends(completion: @escaping([User])->()) {
        let path = "/method/friends.get"
        let queryItems = [
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_200_orig, online")
        ]
        
        let operationQueue = OperationQueue()
        let getDataOperation = GetDataOperation(path, queryItems)
        operationQueue.addOperation(getDataOperation)
        
        let parseData = ParseDataToUsers()
        parseData.addDependency(getDataOperation)
        operationQueue.addOperation(parseData)
        
        parseData.completionBlock = {
            completion(parseData.users)
        }
    }
    
    func getGroups(completion: @escaping([Group])->()) {
        let path = "/method/groups.get"
        let  queryItems = [
            URLQueryItem(name: "extended", value: "1"),
        ]
        
        if let urlConstructor = makeURLConstructor(path, queryItems) {
            let configuration = URLSessionConfiguration.default
            let session =  URLSession(configuration: configuration)
            let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
                guard let dataResp = data else { return }
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let groupResponse = try? jsonDecoder.decode(GroupResponse.self, from: dataResp)
                guard let groups = groupResponse?.response.items else { return }
                DispatchQueue.main.async {
                    completion(groups)
                }
            }
            task.resume()
        }
    }
    
    func getPhotos(ownerID: String, completion: @escaping([Photo])->()){
        let path = "/method/photos.getAll"
        let queryItems = [
            URLQueryItem(name: "owner_id", value: ownerID),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "offset", value: ""),
            URLQueryItem(name: "count", value: "200"),
            URLQueryItem(name: "photo_sizes", value: "0"),
            URLQueryItem(name: "no_service_albums", value: "0"),
            URLQueryItem(name: "need_hidden", value: "0"),
            URLQueryItem(name: "skip_hidden", value: "1")
        ]
        
        if let urlConstructor = makeURLConstructor(path, queryItems) {
            let configuration = URLSessionConfiguration.default
            let session =  URLSession(configuration: configuration)
            let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
                guard let dataResp = data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let photoResponse = try jsonDecoder.decode(FullResponsePhoto.self, from: dataResp)
                    let photos = photoResponse.response.items
                    DispatchQueue.main.async {
                        completion(photos)
                    }
                } catch DecodingError.dataCorrupted(let context) {
                    print(DecodingError.dataCorrupted(context))
                } catch DecodingError.keyNotFound(let key, let context) {
                    print(DecodingError.keyNotFound(key,context))
                } catch DecodingError.typeMismatch(let type, let context) {
                    print(DecodingError.typeMismatch(type,context))
                } catch DecodingError.valueNotFound(let value, let context) {
                    print(DecodingError.valueNotFound(value,context))
                } catch let error{
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    static func makeAuthURLRequest() -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7884575"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,wall,groups"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
    
    func makeURLConstructor(_ path: String, _ queryItems: [URLQueryItem]) -> URLComponents? {
        guard let sessionToken = getSessionToken() else { return nil }
        var urlConstructor = URLComponents()
        urlConstructor.scheme = sheme
        urlConstructor.host = host
        urlConstructor.path = path
        urlConstructor.queryItems =  [URLQueryItem(name: "access_token", value: sessionToken)] + queryItems + [URLQueryItem(name: "v", value: versionAPI)]
        
        return urlConstructor
    }
}
