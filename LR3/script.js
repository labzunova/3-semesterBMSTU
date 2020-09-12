		function elementsOutput(Body, under){
			for(var x = Body.firstChild; x != null; x = x.nextSibling)
			{
				var s = x.outerHTML+'';
				if ((s != 'undefined')&&((under.indexOf(s)==-1)||(under=='start'))) 
					{ console.log(s);
						var elem = document.getElementById('fillingDiv');
						var tab = '';

						while(s.indexOf('\n')!=-1){ // carriage return
							 var N = s.indexOf('\n');
							 var str = s.slice(0,N);
							 var tab = '';

							while(str.indexOf('\t')!=-1){ // tabulation
								tab = tab + '\u00A0';
								str = str.slice(s.indexOf('\t')+1);
							}

							 text = document.createElement('h5');
    						 text.textContent = tab+str;
  					   		 elem.appendChild(text);
  					   		 s = s.slice(N+1);
						}
   						var text = document.createElement('h5');
    					text.textContent = s;
  					    elem.appendChild(text);
					}
				if (x.firstChild != null){
					var y = x;
					elementsOutput(y, x.outerHTML+'');
				};
			}
		}