import java.util { List }
import javax.enterprise.context { requestScoped }
import javax.inject { inject }

import sessions.entity { ... }

inject
requestScoped
shared class SessionProvider(SessionRepository repo) {
  
  shared Session find(Integer id) => repo.find(id);
  shared List<Session> list() => repo.list();
  shared List<Session> listBy(String column, String item) => repo.listBy(column, item);
}

inject
requestScoped
shared class PresenterProvider(PresenterRepository repo) {
  
  shared Presenter find(Integer id) => repo.find(id);
  shared List<Presenter> list() => repo.list();
}
