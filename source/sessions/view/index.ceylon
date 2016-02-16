import java.util { List }
import javax.enterprise.inject { model }
import javax.inject { inject }
import sessions.entity { ... }
import sessions.boundary { ... }

inject
model
shared class Index(SessionProvider sp, PresenterProvider pp) {
  
  shared List<Session> sessions = sp.list();
  shared List<Presenter> presenters = pp.list();
}
