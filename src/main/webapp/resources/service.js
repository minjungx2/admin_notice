/**
 * 
 */
 var service = (function() {
  
   function list(){
   
		return fetch("/notice/list",{
                method : 'get',
        }).then(res => res.json())
	}

        return {list:list}

    }())