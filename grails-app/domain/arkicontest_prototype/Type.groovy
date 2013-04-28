package arkicontest_prototype

class Type {

    String name
    String description
    String icon

    static constraints = {
        name nullable: false, blank: false, unique: true
        icon nullable: false, blank: false
    }
}
