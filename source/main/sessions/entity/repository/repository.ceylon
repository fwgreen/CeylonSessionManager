import javax.ejb { stateless }
import main.sessions.entity { Session, Presenter }

inject
stateless
shared class SessionRepository() extends AbstractRepository<Session>() {}

inject
stateless
shared class PresenterRepository() extends AbstractRepository<Presenter>() {}
