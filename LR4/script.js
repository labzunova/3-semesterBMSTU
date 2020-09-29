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
    var table = d.getElementById('catalog').getElementsByTagName('TBODY')[0];

    if (name == '') alert('Введите наименование!') 
    	else if (price == '') alert('Введите цену!');
    	if (!isNaN(price)) {
    			var row = d.createElement("TR");
    			table.appendChild(row);

    			var imgTD = d.createElement("TD");
    			var nameTD = d.createElement("TD");
   	 			var priceTD = d.createElement("TD");
                var addTD = d.createElement("TD");
    			row.appendChild(imgTD);
    			row.appendChild(nameTD);
   				row.appendChild(priceTD);
                row.appendChild(addTD);
                row.font =  "'Montserrat', sans-serif";


    			imgTD.innerHTML = '<img src="customOleg.jpg" width=100px alt="custom Oleg">';
    			nameTD.innerHTML = name;
    			priceTD.innerHTML = price;
                addTD.innerHTML = '<img src="plus.png" alt="+">';
                row.children[3].onclick = function()
                    {
                        add(name,price,'customOleg.jpg');
                    }


   				d.getElementById('cartIsEmpty').style.display = 'none';
                d.getElementById('count').style.visibility = 'visible';
			} else alert('Цена должна быть числом!');  
}

function count() {
	var sum = 0;
	var table = d.getElementById('cart');

    for (var i = 1; i < table.rows.length; i++) {
      sum += parseFloat(table.rows[i].cells[2].innerHTML);
	} 
	d.getElementById('sum').innerHTML = 'Сумма: '+ sum; 
    
	var elem = document.getElementById("count");
	elem.parentNode.removeChild(elem);
 	d.getElementById('sum').style.visibility = 'visible';
 	d.getElementById('recount').style.visibility = 'visible';
}