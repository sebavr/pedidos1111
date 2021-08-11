
calcular();
////////////////////////////Funciones /////////////////////////////
function calcular(){
	var precio=$("#subtotal").attr("precio");
	var cantidad=$("#cantidad").val();
	var subtotal=precio*cantidad;
	$("#subtotal").text("$"+subtotal);
	
}