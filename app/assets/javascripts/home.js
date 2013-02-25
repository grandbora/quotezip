var lastQ = ''
var searchTimeoutId

function observeSearchValue(q) {
  if (lastQ === q) return
  lastQ = q

  clearTimeout(searchTimeoutId)

  searchTimeoutId = setTimeout(function(){
    filterQuotes(q)
  }, 1000)
}

function filterQuotes(q) {
  resetQuotes()
  if ('' == q) return 
  $(".list ul li:not(:contains('"+q+"'))").hide()
  _gaq.push(['_trackEvent', 'interaction', 'Search', q])
}

function resetQuotes() {
  $(".list ul li").show()
}

function setAutoComplete() {

  $("input.book").autocomplete({
  source: function(request, response) {
    
      $.ajax({
        url: "https://www.googleapis.com/books/v1/volumes",
        dataType: "jsonp",
        data: {
          q : 'intitle:' + request.term,
          key : 'AIzaSyBjdXbsKKP2GnX2k_JABQvBfCZVJYDBwbI',
          langRestrict : 'en',
          maxResults : 12
        },
        success: function( data ) {
          response($.map(data.items, function(item) {
            return {
              label: item.volumeInfo.title,
              value: item.volumeInfo.title,
              data: item
            }
          }))
        }
      })
    },
    minLength: 2,
    select: function(event, ui) {
      reloadQuotes(ui.item)
    },
    open: function() {
      $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" )
    },
    close: function() {
      $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" )
    }
  })
}

function reloadQuotes(bookItem) {
  quotes = fetchQuotesByBook(bookItem)
}

function fetchQuotesByBook(bookItem) {
  $.ajax({
    url: "/quote.json",
    dataType: "json",
    data: {
      name : bookItem.value
    },
    success: function(data, status, xhr) {
      $('.list ul').empty()

      $.each(data, function(index, book) {
        var contentDiv = $('<div>').addClass('content').append(book.content)
        var bookDiv = $('<div>').addClass('book').append(book.book)
        $('.list ul').append($('<li>').append(contentDiv, bookDiv))
      })
    }
  })
}
