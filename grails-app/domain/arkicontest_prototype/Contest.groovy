package arkicontest_prototype

class Contest {
	
	static final String IN_DOOR = 'IN_DOOR'
	static final String GARDEN = 'GARDEN'
	static final String HOUSE = 'HOUSE'

	String title
	Date dateCreation
	Float reward
	String type

	static belongsTo = [creator: User]
	static hasMany = [partecipations: ContestPartecipation] 

	static constraints = {
		title blank:false, size:5..100
		type inList:[GARDEN, IN_DOOR, HOUSE]
	}

}