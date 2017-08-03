$(function(){
	// Limit entered values to numbers
	$('.sudoku-grid input.cell').keypress(function(e) {
        // Ensure that it is a number and stop the keypress
       evt = (e) ? e : window.event;
       var charCode = (e.which) ? e.which : e.keyCode;
       depth = $('#depth').val()
       console.log(charCode)
       console.log(depth)
       if (charCode != 44 && charCode != 46 && charCode > 31
        && ((depth == 4 && (charCode < 49 || charCode > 57) && (charCode < 65 || charCode > 71))
          || (depth == 3 && (charCode < 49 || charCode > 57))
          || (depth == 2 && (charCode < 49 || charCode > 52))))
           return e.preventDefault();
	});
});