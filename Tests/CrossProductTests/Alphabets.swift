//
//  File.swift
//  ParameterPack
//
//  Created by Bil Moorhead on 12/9/25.
//

import Foundation
import Testing
@testable import CrossProduct

//
//	MARK: - Lettered types
//
struct A: Crossable {}
struct B: Crossable { let x: Int }
enum   C: Crossable, CaseIterable { case up, down, left, right, front, back, center }

//
//	MARK: - Soup
//
struct Soup {
	
	let a: A
	let b: B
	let c: C
	
}

extension Soup: CrossConsummable {
	
	init(_ crossables: [any Crossable]) {
		
		self.a = crossables[0] as? A ?? A()
		self.b = crossables[1] as? B ?? B(x: -1)
		self.c = crossables[2] as? C ?? .center
		
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
