//
//  TUAPIManager.swift
//  TienYu_Flights
//
//  Created by Kedia on 2025/1/9.
//

import Foundation

class TUAPIManager {

    // 模擬非同步取得航班資料
    static func fetchFlights() async -> [String] {
        // 模擬 1 秒網路延遲
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return ["Flight A", "Flight B", "Flight C"]
    }

    // 模擬非同步取得酒店資料
    static func fetchHotels() async -> [String] {
        // 模擬 2 秒網路延遲
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return ["Hotel X", "Hotel Y", "Hotel Z"]
    }

    // 模擬非同步取得景點資料
    static func fetchSights() async -> [String] {
        // 模擬 3 秒網路延遲
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        return ["Sight 1", "Sight 2", "Sight 3"]
    }
}
