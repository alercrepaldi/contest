import arkicontest_prototype.Type

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

        // Create some types

        Type garden = createType('garden', '', 'garden-icon.png')
        Type house = createType('house', '', 'exterior-icon.png')
        Type in_door = createType('in_door', '',  'interior-icon.png')

		// Create some contests

		User Paolo = User.findByUsername('paolo')
		User Giulio = User.findByUsername('giulio')

		createContest(Paolo, 'Progettare un armadio', new Date(), new Date() + 7, 120, house)
		createContest(Paolo, 'Progettare una sedia', new Date()-2, new Date()-2 + 7,  80, house)
		createContest(Giulio, 'Gazebo estivo', new Date()-5, new Date() + 7, 250, garden)
		createContest(Paolo, 'Stanza da letto bimbi', new Date(), new Date() + 7, 500, in_door)
		createContest(Giulio, 'Siepe giardino fronte strada', new Date(), new Date() + 7, 220, garden)
		
		// Add designers to contests

	    List<Contest> gardenContests = Contest.findAllByType(garden)
		List<User> gardenContestPartecipants = [User.findByUsername('aler'), 
												User.findByUsername('marco'),
												User.findByUsername('andrea')]
		
		gardenContests.each {addPartecipants(it, gardenContestPartecipants)}
		
		List<Contest> houseContests = Contest.findAllByType(house)
		List<User> houseContestPartecipants = [User.findByUsername('marco'),
												User.findByUsername('roberto')]
		
		houseContests.each {addPartecipants(it, houseContestPartecipants)}
		
		List<Contest> inDoorContests = Contest.findAllByType(in_door)
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

    private createType(String name, String description, String icon) {
        new Type(name: name,
                    icon: icon,
                    description: description).save(failOnError: true, flush: true)
    }

	private createContest(User creator, String title, Date dateCreation, Date dueDate, Integer reward, Type type) {
		print "creating new contest: ${title}"

		new Contest(creator: creator,
					title : title,
					dateCreation: dateCreation,
                    dueDate: dueDate,
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
