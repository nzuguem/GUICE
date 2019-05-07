# ce fichier doir etre partager au client et au serveur
# thrift -r -out ../java/ --gen java cross-platform-service.thrift :
# pour la géneration des classes en java 
namespace cpp com.baeldung.thrift.impl #ici permet de definir le package pour c++
namespace java fr.nzuguem.apacheThrift.generated #ici permet de definir le package pour Java

# Les exceptions sont équivalentes aux structure (struct) 
# c'est une classe d'éxception 
exception InvalidOperationException {
    1: i32 code, # Entier signé sur 32 bits
    2: string description # une chaine de texte codée à l'aide du codage UTF-8
}

# Les structures Thrift sont l'équivalent des classes dans les langages POO mais sans héritage
# Les champs peuvent avoir diverses annotations (ID de champs numériques (1:), valeurs par défaut facultatives, etc.)
struct CrossPlatformResource {
    1: i32 id, # Entier signé sur 32 bits
    2: string name, # une chaine de texte codée à l'aide du codage UTF-8
    3: optional string salutation # type optionnel de Java 8
}

# Les services sont en réalité des interfaces de communication définies à l'aide de types Thrift
# équivalent à la notion d'interface en Java
# elle doit etre implémenté par le programme serveur
service CrossPlatformService {

    # Cette méthode pourra lever une exeption de type InvalidOperationException
    CrossPlatformResource get(1:i32 id) throws (1:InvalidOperationException e),

    void save(1:CrossPlatformResource resource) throws (1:InvalidOperationException e),

    # ici elle renvoi un type conteneur ( list - une liste ordonnée d'éléments )
     list <CrossPlatformResource> getList() throws (1:InvalidOperationException e),

    # ici on renvoi un type booléen (true ou false)
    bool ping() throws (1:InvalidOperationException e)
}
