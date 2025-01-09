//
//  ViewControllerVM.swift
//  TienYu_Flights
//
//  Created by Kedia on 2025/1/9.
//

import Foundation
import Combine

class ViewControllerVM {

    func numberOfJourneys() -> Int {
        return journeys.count
    }

    func journey(at index: Int) -> String? {
        if index >= journeys.count {
            return nil
        }
        return journeys[index]
    }

    // 使用 async/await 同步等候三筆資料後再進行合併
    func fetchAllJourneys() async {
        return await withTaskGroup(of: [String].self) { group in
            // 新增子任務
            group.addTask {
                await TUAPIManager.fetchFlights()
            }
            group.addTask {
                await TUAPIManager.fetchHotels()
            }
            group.addTask {
                await TUAPIManager.fetchSights()
            }

            // 收集所有子任務回傳的資料並合併
            for await result in group {
                self.journeys.append(contentsOf: result)
            }
        }
    }

    private var journeys: [String] = []
}
