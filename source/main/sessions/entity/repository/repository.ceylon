import javax.ejb { stateless }
import main.sessions.entity { Session, Presenter }

stateless
shared class SessionRepository() extends AbstractRepository<Session>() {}

stateless
shared class PresenterRepository() extends AbstractRepository<Presenter>() {}
