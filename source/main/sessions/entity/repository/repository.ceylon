import javax.ejb { stateless }
import javax.inject { inject }
import javax.persistence { EntityManager }
import main.sessions.entity { Session, Presenter }

inject
stateless
shared class SessionRepository(EntityManager em) extends AbstractRepository<Session>() {
  
  shared default actual EntityManager getEntityManager() => em;
}

inject
stateless
shared class PresenterRepository(EntityManager em) extends AbstractRepository<Presenter>() {
  
  shared default actual EntityManager getEntityManager() => em;
}
