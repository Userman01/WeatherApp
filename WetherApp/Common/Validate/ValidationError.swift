//
//  ValidationError.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

final class ValidationError: Error {

    let message: String

    init(_ message: String = "") {
        self.message = message
    }
}
