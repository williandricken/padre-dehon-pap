// $('document').ready(function(){
// 	$('.get-student').on('click', function (e) {
//         $('body').addClass('is-modal-open');
//         var id = $(this).data('student-id');
//         $.get('/quick_info/' + id, function (data) {
//             $('.info-student').html(data);
//             var modal = document.getElementById('myModal');
//             modal.style.display = "block";
//             var span = document.getElementsByClassName("close")[0];
//             span.onclick = function() {
//                 modal.style.display = "none";
//             }
//             window.onclick = function(event) {
//                 if (event.target == modal) {
//                     modal.style.display = "none";
//                     $('body').removeClass('is-modal-open');
//                 }
//             }
//         })
//     })
// })


	// $('#myModal').on('shown.bs.modal', function (event){
	//   var button = $(event.relatedTarget)
	//   var student = button.data('student')
	//   var modal = $(this)
	//   // $.get('/students/' + id, function (data) {
 //   //         $('.modal-body').html(data);
 //   //         console.log(data);	
            
 //   //     })	
 //           $('#myInput').focus()
	//   modal.find('.modal-title').text('New message to ' + student)
	//   modal.find('.modal-body').val(student)
	// 	// var id = $(this).data('student-id');
	// 	// console.log(id);
 //  //       $.get('/students/' + id, function (data) {
 //  //           $('.modal-body').html(data);

 //  //           $('#myInput').focus()
            
 //  //       })		
	  
	// })
