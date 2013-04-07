package arkicontest_prototype

class Contest {
		
	String title
	Date dateCreation
	Float reward
	String type
	
    static constraints = {
		title(blank:false, size:5..100)
		reward range:0..10000 
		type inList:['garden', 'inDoor'] 
    }
	
}