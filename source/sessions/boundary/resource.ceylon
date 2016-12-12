import java.util { List }
import javax.enterprise.context { requestScoped }
import javax.inject { inject }
import javax.ws.rs { ... }
import sessions.entity { ... }


requestScoped
path("sessions")
shared class SessionResource() {
  
  inject late SessionProvider sp;
  
  get
  produces({"application/json"})
  shared List<Session> list() => sp.list();
  
  get
  path("rooms/{room}")
  produces({"application/json"})
  shared List<Session> listBy(pathParam("room") String room) => sp.listBy("room", room);

  get
  path("{id}")
  produces({"application/json"})
  shared Session find(pathParam("id") Integer id) => sp.find(id);
}

requestScoped
path("presenters")
shared class PresenterResource() {
  
  inject late PresenterProvider pp;
  
  get
  produces({"application/json"})
  shared List<Presenter> list() => pp.list();
  
  get
  path("{id}")
  produces({"application/json"})
  shared Presenter find(pathParam("id") Integer id) => pp.find(id);
}
