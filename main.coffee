$ ->

  # clearMovies = (list) ->
  #   list = html('')

  master = (title) ->
    $.ajax
      url: "http://www.omdbapi.com/?s=#{title}"
    .done (data) ->
      movies = $.parseJSON(data)['Search']
      # console.log movies
      $('.temp').remove()
      for movie in movies
        $(".movieAll").append "<div class=\"temp\">
                                <div class=\"row\">
                                  <div class=\"col-md-6\">
                                    #{movie.Title}
                                  </div>
                                  <div class=\"col-md-2\">
                                    #{movie.Year}
                                  </div>
                                  <div class=\"col-md-2\">
                                    #{movie.Type}
                                  </div>
                                  <div class=\"col-md-2\">
                                    #{movie.imdbID}
                                  </div>
                                </div>
                              </div>"


  # searchByID = (id) ->
  #   $.ajax
  #     # url: "http://www.omdbapi.com/?i=tt1285016"
  #     newUrl: "http://www.omdbapi.com/?i=#{id}"
  #   .done (data) ->
  #     details = $.parseJSON(data)
  #   console.log details

  # searchByID('tt1285016')


  $('#formSearch').on 'submit', (event) ->
    event.preventDefault()
    movieSearch = $('#titleContains').val()
    master movieSearch
