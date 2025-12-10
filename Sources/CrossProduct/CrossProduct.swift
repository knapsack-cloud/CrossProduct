//
//  CrossProduct.swift
//  ParameterPack
//
//  Created by Bil Moorhead on 12/8/25.
//

import Foundation
import Algorithms

//
//	MARK: - Crossable
//
public protocol Crossable {}


//
//	MARK: - CrossConsummable
//
public protocol CrossConsummable {
	
	@inlinable init(_ crossables: [any Crossable])
	
}
extension CrossConsummable {
	
	public static func crossProduct<FC: Crossable, each C:Crossable>(_ firstCrossable: [FC], _ crossables: repeat [each C]) ->[Self] {
		
		CrossProduct(firstCrossable, repeat each crossables).map(Self.init)
		
	}
	
}

//
//	MARK: - CrossProduct
//
public struct CrossProduct {
	
	@usableFromInline internal  var crossProduct: [[any Crossable]]
	
	@inlinable public init<FE, each E>(_ firstElement: [FE], _ crossables: repeat [each E]) where FE: Crossable, repeat each E: Crossable {
		
		self.crossProduct = firstElement.map { [$0] }
		repeat cross(each crossables)
		
	}
	
	@inlinable public mutating func cross<each E>(_ crossables: repeat [each E]) where repeat each E: Crossable {
		
		for crossable in repeat each crossables {
			
			crossProduct = Algorithms.product(crossProduct, crossable).map { [$0, [$1]].flatMap(\.self) }
			
		}
		
	}
	
}

extension CrossProduct: Collection {
	
	@inlinable public var startIndex: Int { crossProduct.startIndex }
	@inlinable public var endIndex: Int { crossProduct.endIndex }
	@inlinable public subscript(position: Int) -> [any Crossable] { crossProduct[position] }
	@inlinable public func index(after i: Int) -> Int { crossProduct.index(after: i) }
	
}

extension Crossable {
	
	public init?(_ crossable: some Crossable) {
		
		guard let yourself = crossable as? Self else { return nil }
		self = yourself
		
	}

	public init(_ crossable: some Crossable, default: Self) {
		
		self = (crossable as? Self) ?? `default`
		
	}
	
}
