var lastQ = '';
var searchTimeoutId;

/*
 *
 * @param q search parameter
 */
function observeSearchValue(q) {
  if (lastQ === q) return;
  lastQ = q;

  clearTimeout(searchTimeoutId);

  searchTimeoutId = setTimeout(function(){
    filterQuotes(q);
  }, 1000);
}

/*
 *
 * @param q search parameter
 */
function filterQuotes(q) {
  resetQuotes();

  if ('' == q) return ;

  $(".list ul li:not(:contains('"+q+"'))").hide();

  _gaq.push(['_trackEvent', 'interaction', 'Search', q]);
}

/*
 *
 */
function resetQuotes() {
  $(".list ul li").show();
}

$(".book").autocomplete({
  source: function(request, response) {
    $.ajax({
      url: "http://ws.geonames.org/searchJSON",
      dataType: "jsonp",
      data: {
        featureClass: "P",
        style: "full",
        maxRows: 12,
        name_startsWith: request.term
      },
      success: function( data ) {
        response( $.map( data.geonames, function( item ) {
          return {
            label: item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName,
            value: item.name
          }
        }));
      }
    });
  },
  minLength: 2,
  select: function( event, ui ) {
    log( ui.item ?
      "Selected: " + ui.item.label :
      "Nothing selected, input was " + this.value);
  },
  open: function() {
    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
  },
  close: function() {
    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
  }
});