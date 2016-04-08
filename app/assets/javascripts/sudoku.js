$(function(){
	// Limit entered values to numbers
	$('.sudoku-grid input.cell').keypress(function(e) {
        // Ensure that it is a number and stop the keypress
       evt = (e) ? e : window.event;
       var charCode = (e.which) ? e.which : e.keyCode;
       if (charCode != 44 && charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
           return e.preventDefault();
	});
});