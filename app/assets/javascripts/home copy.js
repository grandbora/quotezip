var lastQ = ''
var searchTimeoutId

// function observeValue() {

//   q = $('.create .content').val()
//   q = $.trim(q)

//   if (lastQ === q) return
//   lastQ = q

//   clearTimeout(searchTimeoutId)

//   searchTimeoutId = setTimeout(function(){
//     filterQuotes(q)
//   }, 500)
// }

// function filterQuotes(q) {
//   if ("" !== $(".book-input").val()) {
//     //make bold here
//     $('.list ul li').removeHighlight().highlight(q)
//     $('.list .listTitle').text("Quotes containing the text : " + q)
//     _gaq.push(['_trackEvent', 'interaction', 'typeQuoteWithBook', q + " -- "+ $(".book-input").val()])
//     return
//   }

//   if ('' == q) return loadAllQuotes() 
//   // if (2 > q.length) return

//   $.ajax({
//     url: "/quote/content.json",
//     dataType: "json",
//     data: {
//       q : q
//     },
//     success: function(data, status, xhr) {
//       $('.list ul').empty()

//       $.each(data, function(index, book) {
//         var contentDiv = $('<div>').addClass('content').append(book.content)
//         var bookDiv = $('<div>').addClass('book').append(book.book)
//         $('.list ul').append($('<li>').append(contentDiv, bookDiv))
//       })

//       //make bold here
//       $('.list ul li').removeHighlight().highlight(q)
//       $('.list .listTitle').text("Quotes containing the text : " + q)
//       _gaq.push(['_trackEvent', 'interaction', 'typeQuote', q]);
//     }
//   })

// }

function setAutoComplete() {

  $(".book-input").autocomplete({
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
      // fetchQuotesByBook(ui.item)
      _gaq.push(['_trackEvent', 'interaction', 'selectBook', ui.item.value])
    },
    open: function() {
      $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" )
    },
    close: function() {
      $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" )
    },
    change: function(event, ui) {
      if (!ui.item) {
       this.value = ''
       // loadAllQuotes() 
      }
    }
  })
}

// function fetchQuotesByBook(bookItem) {
//   $.ajax({
//     url: "/quote/book.json",
//     dataType: "json",
//     data: {
//       q : bookItem.value
//     },
//     success: function(data, status, xhr) {
//       $('.list ul').empty()

//       $('.list .listTitle').text("Quotes from the book : " + bookItem.value)

//       $.each(data, function(index, book) {
//         var contentDiv = $('<div>').addClass('content').append(book.content)
//         var bookDiv = $('<div>').addClass('book').append(book.book)
//         $('.list ul').append($('<li>').append(contentDiv, bookDiv))
//       })
//     }
//   })
// }

// function loadAllQuotes() {
//   $.ajax({
//     url: "/quote.json",
//     dataType: "json",
//     success: function(data, status, xhr) {
//       $('.list ul').empty()

//       $('.list .listTitle').text("Recent Quotes")

//       $.each(data, function(index, book) {
//         var contentDiv = $('<div>').addClass('content').append(book.content)
//         var bookDiv = $('<div>').addClass('book').append(book.book)
//         $('.list ul').append($('<li>').append(contentDiv, bookDiv))
//       })
//     }
//   })
// }

function formValidator() {
  if("" === $(".book-input").val()){
    alert('Btw, what is the title of the book?')
    return false
  }

  if("" === $('.content-input').val()){
    alert('Lets type in the quote first.')
    return false
  }

  _gaq.push(['_trackEvent', 'interaction', 'shareQuote', $('.create .content').val()])
}


// subscribe button
// $(function() {
//   $(".subscribe button")
//     .button()
//     .click(function(event) {
//       event.preventDefault()

//       inputElm = $('<input/>').attr('type', 'text').attr('name', 'email').attr('placeholder', 'your_email@address.com')
//       submitButton = $('<input/>').attr('type', 'submit').attr('value','subscribe')
//       dialogElm = $('<form/>').addClass('subscribeDialog')
//         .attr('action', '/subscribe')
//         .attr('method', 'post')
//         .append(inputElm, submitButton)

//       dialogElm.dialog({
//         modal: true
//       })

//       _gaq.push(['_trackEvent', 'subscribe', 'subscribeDialogOpen'])
//     })
// });

//highlight
//<http://johannburkard.de/blog/programming/javascript/highlight-javascript-text-higlighting-jquery-plugin.html>
// jQuery.fn.highlight = function(pat) {
//  function innerHighlight(node, pat) {
//   var skip = 0;
//   if (node.nodeType == 3) {
//    var pos = node.data.toUpperCase().indexOf(pat);
//    if (pos >= 0) {
//     var spannode = document.createElement('span');
//     spannode.className = 'highlight';
//     var middlebit = node.splitText(pos);
//     var endbit = middlebit.splitText(pat.length);
//     var middleclone = middlebit.cloneNode(true);
//     spannode.appendChild(middleclone);
//     middlebit.parentNode.replaceChild(spannode, middlebit);
//     skip = 1;
//    }
//   }
//   else if (node.nodeType == 1 && node.childNodes && !/(script|style)/i.test(node.tagName)) {
//    for (var i = 0; i < node.childNodes.length; ++i) {
//     i += innerHighlight(node.childNodes[i], pat);
//    }
//   }
//   return skip;
//  }
//  return this.length && pat && pat.length ? this.each(function() {
//   innerHighlight(this, pat.toUpperCase());
//  }) : this;
// };

// jQuery.fn.removeHighlight = function() {
//  return this.find("span.highlight").each(function() {
//   this.parentNode.firstChild.nodeName;
//   with (this.parentNode) {
//    replaceChild(this.firstChild, this);
//    normalize();
//   }
//  }).end();
// };