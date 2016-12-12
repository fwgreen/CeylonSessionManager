import java.lang { Long }
import java.util { Date }
import javax.xml.bind.annotation { 
  XmlAccessType { field = \iFIELD },
  ... }
import javax.persistence { 
  generated=generatedValue, 
  GenerationType { identity = \iIDENTITY },
  temporal,
  TemporalType { timestamp = \iTIMESTAMP }
  ...}

entity
xmlAccessorType(field)
xmlRootElement
table{ name="\"speaker_session\""; schema="public"; }
shared class Session(name, room, starting) {
  
  id generated { strategy = identity; }
  shared late Long id;
  shared variable String name;
  shared variable String room;
  temporal(timestamp)
  shared variable Date starting;
}

entity
xmlAccessorType(field)
xmlRootElement
table{ name="\"presenter\""; schema="public"; }
shared class Presenter(name, telephone, email) {
  
  id generated { strategy = identity; }
  shared late Long id;
  shared variable String name;
  shared variable String telephone;
  shared variable String email;
}
