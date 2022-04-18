// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct TableCandleStickQueryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - marketResolution
  ///   - startTime
  public init(marketResolution: Swift.Optional<TableStringFilterInput?> = nil, startTime: Swift.Optional<TableIntFilterInput?> = nil) {
    graphQLMap = ["marketResolution": marketResolution, "startTime": startTime]
  }

  public var marketResolution: Swift.Optional<TableStringFilterInput?> {
    get {
      return graphQLMap["marketResolution"] as? Swift.Optional<TableStringFilterInput?> ?? Swift.Optional<TableStringFilterInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "marketResolution")
    }
  }

  public var startTime: Swift.Optional<TableIntFilterInput?> {
    get {
      return graphQLMap["startTime"] as? Swift.Optional<TableIntFilterInput?> ?? Swift.Optional<TableIntFilterInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startTime")
    }
  }
}

public struct TableStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - ne
  ///   - eq
  ///   - le
  ///   - lt
  ///   - ge
  ///   - gt
  ///   - contains
  ///   - notContains
  ///   - between
  ///   - beginsWith
  public init(ne: Swift.Optional<String?> = nil, eq: Swift.Optional<String?> = nil, le: Swift.Optional<String?> = nil, lt: Swift.Optional<String?> = nil, ge: Swift.Optional<String?> = nil, gt: Swift.Optional<String?> = nil, contains: Swift.Optional<String?> = nil, notContains: Swift.Optional<String?> = nil, between: Swift.Optional<[String?]?> = nil, beginsWith: Swift.Optional<String?> = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: Swift.Optional<String?> {
    get {
      return graphQLMap["ne"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Swift.Optional<String?> {
    get {
      return graphQLMap["eq"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Swift.Optional<String?> {
    get {
      return graphQLMap["le"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Swift.Optional<String?> {
    get {
      return graphQLMap["lt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Swift.Optional<String?> {
    get {
      return graphQLMap["ge"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Swift.Optional<String?> {
    get {
      return graphQLMap["gt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Swift.Optional<String?> {
    get {
      return graphQLMap["contains"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Swift.Optional<String?> {
    get {
      return graphQLMap["notContains"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: Swift.Optional<[String?]?> {
    get {
      return graphQLMap["between"] as? Swift.Optional<[String?]?> ?? Swift.Optional<[String?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: Swift.Optional<String?> {
    get {
      return graphQLMap["beginsWith"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct TableIntFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - ne
  ///   - eq
  ///   - le
  ///   - lt
  ///   - ge
  ///   - gt
  ///   - contains
  ///   - notContains
  ///   - between
  public init(ne: Swift.Optional<Int?> = nil, eq: Swift.Optional<Int?> = nil, le: Swift.Optional<Int?> = nil, lt: Swift.Optional<Int?> = nil, ge: Swift.Optional<Int?> = nil, gt: Swift.Optional<Int?> = nil, contains: Swift.Optional<Int?> = nil, notContains: Swift.Optional<Int?> = nil, between: Swift.Optional<[Int?]?> = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
  }

  public var ne: Swift.Optional<Int?> {
    get {
      return graphQLMap["ne"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Swift.Optional<Int?> {
    get {
      return graphQLMap["eq"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Swift.Optional<Int?> {
    get {
      return graphQLMap["le"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Swift.Optional<Int?> {
    get {
      return graphQLMap["lt"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Swift.Optional<Int?> {
    get {
      return graphQLMap["ge"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Swift.Optional<Int?> {
    get {
      return graphQLMap["gt"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Swift.Optional<Int?> {
    get {
      return graphQLMap["contains"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Swift.Optional<Int?> {
    get {
      return graphQLMap["notContains"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: Swift.Optional<[Int?]?> {
    get {
      return graphQLMap["between"] as? Swift.Optional<[Int?]?> ?? Swift.Optional<[Int?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class GetStatisticsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetStatistics($ammAddr: String!) {
      getStatistics(ammAddr: $ammAddr) {
        __typename
        priceHigh24h
        priceChangeRate24h
        lastTradePriceUsd
        ammAddr
        volume24h
        priceLow24h
        timestamp
        blockNumber
      }
    }
    """

  public let operationName: String = "GetStatistics"

  public var ammAddr: String

  public init(ammAddr: String) {
    self.ammAddr = ammAddr
  }

  public var variables: GraphQLMap? {
    return ["ammAddr": ammAddr]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getStatistics", arguments: ["ammAddr": GraphQLVariable("ammAddr")], type: .object(GetStatistic.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getStatistics: GetStatistic? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getStatistics": getStatistics.flatMap { (value: GetStatistic) -> ResultMap in value.resultMap }])
    }

    public var getStatistics: GetStatistic? {
      get {
        return (resultMap["getStatistics"] as? ResultMap).flatMap { GetStatistic(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getStatistics")
      }
    }

    public struct GetStatistic: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Statistics"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("priceHigh24h", type: .scalar(String.self)),
          GraphQLField("priceChangeRate24h", type: .scalar(String.self)),
          GraphQLField("lastTradePriceUsd", type: .scalar(String.self)),
          GraphQLField("ammAddr", type: .nonNull(.scalar(String.self))),
          GraphQLField("volume24h", type: .scalar(String.self)),
          GraphQLField("priceLow24h", type: .scalar(String.self)),
          GraphQLField("timestamp", type: .nonNull(.scalar(Int.self))),
          GraphQLField("blockNumber", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(priceHigh24h: String? = nil, priceChangeRate24h: String? = nil, lastTradePriceUsd: String? = nil, ammAddr: String, volume24h: String? = nil, priceLow24h: String? = nil, timestamp: Int, blockNumber: Int) {
        self.init(unsafeResultMap: ["__typename": "Statistics", "priceHigh24h": priceHigh24h, "priceChangeRate24h": priceChangeRate24h, "lastTradePriceUsd": lastTradePriceUsd, "ammAddr": ammAddr, "volume24h": volume24h, "priceLow24h": priceLow24h, "timestamp": timestamp, "blockNumber": blockNumber])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var priceHigh24h: String? {
        get {
          return resultMap["priceHigh24h"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "priceHigh24h")
        }
      }

      public var priceChangeRate24h: String? {
        get {
          return resultMap["priceChangeRate24h"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "priceChangeRate24h")
        }
      }

      public var lastTradePriceUsd: String? {
        get {
          return resultMap["lastTradePriceUsd"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastTradePriceUsd")
        }
      }

      public var ammAddr: String {
        get {
          return resultMap["ammAddr"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ammAddr")
        }
      }

      public var volume24h: String? {
        get {
          return resultMap["volume24h"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "volume24h")
        }
      }

      public var priceLow24h: String? {
        get {
          return resultMap["priceLow24h"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "priceLow24h")
        }
      }

      public var timestamp: Int {
        get {
          return resultMap["timestamp"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "timestamp")
        }
      }

      public var blockNumber: Int {
        get {
          return resultMap["blockNumber"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "blockNumber")
        }
      }
    }
  }
}

public final class ListCancleSticksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListCancleSticks($query: TableCandleStickQueryInput!, $limit: Int!) {
      listCandleSticks(query: $query, limit: $limit) {
        __typename
        items {
          __typename
          market
          resolution
          startTime
          open
          high
          low
          close
          volume
          baseAssetVol
          txCount
          version
          blockNumber
        }
      }
    }
    """

  public let operationName: String = "ListCancleSticks"

  public var query: TableCandleStickQueryInput
  public var limit: Int

  public init(query: TableCandleStickQueryInput, limit: Int) {
    self.query = query
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["query": query, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("listCandleSticks", arguments: ["query": GraphQLVariable("query"), "limit": GraphQLVariable("limit")], type: .object(ListCandleStick.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(listCandleSticks: ListCandleStick? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "listCandleSticks": listCandleSticks.flatMap { (value: ListCandleStick) -> ResultMap in value.resultMap }])
    }

    public var listCandleSticks: ListCandleStick? {
      get {
        return (resultMap["listCandleSticks"] as? ResultMap).flatMap { ListCandleStick(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "listCandleSticks")
      }
    }

    public struct ListCandleStick: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CandleStickConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CandleStickConnection", "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CandleStick"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("market", type: .nonNull(.scalar(String.self))),
            GraphQLField("resolution", type: .nonNull(.scalar(String.self))),
            GraphQLField("startTime", type: .nonNull(.scalar(Int.self))),
            GraphQLField("open", type: .nonNull(.scalar(String.self))),
            GraphQLField("high", type: .nonNull(.scalar(String.self))),
            GraphQLField("low", type: .nonNull(.scalar(String.self))),
            GraphQLField("close", type: .nonNull(.scalar(String.self))),
            GraphQLField("volume", type: .nonNull(.scalar(String.self))),
            GraphQLField("baseAssetVol", type: .nonNull(.scalar(String.self))),
            GraphQLField("txCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("version", type: .nonNull(.scalar(Int.self))),
            GraphQLField("blockNumber", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(market: String, resolution: String, startTime: Int, `open`: String, high: String, low: String, close: String, volume: String, baseAssetVol: String, txCount: Int, version: Int, blockNumber: Int) {
          self.init(unsafeResultMap: ["__typename": "CandleStick", "market": market, "resolution": resolution, "startTime": startTime, "open": `open`, "high": high, "low": low, "close": close, "volume": volume, "baseAssetVol": baseAssetVol, "txCount": txCount, "version": version, "blockNumber": blockNumber])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var market: String {
          get {
            return resultMap["market"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "market")
          }
        }

        public var resolution: String {
          get {
            return resultMap["resolution"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "resolution")
          }
        }

        public var startTime: Int {
          get {
            return resultMap["startTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "startTime")
          }
        }

        public var `open`: String {
          get {
            return resultMap["open"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "open")
          }
        }

        public var high: String {
          get {
            return resultMap["high"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "high")
          }
        }

        public var low: String {
          get {
            return resultMap["low"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "low")
          }
        }

        public var close: String {
          get {
            return resultMap["close"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "close")
          }
        }

        public var volume: String {
          get {
            return resultMap["volume"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "volume")
          }
        }

        public var baseAssetVol: String {
          get {
            return resultMap["baseAssetVol"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "baseAssetVol")
          }
        }

        public var txCount: Int {
          get {
            return resultMap["txCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "txCount")
          }
        }

        public var version: Int {
          get {
            return resultMap["version"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "version")
          }
        }

        public var blockNumber: Int {
          get {
            return resultMap["blockNumber"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "blockNumber")
          }
        }
      }
    }
  }
}
