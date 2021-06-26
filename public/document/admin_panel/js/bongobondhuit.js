function _(x) {
	if(x.search('#')>-1){
		return document.querySelector(x);
	}
	if(x.search('.')>-1){
		x = document.querySelectorAll(x);
		if(x.length == 1){
			return x[0];
		}else{
			return x;
		}
	}

	if(x.search('.')==-1 || x.search('#')==-1){
		x = document.querySelectorAll(x);
		if(x.length == 1){
			return x[0];
		}else{
			return x;
		}
	}
}



/*convert an array to object start-----------------*/
let arrayToObject = function(arrays){
	/*this method return an object*/
	return Object.assign({},arrays);
}
/*convert an array to object end--------------------*/




/*convert an array to object start-----------------*/
let objectToArray = function(objects){
	/*this method return an arry with only object's value*/
	return Object.values(objects);
}
/*convert an array to object end--------------------*/


/*get object key start-----------------*/
let getObjectKey = function(objects){
	/*this method return an arry with only object's key*/
	return Object.keys(objects);
}
/*get object key end--------------------*/



/*convert an string to array start-----------------*/
let stringToArray = function(separator,string){
	/*this method return an array*/
	return string.split(separator);
}
/*convert an string to array end--------------------*/



/*convert an array to string start-----------------*/
let arrayToString = function(array){
	/*this method return an string*/
	let string = array.toString().replace(/,/g,' ')
	return string;
}
/*convert an array to string end--------------------*/





/*convert an string to object start-----------------*/
let stringToObject = function(separator=null,string=null){
	if(separator === null || string === null){
		return "You must have 2 arguments in: stringToObject('separator','string');"; 
	}else{
		/*convert string to array*/
		let array = string.split(separator);
		/*convert array to object*/
		let obj   = Object.assign({},array);

		/*this method return an object*/
		return obj;
	}
}
/*convert an string to object end--------------------*/


/*convert an object to string start-----------------*/
let objectToString = function(object){
	let array = objectToArray(object);
	/*this string created by only object's value*/
	let string = arrayToString(array);
	return string;
}
/*convert an object to string end-----------------*/





/*uppercase start-----------------*/
let upperCase = function(string){
	/*this method return an array*/
	return string.toUpperCase(string);
}
/*uppercase end--------------------*/


/*lowerCase start-----------------*/
let lowerCase = function(string){
	/*this method return an array*/
	return string.toLowerCase(string);
}
/*lowerCase end--------------------*/



/*capitalize start------------------------------------------*/
let capitalize = function(string){
	let wordArray = stringToArray(' ',string.toLowerCase()),
		wordLength=wordArray.length,
		index     = 0,
		newArray  = [];

	for(index; index<wordLength; index++){
		let firstLatter = wordArray[index][0].toUpperCase();
		newArray.push(wordArray[index].replace(wordArray[index][0],firstLatter));
	}
	let newString = newArray.toString().replace(/,/g,' ');
	return newString;
}
/*capitalize end------------------------------------------*/




