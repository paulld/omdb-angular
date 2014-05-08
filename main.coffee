$ ->

  $('#list-head').hide()
  $('#details-head h3').hide()

  master = (title) ->
    $.ajax
      url: "http://www.omdbapi.com/?s=#{title}"
    .done (data) ->
      movies = $.parseJSON(data)['Search']
      # console.log movies
      $('.tempList').remove()
      # $(".movieAll").html ''
      $('#details-head').hide()
      $('#list-head').show()
      for movie in movies
        movieList = $("<div class=\"row\">
                      <div class=\"col-md-6\">
                        <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                          #{movie.Title}
                        </span>
                      </div>
                      <div class=\"col-md-2\">
                        <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                          #{movie.Year}
                        </span>
                      </div>
                      <div class=\"col-md-2\">
                        <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                          #{movie.Type}
                        </span>
                      </div>
                      <div class=\"col-md-2\">
                        <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                          #{movie.imdbID}<span>
                      </div>
                    </div>")
        $(".movieAll").append movieList

  searchByID = (imdbID) ->
    $.ajax
      url: "http://www.omdbapi.com/?i=#{imdbID}&tomatoes=true&plot=full"
    .done (data) ->
      movie = $.parseJSON(data)
      $('#details-head').find('h3').show()
      movieDirector = $("<span>#{movie.Director}</span>")
      movieActors = $("<span>#{movie.Actors}</span>")
      movieGenre = $("<span>#{movie.Genre}</span>")
      movieRuntime = $("<span>#{movie.Runtime}</span>")
      movieCountry = $("<span>#{movie.Country}</span>")
      movieLanguages = $("<span>#{movie.Languages}</span>")
      movieImdbRating = $("<span>#{movie.ImdbRating}</span>")
      movieAwards = $("<span>#{movie.Awards}</span>")

      moviePlot = $("<span>#{movie.Plot}</span>")
      moviePoster = $("<span><img src=\"#{movie.Poster}\"></span>")
      
      $('#details-head').show()

      $(".movie-director").html(movieDirector)
      $(".movie-actors").html(movieActors)
      $(".movie-genre").html(movieGenre)
      $(".movie-runtime").html(movieRuntime)
      $(".movie-country").html(movieCountry)
      $(".movie-languages").html(movieLanguages)
      $(".movie-imdbrating").html(movieImdbRating)
      $(".movie-awards").html(movieAwards)
      $(".movie-plot").html(moviePlot)
      $(".movie-poster").html(moviePoster)

  $('#formSearch').on 'submit', (event) ->
    event.preventDefault()
    movieSearch = $('#titleContains').val()
    master movieSearch

  $('body').delegate 'span', 'click', (event) ->
    # event.preventDefault()
    imdbID = $(event.target).data('imdb')
    searchByID imdbID

    