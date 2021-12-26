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

public final class GetPositionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetPosition($address: ID!) {
      position(id: $address) {
        __typename
        id
        trader
        margin
        openNotional
        tradingVolume
        leverage
        realizedPnl
        unrealizedPnl
        fundingPayment
        fee
        badDebt
        liquidationPenalty
        totalPnlAmount
        blockNumber
        timestamp
        ammPositions {
          __typename
          amm
          margin
          openNotional
          tradingVolume
          leverage
          entryPrice
          realizedPnl
          unrealizedPnl
          fundingPayment
          fee
          badDebt
          liquidationPenalty
          totalPnlAmount
          blockNumber
          timestamp
        }
      }
    }
    """

  public let operationName: String = "GetPosition"

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
        GraphQLField("position", arguments: ["id": GraphQLVariable("address")], type: .object(Position.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(position: Position? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "position": position.flatMap { (value: Position) -> ResultMap in value.resultMap }])
    }

    public var position: Position? {
      get {
        return (resultMap["position"] as? ResultMap).flatMap { Position(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "position")
      }
    }

    public struct Position: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Position"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("trader", type: .nonNull(.scalar(String.self))),
          GraphQLField("margin", type: .nonNull(.scalar(String.self))),
          GraphQLField("openNotional", type: .nonNull(.scalar(String.self))),
          GraphQLField("tradingVolume", type: .nonNull(.scalar(String.self))),
          GraphQLField("leverage", type: .nonNull(.scalar(String.self))),
          GraphQLField("realizedPnl", type: .nonNull(.scalar(String.self))),
          GraphQLField("unrealizedPnl", type: .nonNull(.scalar(String.self))),
          GraphQLField("fundingPayment", type: .nonNull(.scalar(String.self))),
          GraphQLField("fee", type: .nonNull(.scalar(String.self))),
          GraphQLField("badDebt", type: .nonNull(.scalar(String.self))),
          GraphQLField("liquidationPenalty", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalPnlAmount", type: .nonNull(.scalar(String.self))),
          GraphQLField("blockNumber", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .scalar(String.self)),
          GraphQLField("ammPositions", type: .nonNull(.list(.nonNull(.object(AmmPosition.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, trader: String, margin: String, openNotional: String, tradingVolume: String, leverage: String, realizedPnl: String, unrealizedPnl: String, fundingPayment: String, fee: String, badDebt: String, liquidationPenalty: String, totalPnlAmount: String, blockNumber: String? = nil, timestamp: String? = nil, ammPositions: [AmmPosition]) {
        self.init(unsafeResultMap: ["__typename": "Position", "id": id, "trader": trader, "margin": margin, "openNotional": openNotional, "tradingVolume": tradingVolume, "leverage": leverage, "realizedPnl": realizedPnl, "unrealizedPnl": unrealizedPnl, "fundingPayment": fundingPayment, "fee": fee, "badDebt": badDebt, "liquidationPenalty": liquidationPenalty, "totalPnlAmount": totalPnlAmount, "blockNumber": blockNumber, "timestamp": timestamp, "ammPositions": ammPositions.map { (value: AmmPosition) -> ResultMap in value.resultMap }])
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

      public var trader: String {
        get {
          return resultMap["trader"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "trader")
        }
      }

      public var margin: String {
        get {
          return resultMap["margin"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "margin")
        }
      }

      public var openNotional: String {
        get {
          return resultMap["openNotional"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "openNotional")
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

      public var leverage: String {
        get {
          return resultMap["leverage"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "leverage")
        }
      }

      public var realizedPnl: String {
        get {
          return resultMap["realizedPnl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "realizedPnl")
        }
      }

      public var unrealizedPnl: String {
        get {
          return resultMap["unrealizedPnl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "unrealizedPnl")
        }
      }

      public var fundingPayment: String {
        get {
          return resultMap["fundingPayment"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fundingPayment")
        }
      }

      public var fee: String {
        get {
          return resultMap["fee"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fee")
        }
      }

      public var badDebt: String {
        get {
          return resultMap["badDebt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "badDebt")
        }
      }

      public var liquidationPenalty: String {
        get {
          return resultMap["liquidationPenalty"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "liquidationPenalty")
        }
      }

      public var totalPnlAmount: String {
        get {
          return resultMap["totalPnlAmount"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPnlAmount")
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

      public var ammPositions: [AmmPosition] {
        get {
          return (resultMap["ammPositions"] as! [ResultMap]).map { (value: ResultMap) -> AmmPosition in AmmPosition(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: AmmPosition) -> ResultMap in value.resultMap }, forKey: "ammPositions")
        }
      }

      public struct AmmPosition: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AmmPosition"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amm", type: .nonNull(.scalar(String.self))),
            GraphQLField("margin", type: .nonNull(.scalar(String.self))),
            GraphQLField("openNotional", type: .nonNull(.scalar(String.self))),
            GraphQLField("tradingVolume", type: .nonNull(.scalar(String.self))),
            GraphQLField("leverage", type: .nonNull(.scalar(String.self))),
            GraphQLField("entryPrice", type: .nonNull(.scalar(String.self))),
            GraphQLField("realizedPnl", type: .nonNull(.scalar(String.self))),
            GraphQLField("unrealizedPnl", type: .nonNull(.scalar(String.self))),
            GraphQLField("fundingPayment", type: .nonNull(.scalar(String.self))),
            GraphQLField("fee", type: .nonNull(.scalar(String.self))),
            GraphQLField("badDebt", type: .nonNull(.scalar(String.self))),
            GraphQLField("liquidationPenalty", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalPnlAmount", type: .nonNull(.scalar(String.self))),
            GraphQLField("blockNumber", type: .scalar(String.self)),
            GraphQLField("timestamp", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amm: String, margin: String, openNotional: String, tradingVolume: String, leverage: String, entryPrice: String, realizedPnl: String, unrealizedPnl: String, fundingPayment: String, fee: String, badDebt: String, liquidationPenalty: String, totalPnlAmount: String, blockNumber: String? = nil, timestamp: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AmmPosition", "amm": amm, "margin": margin, "openNotional": openNotional, "tradingVolume": tradingVolume, "leverage": leverage, "entryPrice": entryPrice, "realizedPnl": realizedPnl, "unrealizedPnl": unrealizedPnl, "fundingPayment": fundingPayment, "fee": fee, "badDebt": badDebt, "liquidationPenalty": liquidationPenalty, "totalPnlAmount": totalPnlAmount, "blockNumber": blockNumber, "timestamp": timestamp])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var amm: String {
          get {
            return resultMap["amm"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "amm")
          }
        }

        public var margin: String {
          get {
            return resultMap["margin"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "margin")
          }
        }

        public var openNotional: String {
          get {
            return resultMap["openNotional"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "openNotional")
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

        public var leverage: String {
          get {
            return resultMap["leverage"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "leverage")
          }
        }

        public var entryPrice: String {
          get {
            return resultMap["entryPrice"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "entryPrice")
          }
        }

        public var realizedPnl: String {
          get {
            return resultMap["realizedPnl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "realizedPnl")
          }
        }

        public var unrealizedPnl: String {
          get {
            return resultMap["unrealizedPnl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unrealizedPnl")
          }
        }

        public var fundingPayment: String {
          get {
            return resultMap["fundingPayment"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fundingPayment")
          }
        }

        public var fee: String {
          get {
            return resultMap["fee"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fee")
          }
        }

        public var badDebt: String {
          get {
            return resultMap["badDebt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "badDebt")
          }
        }

        public var liquidationPenalty: String {
          get {
            return resultMap["liquidationPenalty"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "liquidationPenalty")
          }
        }

        public var totalPnlAmount: String {
          get {
            return resultMap["totalPnlAmount"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPnlAmount")
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
}
