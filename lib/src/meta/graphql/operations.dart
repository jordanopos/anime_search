class AnimeOperations {
  const AnimeOperations._();

  static String getFullAnime = """
  query (\$id: Int){
  Media (id: \$id, type: ANIME){
    status
    seasonYear
    genres
    title {
      romaji
      english
      native
      userPreferred
    }
    bannerImage
    coverImage {
      extraLarge
      large
      medium
      color
    }
    episodes
    streamingEpisodes {
      title
      thumbnail
      url
    }
    description
     characters {
       nodes{
        name {
          first
          middle
          last
          full
          native
          userPreferred
        }
        image {
          large
          medium
        }
      }
    
     }
  }
}
  """;
}

//
