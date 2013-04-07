package arkicontest_prototype

class ContestPartecipation {
	
	static belongsTo = [contest : Contest]  
	Designer designer
	Date partecipationStart
	
	Integer rate
	Integer results 

    static constraints = {
    }
}
