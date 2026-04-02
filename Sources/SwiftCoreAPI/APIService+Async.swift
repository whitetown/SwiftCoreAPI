//
//  APIService+Async.swift
//
//  Created by Sergey Chehuta on 02/04/2026.
//  Copyright © 2026 WhiteTown. All rights reserved.
//

import Foundation

@available(iOS 13.0, *)
public extension APIService {

    func load<T: Decodable>(_ resource: APIResource, _ type: T.Type) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            self.load(resource, type) { result in
                continuation.resume(with: result)
            }
        }
    }

    func load<T>(_ resource: APIResource,
                 parse: @escaping ((AnyObject, Data) -> T?)) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            self.load(resource, parse: parse) { result in
                continuation.resume(with: result)
            }
        }
    }

    func upload<T: Decodable>(_ resource: APIResource,
                              _ type: T.Type,
                              onProgress: @escaping ProgressHandler) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            self.upload(resource, type, onProgress: onProgress) { result in
                continuation.resume(with: result)
            }
        }
    }

}
