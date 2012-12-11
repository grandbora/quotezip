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