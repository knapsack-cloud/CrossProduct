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


