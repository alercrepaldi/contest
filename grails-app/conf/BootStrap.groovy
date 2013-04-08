import javax.management.relation.Role;

import java.util.Date;

import arkicontest_prototype.ContestPartecipation
import arkicontest_prototype.User
import arkicontest_prototype.Role
import arkicontest_prototype.UserRole
import arkicontest_prototype.Contest

class BootStrap {

	def init = { servletContext ->

		// Create Role and Users

		createRole(Role.DESIGNER)
		createRole(Role.CREATOR)

		createUser('aler', 'aler', 'aler.crepaldi@gmail.com', [Role.DESIGNER])
		
		createUser('francesco', 'francesco', 'aler.crepaldi@gmail.com', [Role.DESIGNER])
		createUser('marco', 'marco', 'aler.crepaldi@gmail.com', [Role.DESIGNER])
		createUser('andrea', 'andrea', 'aler.crepaldi@gmail.com', [Role.DESIGNER])
		
		createUser('paolo', 'paolo', 'info@studiogollo.com', [Role.CREATOR])
		
		createUser('giulio', 'giulio', 'info@studiogollo.com', [Role.CREATOR])
		createUser('mario', 'mario', 'info@studiogollo.com', [Role.CREATOR])
		createUser('roberto', 'roberto', 'info@studiogollo.com', [Role.CREATOR])
				
		createUser('admin', 'admin', 'aler.crepaldi@gmail.com', [Role.DESIGNER, Role.CREATOR])

		// Create some contests

		User Paolo = User.findByUsername('paolo')
		User Giulio = User.findByUsername('giulio')

		createContest(Paolo, 'Progettare un armadio', new Date(), 120, Contest.HOUSE)
		createContest(Paolo, 'Progettare una sedia', new Date()-2, 80, Contest.HOUSE)
		createContest(Giulio, 'Gazebo estivo', new Date()-5, 250, Contest.GARDEN)
		createContest(Paolo, 'Stanza da letto bimbi', new Date(), 500, Contest.IN_DOOR)
		createContest(Giulio, 'Siepe giardino fronte strada', new Date(), 220, Contest.GARDEN)
		
		// Add designers to contests
		
	    List<Contest> gardenContests = Contest.findAllByType(Contest.GARDEN)
		List<User> gardenContestPartecipants = [User.findByUsername('aler'), 
												User.findByUsername('marco'),
												User.findByUsername('andrea')]
		
		gardenContests.each {addPartecipants(it, gardenContestPartecipants)}
		
		List<Contest> houseContests = Contest.findAllByType(Contest.HOUSE)
		List<User> houseContestPartecipants = [User.findByUsername('marco'),
												User.findByUsername('roberto')]
		
		houseContests.each {addPartecipants(it, houseContestPartecipants)}
		
		List<Contest> inDoorContests = Contest.findAllByType(Contest.IN_DOOR)
		List<User> inDoorContestPartecipants = [User.findByUsername('aler'),
												User.findByUsername('mario')]
		
		inDoorContests.each {addPartecipants(it, inDoorContestPartecipants)}
		
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

	private createContest(User creator, String title, Date dateCreation, Integer reward, String type) {
		print "creating new contest: ${title}"

		new Contest(creator: creator,
					title : title,
					dateCreation: dateCreation,
					reward:reward,
					type: type).save(failOnError:true, flush:true)

	}
	
	private addPartecipants(Contest contest, List<User> partecipants) {
		partecipants.each {
			print "adding ${it.username} to the ${contest.title} contest ..."
			ContestPartecipation partecipation = new ContestPartecipation (designer : it, 
																		   partecipationStart: new Date())
			
			partecipation.save(flush:true, failOnError:true)
			
			contest.addToPartecipations(partecipation)
		
		}
	}
}
