import java.util { List }
import javax.enterprise.context { requestScoped }
import javax.inject { inject }
import javax.ws.rs { ... }
import sessions.entity { ... }

inject
requestScoped
path("sessions")
shared class SessionResource(SessionProvider sp) {
  
  get
  produces({"application/json"})
  shared default List<Session> list() => sp.list();
  
  get
  path("rooms/{room}")
  produces({"application/json"})
  shared default List<Session> listBy(pathParam("room") String room) => sp.listBy("room", room);

  get
  path("{id}")
  produces({"application/json"})
  shared default Session find(pathParam("id") Integer id) => sp.find(id);
}

inject
requestScoped
path("presenters")
shared class PresenterResource(PresenterProvider pp) {
  
  get
  produces({"application/json"})
  shared default List<Presenter> list() => pp.list();
  
  get
  path("{id}")
  produces({"application/json"})
  shared default Presenter find(pathParam("id") Integer id) => pp.find(id);
}
