package arkicontest_prototype

class Contest {

	String title
	Date dateCreation
	Float reward
	String type

	static belongsTo = [creator:Creator]
	static hasMany = [partecipations : ContestPartecipation] 

	static constraints = {
		title blank:false,
		size:5..100
		type inList:['garden', 'inDoor']
	}

}