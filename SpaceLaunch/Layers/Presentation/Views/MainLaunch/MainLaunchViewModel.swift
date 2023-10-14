//
//  MainLaunchViewModel.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation

final class MainLaunchViewModel : ObservableObject {
    @Published var launchNews: [LaunchNewsModel] = []
    @Published var upcomingLaunches: [RocketLaunchModel] = []
    private(set) var latestLaunch: RocketLaunchModel?
    private(set) var nextLaunch: RocketLaunchModel?
    
    func fetchLaunchNews() {
        guard launchNews.isEmpty else { return }
        let launchDGroup: DispatchGroup = .init()
        
        fetchLatestLaunch(on: launchDGroup)
        fetchNextLaunch(on: launchDGroup)
        
        launchDGroup.notify(queue: .main) {
            self.launchNews.removeAll()
            self.launchNews.append(.init(launchType: "LATEST", rocketLaunch: self.latestLaunch))
            self.launchNews.append(.init(launchType: "NEXT", rocketLaunch: self.nextLaunch))
        }
    }
    
    func pullToRefresh() {
        upcomingLaunches.removeAll()
        launchNews.removeAll()
        fetchUpcoming()
        fetchLaunchNews()
    }
    
    func fetchUpcoming() {
        fetchUpcomingLaunches()
    }
    
    private func fetchLatestLaunch(on dispatchGroup: DispatchGroup?) {
        dispatchGroup?.enter()
        SpaceAPI.request(endpointType: SpaceEndpoint.latestLaunch) { (result: SpaceRequestResult<RocketLaunchModel>) in
            switch result {
            case .success(let result):
                self.latestLaunch = result
            case .error(let error): break
            }
            dispatchGroup?.leave()
        }
    }
    
    private func fetchNextLaunch(on dispatchGroup: DispatchGroup?) {
        dispatchGroup?.enter()
        SpaceAPI.request(endpointType: SpaceEndpoint.nextLaunch) { (result: SpaceRequestResult<RocketLaunchModel>) in
            switch result {
            case .success(let result):
                self.nextLaunch = result
            case .error(let error): break
            }
            dispatchGroup?.leave()
        }
    }
    
    private func fetchUpcomingLaunches(on dispatchGroup: DispatchGroup? = nil) {
        dispatchGroup?.enter()
        SpaceAPI.request(endpointType: SpaceEndpoint.upcomingLaunchs) { (result: SpaceRequestResult<[RocketLaunchModel]>) in
            switch result {
            case .success(let result):
                inMainAsync { self.upcomingLaunches = result }
            case .error(let error): break
            }
            dispatchGroup?.leave()
        }
    }
}
