//
//  NewsArticle.swift
//  SpaceNewsFlightApp
//
//  Created by Jayasri  on 22/09/22.
//

import SwiftUI
import CachedAsyncImage
import Foundation
import GoogleSignIn
import UIKit
import GoogleSignInSwift

struct NewsArticle: View {
    let imageurl: String
    let sisteName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sisteName).foregroundColor(.blue)
                          .italic()
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: imageurl),transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width:150,height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 20)) .transition(.opacity)
                        Text(sisteName).foregroundColor(.blue)
                             .italic()
                    } else {
                        ProgressView()
                            .frame(width:150,height: 150)
                    }
                }
            }

        }
        
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle( imageurl: "", sisteName: "jayasri news app")
    }
}
