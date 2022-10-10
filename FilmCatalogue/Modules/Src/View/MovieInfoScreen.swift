//
//  MovieInfoScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct MovieInfoScreen: View {
    @ObservedObject var movieInfoVM = MovieInfoViewModel()
    @State var isPresented = false
    
    var movieID: Int = 0
    var currentPage = 1
    
    init(id: Int){
        self.movieID = id
    }
    
    var body: some View {
        VStack(alignment: .center){
            StaticAppHeader()
            youtubeSection
            movieInfoSection
            Spacer().frame(height: 35)
            Button {
                isPresented = true
                movieInfoVM.getReview(movieID: self.movieID, page: 1)
            } label: {
                Text("Click for the reviews")
                    .foregroundColor(.white)
                    .bold()
            }
                .padding(.vertical, 7.5)
                .padding(.horizontal, 15)
                .frame(alignment: .center)
                .background(Color.darkGrey.gradient)
                .cornerRadius(3)
        }
            .onAppear(){
                movieInfoVM.getTrailer(movieID: self.movieID)
                movieInfoVM.getDetailedMovie(movieID: self.movieID)
            }
            .sheet(isPresented: $isPresented, content: {
                reviewSection
                    .presentationDetents([.medium, .large])
            })
            .background(Color.black)
    }
    
    var youtubeSection: some View{
        ZStack(alignment: .center) {
            KFI(type: .backdrop, image: movieInfoVM.movieInfo?.backdrop_path ?? "")
            if(movieInfoVM.trailerStatus){
                YoutubePlayer(movieInfoVM.youtubeKey ?? "")
            }
        }
            .aspectRatio(16/9, contentMode: .fit)
    }
    
    var movieInfoSection: some View{
        VStack(alignment: .leading, spacing: 12.5) {
            if(movieInfoVM.descriptionStatus){
                HStack(alignment: .center, spacing: 10){
                    KFI(type: .smallPoster, image: movieInfoVM.movieInfo?.poster_path ?? "")
                        .aspectRatio(2/3, contentMode: .fit)
                    VStack(alignment: .leading, spacing: 3) {
                        Text(movieInfoVM.movieInfo?.title ?? "")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        HStack(alignment: .center){
                            ForEach(movieInfoVM.genres ?? []) { genre in
                                Text(genre.name)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        Text("Released Date: \(movieInfoVM.releasedDate)")
                            .foregroundColor(.white)
                        Text("Rating: \(movieInfoVM.rating)")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 5)
                    Spacer()
                }
                .frame(height: 150)
                Text(movieInfoVM.movieInfo?.overview ?? "")
                    .foregroundColor(.white)
                Spacer()
                Text("Website: \(movieInfoVM.movieInfo?.homepage ?? "")")
                    .foregroundColor(.white)
            } else {
                Spacer()
                Text("There are no description of this film")
                    .foregroundColor(.lightGrey)
                Spacer()
            }
        }
    }
    
    var reviewSection: some View {
        VStack{
            if(movieInfoVM.reviewStatus){
                ScrollView{
                    ForEach(movieInfoVM.review ?? []){ review in
                        ReviewList(authorDetail: review.author_details, content: review.content, createdAt: movieInfoVM.convertToCreatedDate(review.created_at))
                    }
                }
            } else {
                Spacer()
                HStack{
                    Spacer()
                    Text("There are no review of this film yet")
                        .foregroundColor(.lightGrey)
                    Spacer()
                }
                Spacer()
            }
        }
            .padding(20)
            .background(Color.darkGrey)
    }
}

struct MovieInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoScreen(id: 718930)
    }
}

