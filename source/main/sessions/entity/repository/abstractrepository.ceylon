import ceylon.interop.java { ... }

import java.lang { Long }
import java.util { List }

import javax.persistence { EntityManager }
import javax.persistence.criteria { CriteriaBuilder, CriteriaQuery, Root }

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
