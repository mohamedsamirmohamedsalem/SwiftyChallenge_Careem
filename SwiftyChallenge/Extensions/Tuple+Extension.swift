//
//  Tuple+Extension.swift
//  SwiftyChallenge
//
//  Created by Mohamed Samir on 20/02/2024.
//  Copyright © 2024 Monish Syed . All rights reserved.
//


/// A workaround for not being able to extend tuples.
public struct Tuple<Elements> {
  public var elements: Elements

  public init(_ elements: Elements) {
    self.elements = elements
  }
}

public extension Tuple {
  // MARK: - 2-tuple

  /// Create a new tuple with one more element.
  static subscript<Element0, Element1, Element2>(
    tuple: Elements, element: Element2
  ) -> (Element0, Element1, Element2)
  where Elements == (Element0, Element1) {
    (tuple.0, tuple.1, element)
  }

  // MARK: - 3-tuple

  /// Create a new tuple with one more element.
  static subscript<Element0, Element1, Element2, Element3>(
    tuple: Elements, element: Element3
  ) -> (Element0, Element1, Element2, Element3)
  where Elements == (Element0, Element1, Element2) {
    (tuple.0, tuple.1, tuple.2, element)
  }
}

public extension Sequence {
  typealias Tuple2 = (Element, Element)
  typealias Tuple3 = (Element, Element, Element)
  typealias Tuple4 = (Element, Element, Element, Element)

  var tuple2: Tuple2? { makeTuple2()?.tuple }
  var tuple3: Tuple3? { makeTuple3()?.tuple }
  var tuple4: Tuple4? { makeTuple4()?.tuple }


  private func makeTuple2() -> (
    tuple: Tuple2,
    getNext: () -> Element?
  )? {
    var iterator = makeIterator()
    let getNext = { iterator.next() }

    guard
      let _0 = getNext(),
      let _1 = getNext()
    else { return nil }

    return ((_0, _1), getNext)
  }

  private func makeTuple3() -> (
    tuple: Tuple3,
    getNext: () -> Element?
  )? {
    guard
      let (tuple, getNext) = makeTuple2(),
      let element = getNext()
    else { return nil }

    return (Tuple[tuple, element], getNext)
  }

  private func makeTuple4() -> (
    tuple: Tuple4,
    getNext: () -> Element?
  )? {
    guard
      let (tuple, getNext) = makeTuple3(),
      let element = getNext()
    else { return nil }

    return (Tuple[tuple, element], getNext)
  }
}