function element(){
	/*getting element start---------------------------------------------------------------*/
	this.elem 		= [];
	this.getElement = function(element = null){
		if(element !== null){
			let elemListAsObj = stringToObject(",",element);
			let elemArray     = [];

			for(j in elemListAsObj){
				if(elemListAsObj[j].search('#')>-1){
					elemArray.push(document.querySelector(elemListAsObj[j]));
				}else{
					if(elemListAsObj[j].search('.')>-1){
						elemArray.push(document.querySelectorAll(elemListAsObj[j]));
					}else{
						if(elemListAsObj[j].search('.') == -1 || element.search('#') == -1){
							elemArray.push(document.querySelectorAll(elemListAsObj[j]));
						}
					}
				}
			}

			/*push element to elem array*/
			this.elem = elemArray;
			if(this.elem[0].length === 0){
				return false;
			}
			return this;
		}else{
			console.log("You Don't Pass Any Value to '$()' ");
		}
	}
	/*getting element end---------------------------------------------------------------------*/





	/*count total element start----------------------------------------------------------------*/
	this.length = function(){
		let elemArrayLength = this.elem.length,
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				lengthList.push(this.elem[index].length);
			}
			return lengthList;
		}else{
			return this.elem.length;
		}
	}
	/*count total element end------------------------------------------------------------------*/






	/*add class start---------------------------------------------------------------------------*/
	this.addClass = function(className){
		let elemArrayLength = this.elem.length,
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];
				if(elem_list.length === 1){
					elem_list[0].classList.add(className);
				}
				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						elem_list[elemIndex].classList.add(className);
					}
				}
			}
		}else{
			if(this.elem.length === 1){
				this.elem.classList.add(className);
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					this.elem[elemIndex].classList.add(className);
				}
			}
		}
		return this;
	}
	/*add class end---------------------------------------------------------------------------*/





	/*remove class start---------------------------------------------------------------------------*/
	this.removeClass = function(className){
		let elemArrayLength = this.elem.length,
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];

				if(elem_list.length === 1){
					elem_list[0].classList.remove(className);
				}

				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						elem_list[elemIndex].classList.remove(className);
					}
				}
			}
		}else{
			if(this.elem.length === 1){
				this.elem.classList.remove(className);
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					this.elem[elemIndex].classList.remove(className);
				}
			}
		}
		return this;
	}
	/*remove class end---------------------------------------------------------------------------*/





	/*toggle class start---------------------------------------------------------------------------*/
	this.toggleClass = function(className){
		let elemArrayLength = this.elem.length,
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];

				if(elem_list.length === 1){
					elem_list[0].classList.toggle(className);
				}

				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						elem_list[elemIndex].classList.toggle(className);
					}
				}
			}
		}else{
			if(this.elem.length === 1){
				this.elem.classList.toggle(className);
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					this.elem[elemIndex].classList.toggle(className);
				}
			}
		}
		return this;
	}
	/*toggle class end---------------------------------------------------------------------------*/





	/*contains class start---------------------------------------------------------------------------*/
	this.containsClass = function(className){
		let elemArrayLength = this.elem.length,
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];

				if(elem_list.length === 1){
					if(elem_list[0].classList.contains(className)==false){
						return false;
					}
				}

				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						if(elem_list[elemIndex].classList.contains(className)==false){
							return false;
						}
					}
				}
			}
		}else{
			if(this.elem.length === 1){
				if(this.elem.classList.contains(className)==false){
					return false;
				}
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					if(this.elem[elemIndex].classList.contains(className)==false){
						return false;
					}
				}
			}
		}
		return this;
	}
	/*contains class end---------------------------------------------------------------------------*/
	






	/*html class start---------------------------------------------------------------------------*/
	this.html = function(string=null){		
		let elemArrayLength = this.elem.length,
			htmlValue		= [],
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];
				if(elem_list.length === 1){
					if(string === null){
						htmlValue.push(elem_list[0].innerHTML);
					}else{
						elem_list[0].innerHTML = string;
					}
				}

				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						
						if(string === null){
							htmlValue.push(elem_list[elemIndex].innerHTML);
						}else{
							elem_list[elemIndex].innerHTML = string;
						}
					}
				}
			}
			if(string === null){return htmlValue;}
		}else{
			if(this.elem.length === 1){
				if(string === null){
					htmlValue.push(this.elem.innerHTML);
					return htmlValue;
				}else{
					this.elem.innerHTML = string;
				}
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					if(string === null){
						htmlValue.push(this.elem[elemIndex].innerHTML);
					}else{
						this.elem[elemIndex].innerHTML = string;
					}
				}
				if(string === null){return htmlValue;}
			}
		}
		return this;
	}
	/*html class end---------------------------------------------------------------------------*/
	
	






	/*css class start---------------------------------------------------------------------------*/
	this.css = function(cssObject=null){		
		let elemArrayLength = this.elem.length,
			cssValue		= [],
			index           = 0,
			lengthList      = [];


		/*if multi element passed then we need to pass multible length for multiple element */
		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];
				if(elem_list.length === 1){
					if(cssObject === null){
						cssValue.push(elem_list[0].style.cssText);
					}else{
						let cssString = '';
						for(x in cssObject){
							cssString += x+":"+cssObject[x]+";";
						}
						elem_list[0].style = cssString;
					}
				}

				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						
						if(cssObject === null){
							cssValue.push(elem_list[elemIndex].style.cssText);
						}else{
							let cssString = '';
							for(x in cssObject){
								cssString += x+":"+cssObject[x]+";";
							}
							elem_list[elemIndex].style = cssString;
						}
					}
				}
			}
			if(cssObject === null){return cssValue;}
		}else{
			if(this.elem.length === 1){
				if(cssObject === null){
					cssValue.push(this.elem.style.cssText);
					return cssValue;
				}else{
					let cssString = '';
					for(x in cssObject){
						cssString += x+":"+cssObject[x]+";";
					}
					this.elem.style = cssString;
				}
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					if(cssObject === null){
						cssValue.push(this.elem[elemIndex].style.cssText);
					}else{
						let cssString = '';
						for(x in cssObject){
							cssString += x+":"+cssObject[x]+";";
						}
						this.elem[elemIndex].style = cssString;
					}
				}
				if(cssObject === null){return cssValue;}
			}
		}
		return this;
	}
	/*css class end---------------------------------------------------------------------------*/
	






	/*event class start---------------------------------------------------------------------------*/
	this.event = function(eventName = null,functions = null,useCapture=false){
		if(eventName==null || functions==null){
			console.log('This Method Has 3 arguments ---event("eventName(without \'on\' prefix)","function","useCapture")---');
			return;
		}

		let elemArrayLength = this.elem.length;
		let index           = 0;

		/*if multi element passed then we need to pass multible length for multiple element */
		let lengthList      = [];

		if(Array.isArray(this.elem) === true){
			for(index; index<elemArrayLength; index++){
				var elem_list = this.elem[index];

				if(elem_list.length === 1){
					elem_list[0].addEventListener(eventName,functions,useCapture);
				}

				if(elem_list.length > 1){
					var elemIndex  = 0,
						elemLength = elem_list.length;
					for(elemIndex; elemIndex<elemLength; elemIndex++){
						elem_list[elemIndex].addEventListener(eventName,functions,useCapture);
					}
				}
			}
		}else{
			if(this.elem.length === 1){
				this.elem.addEventListener(eventName,functions,useCapture);
			}

			if(this.elem.length > 1){
				var elemIndex  = 0,
					elemLength = this.elem.length;
				for(elemIndex; elemIndex<elemLength; elemIndex++){
					this.elem[elemIndex].addEventListener(eventName,functions,useCapture);
				}
			}
		}
		return this;
	}
	/*event class end---------------------------------------------------------------------------*/


}
var $ = function(x){
	getElement = new element();
	return getElement.getElement(x);
};










