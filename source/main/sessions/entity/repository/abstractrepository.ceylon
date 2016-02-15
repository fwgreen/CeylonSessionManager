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
    CriteriaBuilder cb = em.criteriaBuilder;
    CriteriaQuery<E> cq = cb.createQuery(javaClass<E>());
    Root<E> root = cq.from(javaClass<E>());
    cq.select(root);
    cq.where(cb.equal(root.get(column), item));
    return em.createQuery(cq).singleResult;
  }
  
  shared default List<E> list() {
    CriteriaQuery<E> cq = em.criteriaBuilder.createQuery(javaClass<E>());
    cq.select(cq.from(javaClass<E>()));
    return em.createQuery(cq).resultList;
  }
  
  shared default List<E> listBy(String column, String item) {
    CriteriaBuilder cb = em.criteriaBuilder;
    CriteriaQuery<E> cq = cb.createQuery(javaClass<E>());
    Root<E> root = cq.from(javaClass<E>());
    cq.select(root);
    cq.where(cb.equal(root.get(column), item));
    return em.createQuery(cq).resultList;
  }
}
