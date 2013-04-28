package arkicontest_prototype

import grails.plugins.springsecurity.SpringSecurityService
import org.springframework.dao.DataIntegrityViolationException

class ContestController {

    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contestInstanceList: Contest.list(params), contestInstanceTotal: Contest.count()]
    }

    def create() {
        [contestInstance: new Contest(params)]
    }

    def save() {

        def data = [:]

        // retrieve the data from the view

        data = params

        // the contest is created by the loggedIn user with date creation = today
        data['creator'] = springSecurityService.currentUser
        data['type'] = Type.get(params.type)

        params['dateCreation'] = new Date()

        def contestInstance = new Contest(data)
        if (!contestInstance.save(flush: true)) {
            render(view: "create", model: [contestInstance: contestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contest.label', default: 'Contest'), contestInstance.id])
        redirect(action: "show", id: contestInstance.id)
    }

    def show(Long id) {
        def contestInstance = Contest.get(id)
        if (!contestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contest.label', default: 'Contest'), id])
            redirect(action: "list")
            return
        }

        [contestInstance: contestInstance]
    }

    def edit(Long id) {
        def contestInstance = Contest.get(id)
        if (!contestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contest.label', default: 'Contest'), id])
            redirect(action: "list")
            return
        }

        [contestInstance: contestInstance]
    }

    def update(Long id, Long version) {
        def contestInstance = Contest.get(id)
        if (!contestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contest.label', default: 'Contest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contestInstance.version > version) {
                contestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contest.label', default: 'Contest')] as Object[],
                          "Another user has updated this Contest while you were editing")
                render(view: "edit", model: [contestInstance: contestInstance])
                return
            }
        }

        contestInstance.properties = params

        if (!contestInstance.save(flush: true)) {
            render(view: "edit", model: [contestInstance: contestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contest.label', default: 'Contest'), contestInstance.id])
        redirect(action: "show", id: contestInstance.id)
    }

    def delete(Long id) {
        def contestInstance = Contest.get(id)
        if (!contestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contest.label', default: 'Contest'), id])
            redirect(action: "list")
            return
        }

        try {
            contestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contest.label', default: 'Contest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contest.label', default: 'Contest'), id])
            redirect(action: "show", id: id)
        }
    }
}
