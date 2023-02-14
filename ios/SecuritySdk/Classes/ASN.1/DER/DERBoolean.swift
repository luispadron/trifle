//
//  DERBoolean.swift
//  SecuritySdk
//

import Foundation

/// Boolean DER (Distingushed Encoding Rules) encodable
public struct DERBoolean: ASN1Type, DEREncodable {
    public typealias T = Bool

    // MARK: - Public Properties

    public let tag: Octet
    public let octets: [Octet]
    
    // MARK: - Initialization
    
    public init(_ rawValue: Bool, _ type: Type = Type.none) throws {
        self.octets = try Self.encode(rawValue, .boolean(type))
        self.tag = octets.first!
    }
    
    internal static func encodeValue(_ rawValue: Bool) -> [Octet] {
        if (rawValue) {
            return [0xff]
        }
        return [0x00]
    }
}
