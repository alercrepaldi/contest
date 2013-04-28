package arkicontest_prototype

class Contest {
	
	static final String IN_DOOR = 'IN_DOOR'
	static final String GARDEN = 'GARDEN'
	static final String HOUSE = 'HOUSE'

	String title
	Date dateCreation
    Date dueDate
	Float reward
	Type type

	static belongsTo = [creator: User]
	static hasMany = [partecipations: ContestPartecipation]

	static constraints = {
		title blank:false, size:5..100
		type nullable: false
        dueDate validator: {val, obj -> val > obj.dateCreation}
	}

    static List<String> getTypes () {
        [IN_DOOR, HOUSE, GARDEN]
    }

}