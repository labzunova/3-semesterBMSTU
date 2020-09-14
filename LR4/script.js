/*
Сделать кнопку расчёта стоимости заказа.
*/
var d = document;

function add(name,price,image){
    var table = d.getElementById('cart').getElementsByTagName('TBODY')[0];

    var row = d.createElement("TR");   // create the row
    table.appendChild(row);

    var imgTD = d.createElement("TD"); // creating and adding the cell
    var nameTD = d.createElement("TD");
    var priceTD = d.createElement("TD");
    row.appendChild(imgTD);
    row.appendChild(nameTD);
    row.appendChild(priceTD);

    imgTD.innerHTML='<img width="100px" src='+image+'>'; // filling
    nameTD.innerHTML = name;
    priceTD.innerHTML = price;

    d.getElementById('count').style.visibility = 'visible';
 	d.getElementById('cartIsEmpty').style.display = 'none';
}

function addByYourself() {
	name = d.getElementById('name').value;
    price = d.getElementById('price').value;
    var table = d.getElementById('cart').getElementsByTagName('TBODY')[0];

    if (name == '') alert('Введите наименование!') 
    	else if (price == '') alert('Введите цену!');
    	if (!isNaN(price)) {
    			var row = d.createElement("TR");
    			table.appendChild(row);

    			var imgTD = d.createElement("TD");
    			var nameTD = d.createElement("TD");
   	 			var priceTD = d.createElement("TD");
    			row.appendChild(imgTD);
    			row.appendChild(nameTD);
   				row.appendChild(priceTD);

    			imgTD.innerHTML = 'no image';
    			nameTD.innerHTML = name;
    			priceTD.innerHTML = price;

   				d.getElementById('cartIsEmpty').style.display = 'none';
 				d.getElementById('sum').style.visibility = 'visible';
 				d.getElementById('recount').style.visibility = 'visible';
			} else alert('Цена должна быть числом!');  
}

function count() {
	var sum = 0;
	var table = d.getElementById('cart').getElementsByTagName('TBODY')[0];


			// TODO
	/*for(var i = 0; i < table.cols.length; i++) {
		sum *= parseFloat(table.rows[i].col[2]);
	} 

	d.getElementById('sum').value = sum; */ 

	var elem = document.getElementById("count");
	elem.parentNode.removeChild(elem);
 	d.getElementById('sum').style.visibility = 'visible';
 	d.getElementById('recount').style.visibility = 'visible';
}