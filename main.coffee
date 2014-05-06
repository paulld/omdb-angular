$ ->

	master = (title) ->
		$.ajax
			url: "http://www.omdbapi.com/?s=#{title}"
		.done(data)
			console.log data

	master("Harry")
	