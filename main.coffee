$ ->

  # clearMovies = (list) ->
  #   list = html('')

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
      movieDirector = $("<span class=\"temp-details\">#{movie.Director}</span>")
      movieActors = $("<span class=\"temp-details\">#{movie.Actors}</span>")
      movieGenre = $("<span class=\"temp-details\">#{movie.Genre}</span>")
      movieRuntime = $("<span class=\"temp-details\">#{movie.Runtime}</span>")
      movieCountry = $("<span class=\"temp-details\">#{movie.Country}</span>")
      movieLanguages = $("<span class=\"temp-details\">#{movie.Languages}</span>")
      movieImdbRating = $("<span class=\"temp-details\">#{movie.ImdbRating}</span>")
      movieAwards = $("<span class=\"temp-details\">#{movie.Awards}</span>")

      moviePlot = $("<span class=\"temp-details\">#{movie.Plot}</span>")
      moviePoster = $("<span class=\"temp-details\"><img src=\"#{movie.Poster}\"></span>")
      
      $('#details-head').show()
      $(".temp-details").remove()

      $(".movie-director").append movieDirector
      $(".movie-actors").append movieActors
      $(".movie-genre").append movieGenre
      $(".movie-runtime").append movieRuntime
      $(".movie-country").append movieCountry
      $(".movie-languages").append movieLanguages
      $(".movie-imdbrating").append movieImdbRating
      $(".movie-awards").append movieAwards
      $(".movie-plot").append moviePlot
      $(".movie-poster").append moviePoster

  # searchByID("tt1285016")
  # searchByID

  $('#formSearch').on 'submit', (event) ->
    event.preventDefault()
    movieSearch = $('#titleContains').val()
    master movieSearch


  # $('tt0054167').on 'click', (event) ->
    # console.log 'Hello'
    # searchByID("tt0054167")

  # $('#tt0054167').click ->
    # console.log "Hello"
    # searchByID("tt0054167")

  $('body').delegate 'span', 'click', (event) ->
    # event.preventDefault()
    # console.log event.target
    imdbID = $(event.target).data('imdb')
    # console.log imdbID
    # console.log event.target
    # event.preventDefault()
    # movieID = $(event.target).data('imdbID')
    # console.log imdbID
    searchByID imdbID
    # hello = event.currentTarget
    # console.log hello
    # searchByID("tt0054167")

  # $(".tempList").on 'click', (event) ->
    # event.preventDefault()
    # hello = $(event.target)
    # event.console.log "hello!"
    # movieID = $(event.target).data('imdbID')
    # searchByID movieID

