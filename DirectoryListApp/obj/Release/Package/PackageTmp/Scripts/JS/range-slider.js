/*----------------------------------
	//------ RANGE SLIDER ------//
	-----------------------------------*/
$(".slider-range").slider({
	range: true,
	min: 1,
	max: 50000,
	step: 1000,
	values: [1, 10000],
	slide: function (event, ui) {
		$(".slider_amount").val("$" + ui.values[0].toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + " - $" + ui.values[1].toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
	}
});
$(".slider_amount").val("KM: " + $(".slider-range").slider("values", 0).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + " - " + $(".slider-range").slider("values", 1).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
