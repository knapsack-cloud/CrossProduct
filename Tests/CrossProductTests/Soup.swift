//
//  Soup.swift
//  CrossProduct
//
//  Created by Bil Moorhead on 12/10/25.
//
import Foundation
import Testing
@testable import CrossProduct

struct Soup{
	
	let a: A
	let b: B
	let c: C
	
}

extension Soup: CrossConsummable {
	
	init(_ crossables: [any Crossable]) {

		self.a = A(crossables[0], default: A())
		self.b = B(crossables[1], default: B(x: -1))
		self.c = C(crossables[2], default: .center)
		
	}
	
}
extension Soup {
	
	var exampleSoups: [Soup] {
		
		Soup.crossProduct(
			[A()],
			[B(x: 0), B(x: 1), B(x: 4)],
			[.up, .down] as [C]
		)
		
	}
	
}

//
//	MARK: - Alternative init
//

extension Soup {
	
	init(unorderd crossables: [any Crossable]) {
		
		self.a = crossables.first{ $0 is A } as! A
		self.b = crossables.first{ $0 is B } as! B
		self.c = crossables.first{ $0 is C } as! C
		
	}
	
}

//
// MARK: - Tests
//


struct SoupTests {
	
	@Test func crossSoups() {
		
		let soups = Soup.crossProduct(
			[A()],
			[B(x:0), B(x:1)],
			[.up, .down] as [C]
		)
		
		soups.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
}

