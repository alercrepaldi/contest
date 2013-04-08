package arkicontest_prototype

class Role {

	static final String DESIGNER = 'ROLE_DESIGNER'
	static final String CREATOR = 'ROLE_CREATOR'
	
	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
