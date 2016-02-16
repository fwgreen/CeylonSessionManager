import javax.ejb { stateless }
import sessions.entity { Session, Presenter }

stateless
shared class SessionRepository() extends AbstractRepository<Session>() {}

stateless
shared class PresenterRepository() extends AbstractRepository<Presenter>() {}
