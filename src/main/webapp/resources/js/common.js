/**
 * 
 */
	function isNull(){
		var searchItem = document.getElementsByName("searchItem")[0].value.replace(/ /gi,''); 
		//g : 발생할 모든 pattern에 대한 전역 검색, i : 대/소문자 구분 안함 
		//그냥 replace하면 첫번째만 변경됨. 
		if(searchItem == ""){
			alert("검색어를 입력해주세요.");
			return false;
		}
		return true;
	}
	

	
	
