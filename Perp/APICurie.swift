// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetFundingUpdateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFundingUpdate($baseToken: Bytes) {
      fundingUpdateds(
        first: 1
        where: {baseToken: $baseToken}
        orderBy: blockNumberLogIndex
        orderDirection: desc
      ) {
        __typename
        id
        baseToken
        markTwap
        indexTwap
        dailyFundingRate
        txHash
      }
    }
    """

  public let operationName: String = "GetFundingUpdate"

  public var baseToken: String?

  public init(baseToken: String? = nil) {
    self.baseToken = baseToken
  }

  public var variables: GraphQLMap? {
    return ["baseToken": baseToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("fundingUpdateds", arguments: ["first": 1, "where": ["baseToken": GraphQLVariable("baseToken")], "orderBy": "blockNumberLogIndex", "orderDirection": "desc"], type: .nonNull(.list(.nonNull(.object(FundingUpdated.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(fundingUpdateds: [FundingUpdated]) {
      self.init(unsafeResultMap: ["__typename": "Query", "fundingUpdateds": fundingUpdateds.map { (value: FundingUpdated) -> ResultMap in value.resultMap }])
    }

    public var fundingUpdateds: [FundingUpdated] {
      get {
        return (resultMap["fundingUpdateds"] as! [ResultMap]).map { (value: ResultMap) -> FundingUpdated in FundingUpdated(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FundingUpdated) -> ResultMap in value.resultMap }, forKey: "fundingUpdateds")
      }
    }

    public struct FundingUpdated: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FundingUpdated"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("baseToken", type: .nonNull(.scalar(String.self))),
          GraphQLField("markTwap", type: .nonNull(.scalar(String.self))),
          GraphQLField("indexTwap", type: .nonNull(.scalar(String.self))),
          GraphQLField("dailyFundingRate", type: .nonNull(.scalar(String.self))),
          GraphQLField("txHash", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, baseToken: String, markTwap: String, indexTwap: String, dailyFundingRate: String, txHash: String) {
        self.init(unsafeResultMap: ["__typename": "FundingUpdated", "id": id, "baseToken": baseToken, "markTwap": markTwap, "indexTwap": indexTwap, "dailyFundingRate": dailyFundingRate, "txHash": txHash])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// format: <tx hash>-<tx log index>
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      /// mark price twap
      public var markTwap: String {
        get {
          return resultMap["markTwap"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "markTwap")
        }
      }

      /// index price twap
      public var indexTwap: String {
        get {
          return resultMap["indexTwap"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "indexTwap")
        }
      }

      /// daily funding rate
      public var dailyFundingRate: String {
        get {
          return resultMap["dailyFundingRate"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dailyFundingRate")
        }
      }

      /// transaction hash
      public var txHash: String {
        get {
          return resultMap["txHash"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "txHash")
        }
      }
    }
  }
}

public final class GetPositionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetPosition($address: ID!, $baseToken: Bytes) {
      trader(id: $address) {
        __typename
        collateral
        badDebt
        totalPnl
        blockNumber
        timestamp
        positions(where: {baseToken: $baseToken}) {
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

  public let operationName: String = "GetPosition"

  public var address: GraphQLID
  public var baseToken: String?

  public init(address: GraphQLID, baseToken: String? = nil) {
    self.address = address
    self.baseToken = baseToken
  }

  public var variables: GraphQLMap? {
    return ["address": address, "baseToken": baseToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("trader", arguments: ["id": GraphQLVariable("address")], type: .object(Trader.selections)),
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
          GraphQLField("collateral", type: .nonNull(.scalar(String.self))),
          GraphQLField("badDebt", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalPnl", type: .nonNull(.scalar(String.self))),
          GraphQLField("blockNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("positions", arguments: ["where": ["baseToken": GraphQLVariable("baseToken")]], type: .nonNull(.list(.nonNull(.object(Position.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(collateral: String, badDebt: String, totalPnl: String, blockNumber: String, timestamp: String, positions: [Position]) {
        self.init(unsafeResultMap: ["__typename": "Trader", "collateral": collateral, "badDebt": badDebt, "totalPnl": totalPnl, "blockNumber": blockNumber, "timestamp": timestamp, "positions": positions.map { (value: Position) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// total deposited collateral + cumulative total pnl
      public var collateral: String {
        get {
          return resultMap["collateral"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "collateral")
        }
      }

      /// cumulative bad debt
      public var badDebt: String {
        get {
          return resultMap["badDebt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "badDebt")
        }
      }

      /// cumulative total pnl = realizedPnl (fee included) - fundingPayment - liquidationFee + makerFee
      public var totalPnl: String {
        get {
          return resultMap["totalPnl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPnl")
        }
      }

      /// last updated block number
      public var blockNumber: String {
        get {
          return resultMap["blockNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "blockNumber")
        }
      }

      /// last updated block timestamp
      public var timestamp: String {
        get {
          return resultMap["timestamp"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "timestamp")
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

public final class GetTraderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetTrader($address: ID!) {
      trader(id: $address) {
        __typename
        collateral
        tradingVolume
        realizedPnl
        fundingPayment
        tradingFee
        liquidationFee
        makerFee
        badDebt
        totalPnl
        blockNumber
        timestamp
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
        dayData {
          __typename
          id
          tradingVolume
          fee
          realizedPnl
        }
      }
    }
    """

  public let operationName: String = "GetTrader"

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
        GraphQLField("trader", arguments: ["id": GraphQLVariable("address")], type: .object(Trader.selections)),
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
          GraphQLField("collateral", type: .nonNull(.scalar(String.self))),
          GraphQLField("tradingVolume", type: .nonNull(.scalar(String.self))),
          GraphQLField("realizedPnl", type: .nonNull(.scalar(String.self))),
          GraphQLField("fundingPayment", type: .nonNull(.scalar(String.self))),
          GraphQLField("tradingFee", type: .nonNull(.scalar(String.self))),
          GraphQLField("liquidationFee", type: .nonNull(.scalar(String.self))),
          GraphQLField("makerFee", type: .nonNull(.scalar(String.self))),
          GraphQLField("badDebt", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalPnl", type: .nonNull(.scalar(String.self))),
          GraphQLField("blockNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
          GraphQLField("positions", type: .nonNull(.list(.nonNull(.object(Position.selections))))),
          GraphQLField("dayData", type: .list(.nonNull(.object(DayDatum.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(collateral: String, tradingVolume: String, realizedPnl: String, fundingPayment: String, tradingFee: String, liquidationFee: String, makerFee: String, badDebt: String, totalPnl: String, blockNumber: String, timestamp: String, positions: [Position], dayData: [DayDatum]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Trader", "collateral": collateral, "tradingVolume": tradingVolume, "realizedPnl": realizedPnl, "fundingPayment": fundingPayment, "tradingFee": tradingFee, "liquidationFee": liquidationFee, "makerFee": makerFee, "badDebt": badDebt, "totalPnl": totalPnl, "blockNumber": blockNumber, "timestamp": timestamp, "positions": positions.map { (value: Position) -> ResultMap in value.resultMap }, "dayData": dayData.flatMap { (value: [DayDatum]) -> [ResultMap] in value.map { (value: DayDatum) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// total deposited collateral + cumulative total pnl
      public var collateral: String {
        get {
          return resultMap["collateral"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "collateral")
        }
      }

      /// cumulative trading volume
      public var tradingVolume: String {
        get {
          return resultMap["tradingVolume"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "tradingVolume")
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

      /// cumulative maker fee
      public var makerFee: String {
        get {
          return resultMap["makerFee"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "makerFee")
        }
      }

      /// cumulative bad debt
      public var badDebt: String {
        get {
          return resultMap["badDebt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "badDebt")
        }
      }

      /// cumulative total pnl = realizedPnl (fee included) - fundingPayment - liquidationFee + makerFee
      public var totalPnl: String {
        get {
          return resultMap["totalPnl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPnl")
        }
      }

      /// last updated block number
      public var blockNumber: String {
        get {
          return resultMap["blockNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "blockNumber")
        }
      }

      /// last updated block timestamp
      public var timestamp: String {
        get {
          return resultMap["timestamp"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "timestamp")
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

      public var dayData: [DayDatum]? {
        get {
          return (resultMap["dayData"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [DayDatum] in value.map { (value: ResultMap) -> DayDatum in DayDatum(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [DayDatum]) -> [ResultMap] in value.map { (value: DayDatum) -> ResultMap in value.resultMap } }, forKey: "dayData")
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

      public struct DayDatum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TraderDayData"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("tradingVolume", type: .nonNull(.scalar(String.self))),
            GraphQLField("fee", type: .nonNull(.scalar(String.self))),
            GraphQLField("realizedPnl", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, tradingVolume: String, fee: String, realizedPnl: String) {
          self.init(unsafeResultMap: ["__typename": "TraderDayData", "id": id, "tradingVolume": tradingVolume, "fee": fee, "realizedPnl": realizedPnl])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// format: <trader id>-<day id>
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// trading volume aggregated per day for trader
        public var tradingVolume: String {
          get {
            return resultMap["tradingVolume"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "tradingVolume")
          }
        }

        /// trading fee aggregated per day for trader
        public var fee: String {
          get {
            return resultMap["fee"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fee")
          }
        }

        /// total pnl aggregated per day for trader
        public var realizedPnl: String {
          get {
            return resultMap["realizedPnl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "realizedPnl")
          }
        }
      }
    }
  }
}
