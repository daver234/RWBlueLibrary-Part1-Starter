//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by David Rothschild on 8/10/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation

final class LibraryAPI {
  
  private let persistencyManager = PersistencyManager()
  private let httpClient = HTTPClient()
  private let isOnline = false
  // 1
  static let shared = LibraryAPI()
  // 2
  private init() {
  }
  
  func getAlbums() -> [Album] {
    return persistencyManager.getAlbums()
  }
  
  func addAlbum(_ album: Album, at index: Int) {
    persistencyManager.addAlbum(album, at: index)
    if isOnline {
      httpClient.postRequest("/api/addAlbum", body: album.description)
    }
  }
  
  func deleteAlbum(at index: Int) {
    persistencyManager.deleteAlbum(at: index)
    if isOnline {
      httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
    }
  }
}
