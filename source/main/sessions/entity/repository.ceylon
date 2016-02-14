import ceylon.interop.java { ... }
import java.lang { Long }
import java.util { List }
import javax.enterprise.inject { produces=produces__FIELD }
import javax.ejb { stateless }
import javax.inject { inject }
import javax.persistence { persistence=persistenceContext__FIELD,... }
import javax.persistence.criteria { ... }

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

shared abstract class AbstractRepository<E>() given E satisfies Object {

  shared formal EntityManager getEntityManager();
  
  shared default E find(Integer id) => let (em = getEntityManager()) em.find(javaClass<E>(), Long(id));
  
  shared default E findBy(String column, String item){
    value em = getEntityManager();
    CriteriaBuilder cb = em.criteriaBuilder;
    CriteriaQuery<E> cq = cb.createQuery(javaClass<E>());
    Root<E> root = cq.from(javaClass<E>());
    cq.select(root);
    cq.where(cb.equal(root.get(column), item));
    return em.createQuery(cq).singleResult;
  }
  
  shared default List<E> list() {
    value em = getEntityManager();
    CriteriaQuery<E> cq = em.criteriaBuilder.createQuery(javaClass<E>());
    cq.select(cq.from(javaClass<E>()));
    return em.createQuery(cq).resultList;
  }
  
  shared default List<E> listBy(String column, String item) {
    value em = getEntityManager();
    CriteriaBuilder cb = em.criteriaBuilder;
    CriteriaQuery<E> cq = cb.createQuery(javaClass<E>());
    Root<E> root = cq.from(javaClass<E>());
    cq.select(root);
    cq.where(cb.equal(root.get(column), item));
    return em.createQuery(cq).resultList;
  }
  
  shared default Anything save(E entity) => let (em = getEntityManager()) em.persist(entity);
}

class EntityManagerProducer(em) {
  
  produces
  persistence
  EntityManager em;
}
