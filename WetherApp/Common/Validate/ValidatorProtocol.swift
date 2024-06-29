//
//  ValidatorProtocol.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

protocol ValidatorProtocol {
    func validated(_ value: String) throws -> String
    func isValid(_ value: String) -> Bool
}

extension ValidatorProtocol {

    func isValid(_ value: String) -> Bool {
        do {
            _ = try validated(value)
        } catch {
            return false
        }
        return true
    }
}
