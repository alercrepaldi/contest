package arkicontest_prototype

import java.util.Date;

class Designer {
	
	String name
	String surname
	Date bornDate
	String personalUrl
	
	static hasMany = [contestPartecipations : ContestPartecipation]
	 
    static constraints = {
    }
}
