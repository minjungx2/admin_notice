var service = (function() {
  
   function list(){
   
		return fetch("/notice/",{
                method : 'get'
        }).then(res => res.json())
	}
	
	function read(nno){
	
		console.log(nno)
	
		return fetch("/notice/"+nno,{
                method : 'get'
        }).then(res => res.json())
	
	}

        return {list:list, read:read}

    }())