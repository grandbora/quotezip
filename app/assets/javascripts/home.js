var lastQ = ''
var searchTimeoutId

function observeValue(q) {
  if (lastQ === q) return
  lastQ = q

  clearTimeout(searchTimeoutId)

  searchTimeoutId = setTimeout(function(){
    filterQuotes(q)
  }, 1000)
}

function filterQuotes(q) {
  if ('' == q) return 
  
  $.ajax({
    url: "/quote/content.json",
    dataType: "json",
    data: {
      q : q
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
      fetchQuotesByBook(ui.item)
    },
    open: function() {
      $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" )
    },
    close: function() {
      $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" )
    },
    change: function(event, ui) {
      if (!ui.item) this.value = ''
    }
  })
}

function fetchQuotesByBook(bookItem) {
  $.ajax({
    url: "/quote/book.json",
    dataType: "json",
    data: {
      q : bookItem.value
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

function formValidator() {
  if("" === $("input.book").val()){
    alert('Btw, what is the title of the book?')
    return false
  }

  if("" === $('.create .content').val()){
    alert('Lets type in the quote first.')
    return false
  }
}