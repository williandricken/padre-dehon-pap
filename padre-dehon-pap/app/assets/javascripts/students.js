$('document').ready(function(){

	$('#myModal').on('shown.bs.modal', function (event){
	  var button = $(event.relatedTarget)
	  var student = button.data('student')
	  var modal = $(this)
	  // $.get('/students/' + id, function (data) {
   //         $('.modal-body').html(data);
   //         console.log(data);	
            
   //     })	
           $('#myInput').focus()
	  modal.find('.modal-title').text('New message to ' + student)
	  modal.find('.modal-body').val(student)
		// var id = $(this).data('student-id');
		// console.log(id);
  //       $.get('/students/' + id, function (data) {
  //           $('.modal-body').html(data);

  //           $('#myInput').focus()
            
  //       })		
	  
	})

})