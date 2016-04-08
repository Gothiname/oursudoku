$(function(){
	// Limit entered values to numbers
	$('.sudoku-grid input.cell').keypress(function(e) {
        // Ensure that it is a number and stop the keypress
        if (e.charCode < 48 || e.charCode > 57)
            e.preventDefault();
	});
});