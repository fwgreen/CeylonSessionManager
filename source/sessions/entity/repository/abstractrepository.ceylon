import ceylon.interop.java { ... }

import java.lang { Long }
import java.util { List }

import javax.persistence { persistence=persistenceContext__FIELD, EntityManager }

shared abstract class AbstractRepository<E>() given E satisfies Object {
  
  persistence late variable EntityManager em;

  shared void save(E entity) => em.persist(entity);
  
  shared void delete(E entity) => em.remove(entity);
  
  shared void update(E entity) => em.merge(entity);
  
  shared E? find(Integer id) => em.find(javaClass<E>(), Long(id));
  
  shared E? findBy(String column, String item){
    value cb = em.criteriaBuilder;
    value cq = cb.createQuery(javaClass<E>());
    value root = cq.from(javaClass<E>());
    cq.select(root);
    cq.where(cb.equal(root.get(column), item));
    return em.createQuery(cq).singleResult;
  }
  
  shared List<E> list() {
    value cq = em.criteriaBuilder.createQuery(javaClass<E>());
    cq.select(cq.from(javaClass<E>()));
    return em.createQuery(cq).resultList;
  }
  
  shared List<E> listBy(String column, String item) {
    value cb = em.criteriaBuilder;
    value cq = cb.createQuery(javaClass<E>());
    value root = cq.from(javaClass<E>());
    cq.select(root);
    cq.where(cb.equal(root.get(column), item));
    return em.createQuery(cq).resultList;
  }
}
