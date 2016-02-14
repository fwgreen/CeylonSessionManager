import java.util { List }
import javax.enterprise.inject { model }
import javax.inject { inject }
import main.sessions.entity { ... }
import main.sessions.boundary { ... }

inject
model
shared class Index(SessionProvider sp, PresenterProvider pp) {
  
  shared List<Session> sessions = sp.list();
  shared List<Presenter> presenters = pp.list();
}
