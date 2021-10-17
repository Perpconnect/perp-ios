// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAmmQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAmm($address: ID!) {
      amm(id: $address) {
        __typename
        id
        positionBalance
        openInterestSize
        openInterestNotional
        quoteAssetReserve
        baseAssetReserve
        tradingVolume
        blockNumber
        timestamp
      }
    }
    """

  public let operationName: String = "GetAmm"

  public var address: GraphQLID

  public init(address: GraphQLID) {
    self.address = address
  }

  public var variables: GraphQLMap? {
    return ["address": address]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("amm", arguments: ["id": GraphQLVariable("address")], type: .object(Amm.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(amm: Amm? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "amm": amm.flatMap { (value: Amm) -> ResultMap in value.resultMap }])
    }

    public var amm: Amm? {
      get {
        return (resultMap["amm"] as? ResultMap).flatMap { Amm(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "amm")
      }
    }

    public struct Amm: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Amm"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("positionBalance", type: .nonNull(.scalar(String.self))),
          GraphQLField("openInterestSize", type: .nonNull(.scalar(String.self))),
          GraphQLField("openInterestNotional", type: .nonNull(.scalar(String.self))),
          GraphQLField("quoteAssetReserve", type: .nonNull(.scalar(String.self))),
          GraphQLField("baseAssetReserve", type: .nonNull(.scalar(String.self))),
          GraphQLField("tradingVolume", type: .nonNull(.scalar(String.self))),
          GraphQLField("blockNumber", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, positionBalance: String, openInterestSize: String, openInterestNotional: String, quoteAssetReserve: String, baseAssetReserve: String, tradingVolume: String, blockNumber: String? = nil, timestamp: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Amm", "id": id, "positionBalance": positionBalance, "openInterestSize": openInterestSize, "openInterestNotional": openInterestNotional, "quoteAssetReserve": quoteAssetReserve, "baseAssetReserve": baseAssetReserve, "tradingVolume": tradingVolume, "blockNumber": blockNumber, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var positionBalance: String {
        get {
          return resultMap["positionBalance"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "positionBalance")
        }
      }

      public var openInterestSize: String {
        get {
          return resultMap["openInterestSize"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "openInterestSize")
        }
      }

      public var openInterestNotional: String {
        get {
          return resultMap["openInterestNotional"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "openInterestNotional")
        }
      }

      public var quoteAssetReserve: String {
        get {
          return resultMap["quoteAssetReserve"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "quoteAssetReserve")
        }
      }

      public var baseAssetReserve: String {
        get {
          return resultMap["baseAssetReserve"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "baseAssetReserve")
        }
      }

      public var tradingVolume: String {
        get {
          return resultMap["tradingVolume"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "tradingVolume")
        }
      }

      public var blockNumber: String? {
        get {
          return resultMap["blockNumber"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "blockNumber")
        }
      }

      public var timestamp: String? {
        get {
          return resultMap["timestamp"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}
