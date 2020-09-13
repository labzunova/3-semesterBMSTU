function elementsOutput(Body, under){
	for(var x = Body.firstChild; x != null; x = x.nextSibling) {
		var s = x.outerHTML+'';
		if ((s != 'undefined')&&((under.indexOf(s)==-1)||(under=='start'))) 
			{ console.log(s);
				var elem = document.getElementById('fillingDiv');
				text = document.createElement('pre');
    			text.textContent = s;
  				elem.appendChild(text); }
		if (x.firstChild != null) {
			var y = x;
				elementsOutput(y, x.outerHTML+'');
		};
	}
}