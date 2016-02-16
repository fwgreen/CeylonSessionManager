import java.lang { Long }
import java.util { Date }
import javax.xml.bind.annotation { 
  XmlAccessType { field = \iFIELD },
  ... }
import javax.persistence { 
  id=id__FIELD, 
  generated=generatedValue__FIELD, 
  GenerationType { identity = \iIDENTITY },
  temporal = temporal__FIELD,
  TemporalType { timestamp = \iTIMESTAMP },
  table,
  ...}

entity
xmlAccessorType(field)
xmlRootElement
table{ name="\"Session\""; schema="public"; }
shared class Session(name, room, starting) {
  
  id generated { strategy = identity; }
  shared Long? id = null;
  shared variable String name;
  shared variable String room;
  temporal(timestamp)
  shared variable Date starting;
}

entity
xmlAccessorType(field)
xmlRootElement
table{ name="\"Presenter\""; schema="public"; }
shared class Presenter(name, telephone, email) {
  
  id generated { strategy = identity; }
  shared Long? id = null;
  shared variable String name;
  shared variable String telephone;
  shared variable String email;
}
