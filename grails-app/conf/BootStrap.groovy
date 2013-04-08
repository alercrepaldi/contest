import javax.management.relation.Role;

import arkicontest_prototype.User
import arkicontest_prototype.Role
import arkicontest_prototype.UserRole

class BootStrap {
	
    def init = { servletContext ->
		
		// Create Role and Users
		
		createRole(Role.DESIGNER)
		createRole(Role.CREATOR)
				
		createUser('aler', 'aler', 'aler.crepaldi@gmail.com', [Role.DESIGNER])
		createUser('paolo', 'paolo', 'info@studiogollo.com', [Role.CREATOR])
		createUser('admin', 'admin', 'aler.crepaldi@gmail.com', [Role.DESIGNER, Role.CREATOR])
		
    }
    
	private createRole(String authority){
		print "creating role ${authority} ... "
		if (Role.countByAuthority(authority) == 0) {
			new Role(authority: authority).save(failOnError: true, flush: true)
		}
	}
	
	private createUser(String username, String password, String email, List<String> authorities) {
		print "creating user ${username} with authorities: ${authorities} ... "
		if (User.countByUsername(username) == 0) {
			User user = new User(username: username, password: password, email: email, enabled: true)	
			user.save(flush:true, failOnError: true)
			authorities.each {
				new UserRole (user: user, role: Role.findByAuthority(it))
			}
		}
	}
}
