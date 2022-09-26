//
//  newsView.swift
//  SpaceNewsFlightApp
//
//  Created by Jayasri  on 22/09/22.
//

import SwiftUI
import Foundation
import GoogleSignIn
import UIKit
import GoogleSignInSwift


struct newsView: View {
    let colums: [GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil)
    ]
    @EnvironmentObject var data : SpaceAPI
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button {
                        print("logout pressed")
                    } label: {
                        Image(systemName:"power")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 35,height: 35)
                       
                    }
                    .padding(.leading, 25)
                    Spacer()
                    Button {
                        data.getData()
                        print("Button pressed")
                    } label: {
                        
                        Image(systemName:"arrow.clockwise")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 35,height: 35)
                    }
                    .padding(.trailing, 25)
                }
                Divider()
                
                    .contentShape(Rectangle())
                ScrollView {
                    LazyVGrid(columns: colums) {
                        Spacer()
                        .contentShape(Rectangle())
                        Section(header:Text("Latest News").font(.title)) {
                            
                            ForEach(data.news) { news in
                                
                                NewsArticle( imageurl: news.imageUrl, sisteName: news.newsSite ).onTapGesture {
                                    openUrl(URL(string: news.url)!)
                                }
                                
                            }
                        }
                        .padding(20)
                        
                    }
                }
            }
            }
        }
    }

struct newsView_Previews: PreviewProvider {
    static var previews: some View {
        newsView()
            .environmentObject(SpaceAPI())
    }
}

