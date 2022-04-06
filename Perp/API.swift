// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetPositionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getPositions($traderAddress: ID!) {
      trader(id: $traderAddress) {
        __typename
        positions {
          __typename
          baseToken
          positionSize
          openNotional
          entryPrice
          realizedPnl
          fundingPayment
          tradingFee
          liquidationFee
        }
      }
    }
    """

  public let operationName: String = "getPositions"

  public var traderAddress: GraphQLID

  public init(traderAddress: GraphQLID) {
    self.traderAddress = traderAddress
  }

  public var variables: GraphQLMap? {
    return ["traderAddress": traderAddress]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("trader", arguments: ["id": GraphQLVariable("traderAddress")], type: .object(Trader.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(trader: Trader? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "trader": trader.flatMap { (value: Trader) -> ResultMap in value.resultMap }])
    }

    public var trader: Trader? {
      get {
        return (resultMap["trader"] as? ResultMap).flatMap { Trader(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "trader")
      }
    }

    public struct Trader: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Trader"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("positions", type: .nonNull(.list(.nonNull(.object(Position.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(positions: [Position]) {
        self.init(unsafeResultMap: ["__typename": "Trader", "positions": positions.map { (value: Position) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// positions
      public var positions: [Position] {
        get {
          return (resultMap["positions"] as! [ResultMap]).map { (value: ResultMap) -> Position in Position(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Position) -> ResultMap in value.resultMap }, forKey: "positions")
        }
      }

      public struct Position: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Position"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("baseToken", type: .nonNull(.scalar(String.self))),
            GraphQLField("positionSize", type: .nonNull(.scalar(String.self))),
            GraphQLField("openNotional", type: .nonNull(.scalar(String.self))),
            GraphQLField("entryPrice", type: .nonNull(.scalar(String.self))),
            GraphQLField("realizedPnl", type: .nonNull(.scalar(String.self))),
            GraphQLField("fundingPayment", type: .nonNull(.scalar(String.self))),
            GraphQLField("tradingFee", type: .nonNull(.scalar(String.self))),
            GraphQLField("liquidationFee", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(baseToken: String, positionSize: String, openNotional: String, entryPrice: String, realizedPnl: String, fundingPayment: String, tradingFee: String, liquidationFee: String) {
          self.init(unsafeResultMap: ["__typename": "Position", "baseToken": baseToken, "positionSize": positionSize, "openNotional": openNotional, "entryPrice": entryPrice, "realizedPnl": realizedPnl, "fundingPayment": fundingPayment, "tradingFee": tradingFee, "liquidationFee": liquidationFee])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// baseToken address
        public var baseToken: String {
          get {
            return resultMap["baseToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "baseToken")
          }
        }

        /// current position size
        public var positionSize: String {
          get {
            return resultMap["positionSize"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "positionSize")
          }
        }

        /// average open notional of the current position
        public var openNotional: String {
          get {
            return resultMap["openNotional"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "openNotional")
          }
        }

        /// average entry price of the current position = abs(openNotional / positionSize)
        public var entryPrice: String {
          get {
            return resultMap["entryPrice"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "entryPrice")
          }
        }

        /// cumulative realize pnl
        public var realizedPnl: String {
          get {
            return resultMap["realizedPnl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "realizedPnl")
          }
        }

        /// cumulative funding payment: - is received and + is sent
        public var fundingPayment: String {
          get {
            return resultMap["fundingPayment"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fundingPayment")
          }
        }

        /// cumulative trading fee
        public var tradingFee: String {
          get {
            return resultMap["tradingFee"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "tradingFee")
          }
        }

        /// cumulative liquidation fee
        public var liquidationFee: String {
          get {
            return resultMap["liquidationFee"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "liquidationFee")
          }
        }
      }
    }
  }
}
