$ ->

  # clearMovies = (list) ->
  #   list = html('')

  master = (title) ->
    $.ajax
      url: "http://www.omdbapi.com/?s=#{title}"
    .done (data) ->
      movies = $.parseJSON(data)['Search']
      # console.log movies
      $('.tempList').remove()
      # $(".movieAll").html ''
      for movie in movies
        $(".movieAll").append "<div class=\"row\">
                                <div class=\"col-md-6\">
                            <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                                    #{movie.Title}</span>
                                </div>
                                <div class=\"col-md-2\">
                            <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                                    #{movie.Year}</span>
                                </div>
                                <div class=\"col-md-2\">
                            <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                                    #{movie.Type}</span>
                                </div>
                                <div class=\"col-md-2\">
                            <span class=\"tempList\" data-imdb=#{movie.imdbID}>
                                    #{movie.imdbID}<span>
                                </div>
                              </div>"


  searchByID = (imdbID) ->
    $.ajax
      url: "http://www.omdbapi.com/?i=#{imdbID}&tomatoes=true&plot=full"
    .done (data) ->
      movie = $.parseJSON(data)
      $('.tempPlot').remove()
      $(".moviePlot").append "<div class=\"tempPlot\">#{movie.Plot}</div>"
      $('.tempPoster').remove()
      $(".moviePoster").append "<div class=\"tempPoster\">
                                  <img src=\"#{movie.Poster}\">
                                </div>"

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

