import java.util { List }
import javax.enterprise.context { requestScoped }
import javax.inject { inject }

import main.sessions.entity { ... }

inject
requestScoped
shared class SessionProvider(SessionRepository repo) {
  
  shared default Session find(Integer id) => repo.find(id);
  shared default List<Session> list() => repo.list();
  shared default void create(Session session) => repo.save(session);
}

inject
requestScoped
shared class PresenterProvider(PresenterRepository repo) {
  
  shared default Presenter find(Integer id) => repo.find(id);
  shared default List<Presenter> list() => repo.list();
  shared default void create(Presenter presenter) => repo.save(presenter);
}
