//
//  Extensions.swift
//  MyMVVMAppTests
//
//  Created by Willy Kim on 01/07/2021.
//

import XCTest

extension URL {
    var urlWithoutParameters: String? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.query = nil
        return components.string
    }
}

extension XCTestCase {
    func loadStub(named fileName: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: fileName, withExtension: "json")
        return try! Data(contentsOf: url!)
    }
}


