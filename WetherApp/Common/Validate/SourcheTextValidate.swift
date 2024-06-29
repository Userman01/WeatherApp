//
//  SourcheTextValidate.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import Foundation

struct SeurcheTextValidate: ValidatorProtocol {
    func validated(_ value: String) throws -> String {
        if let errorText = getErrorText(value) {
            throw ValidationError(errorText)
        }
        return value
    }
    
    private func getErrorText(_ value: String) -> String? {
        return value
    }
}
