//
//  NetworkConstant.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singletone
    }
  
    public var serverAddress: String {
        get {
            return "https://kitsu.io"
        }
    }
   
}
