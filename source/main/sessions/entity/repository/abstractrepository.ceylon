import ceylon.interop.java { ... }

import java.lang { Long }
import java.util { List }

import javax.persistence { persistence=persistenceContext__FIELD, EntityManager }
import javax.persistence.criteria { CriteriaBuilder, CriteriaQuery, Root }

shared abstract class AbstractRepository<E>() given E satisfies Object {
  
  persistence late EntityManager em;

  shared default void save(E entity) => em.persist(entity);
  
  shared default void delete(E entity) => em.remove(entity);
  
  shared default void update(E entity) => em.merge(entity);
  
  shared default E find(Integer id) => em.find(javaClass<E>(), Long(id));
  
  shared default E findBy(String column, String item){
    value query = "SELECT e FROM ``className`` e WHERE e.``column`` = :item";
    return em.createQuery(query, javaClass<E>()).setParameter("item", javaString(item)).singleResult;
  }
  
  shared default List<E> list() {
    value query = "SELECT e FROM ``className`` e";
    return em.createQuery(query, javaClass<E>()).resultList;
  }
  
  shared default List<E> listBy(String column, String item) {
    value query = "SELECT e FROM ``className`` e WHERE e.``column`` = :item";
    return em.createQuery(query, javaClass<E>()).setParameter("item", javaString(item)).resultList;
  }
  
  String className => javaClass<E>().name.split('.'.equals).last;
}
