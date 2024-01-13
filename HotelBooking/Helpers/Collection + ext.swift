//
//  Collection + ext.swift
//  HotelBooking
//
//  Created by Polina on 05.01.2024.
//

import SwiftUI
import Combine

extension Collection where Element: Publisher {
    func combineLatest() -> AnyPublisher<[Element.Output], Element.Failure> {
        var wrapped = map { $0.map { [$0] }.eraseToAnyPublisher() }
        while wrapped.count > ConstHelpers.combineNumber {
            wrapped = makeCombinedChunks(input: wrapped)
        }
        return wrapped.first?.eraseToAnyPublisher() ?? Empty().eraseToAnyPublisher()
    }
}

private func makeCombinedChunks<Output, Failure: Swift.Error>(
    input: [AnyPublisher<[Output], Failure>]
) -> [AnyPublisher<[Output], Failure>] {
    sequence(
        state: input.makeIterator(),
        next: { it in it.next().map { ($0, it.next(), it.next(), it.next()) } }
    )
    .map { chunk in
        guard let second = chunk.1 else { return chunk.0 }
        
        guard let third = chunk.2 else {
            return chunk.0
                .combineLatest(second)
                .map { $0.0 + $0.1 }
                .eraseToAnyPublisher()
        }
        
        guard let fourth = chunk.3 else {
            return chunk.0
                .combineLatest(second, third)
                .map { $0.0 + $0.1 + $0.2 }
                .eraseToAnyPublisher()
        }
        
        return chunk.0
            .combineLatest(second, third, fourth)
            .map { $0.0 + $0.1 + $0.2 + $0.3 }
            .eraseToAnyPublisher()
    }
}

extension Collection {
    func every(n: Int) -> UnfoldSequence<Element,Index> {
          sequence(state: startIndex) { index in
              guard index < endIndex else { return nil }
              defer { let _ = formIndex(&index, offsetBy: n, limitedBy: endIndex) }
              return self[index]
          }
      }
}