/*out put by library---------------------------*/
/*get the multiple element element*/
// console.log($('div,input').elem);
// console.log($('div').elem);
// console.log($('div').length());
// console.log($('div.footer,input').length());
// console.log($('div.footer,input'));
// console.log($('div,input,a').addClass('active'));
// console.log($('div,input,a').removeClass('active'));
// console.log($('div,input,a').addClass('active').removeClass('active'));
// console.log($('div,input,a').toggleClass('active'));
// console.log($('div,input,a').addClass('active').length());

/*
	$('input').event('focus', me);
	function me(){console.log('Muhibbullah');}
*/
// $('.top_bar li.active').html()[0];
// $('.top_bar li.active').html('Muhibbullah Ansary').html();

/*$('input[type=email]').event('focus', function(){
	console.log('Hi How Are You?');
});*/


/*
	to push inline css 
	-----------------------------
	$('li.active').css({
		"background": "red",
		"font-size": "50px",
		"border":"4px solid red"
	});
*/

/*
	to get inline css property
	-----------------------------
	console.log($('li.active').css());
*/

/*
	let object = {
		"name":"Muhib",
		"age":"22 years",
		"address":"Mymensingh"
	}
	to get only objects key
	------------------------------
	console.log(getObjectKey(object));
*/

//arrayToObject(array);
//objectToArray(object);
//stringToArray(separator,string);
//stringToObject(separator,string);
//arrayToString(array);
//objectToString(object);

//capitalize(string);
//lowerCase(string);
//upperCase(string);