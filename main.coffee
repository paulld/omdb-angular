$ ->

  master = (title) ->
    $.ajax
      url: "http://www.omdbapi.com/?s=#{title}"
      # url: "http://www.omdbapi.com/?s=Harry"
    .done (data) ->
      movies = $.parseJSON(data)['Search']
      # console.log movies
      # console.log movies.Title
      for movie in movies
        # console.log movie.Year
        # console.log movie.Type
        # console.log movie.imdbID
        # $(".movieAll").remove()
        $(".movieAll").append "<tr><td>#{movie.Title}</td>
        <td>#{movie.Type}</td>
        <td>#{movie.Year}</td><td>#{movie.imdbID}</td></tr>"


  # master("Tom")

    # clearMovies (list) ->
    #   movies = html('')


  # inputText = (string) ->
    # str = $("form").serialize()
  $('#form1').on 'submit', (event) ->
    event.preventDefault()
    movieSearch = $('#titleContains').val()
    # alert 'Hello'
      # console.log movieSearch
    # e.console.log form
    # e.console.log input
    master movieSearch
