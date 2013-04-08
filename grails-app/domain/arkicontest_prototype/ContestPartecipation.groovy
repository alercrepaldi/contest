package arkicontest_prototype

class ContestPartecipation {
	
	static belongsTo = [contest : Contest]  
	User designer
	Date partecipationStart
	
	Integer rate
	Integer results 

    static constraints = {
    }
}
