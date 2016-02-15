import javax.enterprise.inject { produces=produces__FIELD }
import javax.persistence { persistence=persistenceContext__FIELD, EntityManager }

class EntityManagerProducer(em) {
  
  produces
  persistence
  EntityManager em;
}
