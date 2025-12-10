import Testing
import Algorithms

@testable import CrossProduct

extension String: Crossable {}

struct CrossProductTests {
	
	//
	//	MARK: - Alphabets
	//
	@Test func crossABCs() {
		
		let cp = CrossProduct([A()], [B(x:0), B(x:1)], [C.left])
		print("cp.type: \(type(of: cp)) -> \(cp)")
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
	@Test func filterABCs() {
		
		let cp = CrossProduct([A()], [B(x:0), B(x:1)], [C.left])
		print("cp.type: \(type(of: cp)) -> \(cp)")
		
		cp.map {
			
			$0.filter { 
				
				return switch $0 {
				case is B:	true
				case is C:	true
				default: 	false
				}
				
			}
			
		}.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
	
	//
	//	MARK: - Strings
	//
	@Test func crossZeroString() {
		
		let cp = CrossProduct([] as [String])
		print("cp.type: \(type(of: cp)) -> \(cp)")
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
	@Test func crossZeroThenCross() {
		
		var cp = CrossProduct([] as [String])
		print("cp.type: \(type(of: cp)) -> \(cp)")
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
		cp.cross( ["alpha"] )
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
	@Test func crossOneStringa() {
		
		let cp = CrossProduct(["alpha"])
		print("cp.type: \(type(of: cp)) -> \(cp)")
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
	@Test func crossStringa() {
		
		var cp = CrossProduct(
			["alpha"],
			["beta", "gamma"],
			["delta"],
		)
		print("cp.type: \(type(of: cp)) -> \(cp)")
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
		cp.cross( ["true", "false"] )
		cp.forEach { print("\t\(type(of: $0)) -> \($0)") }
		
	}
	
	@Test func algoCrossProduct() {
		
		let a = ["alpha", "beta", "gamma"]
		let b = ["delta", "epsilon", "zeta"]
		
		let x = product(a, b)
		let (m,n) = x[x.startIndex]
		print(m, n)
		
		let c = ["eta", "theta"]
		
		let y = product(c,x)
		let (p,(q,r)) = y[y.startIndex]
		print(p,q,r)
		
		print()
		y.forEach{ print($0) }
		
	}
}
