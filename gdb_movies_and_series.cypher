//Desafio de Projeto 1
//Este código cria os nós (14/01/2026)
// cria os usuários
CREATE (:User {name:'Meg'});
CREATE (:User {name:'Rosi'});
CREATE (:User {name:'Sérgio'});
CREATE (:User {name:'Dani'});
CREATE (:User {name:'Dan'});
CREATE (:User {name:'Sid'});
CREATE (:User {name:'Lê'});
CREATE (:User {name:'Vini'});
CREATE (:User {name:'Lia'});
CREATE (:User {name:'Paty'});

//Cria filmes e séries
CREATE (:Movie {title:'Star Wars 77'});
CREATE (:Movie {title:'Tropa de Elite'});
CREATE (:Movie {title:'All The Presidents Men'});
CREATE (:Movie {title:'Fahrenheit, 11 de Setembro'});
CREATE (:Movie {title:'Ainda Estou Aqui'});
CREATE (:Movie {title:'O Agente Secreto'});

CREATE (:Serie {title:'Star Trek 60s'});
CREATE (:Serie {title:'Dias Perfeitos'});
CREATE (:Serie {title:'Tremembé'});
CREATE (:Serie {title:'The Chosen'});

//Cria atores e diretores
CREATE (:Actor {name:'Leonard Nimoy'});
CREATE (:Actor {name:'Wagner Moura'});
CREATE (:Actor {name:'Dustin Hoffman'});
CREATE (:Actor {name:'Robert Redford'});
CREATE (:Actor {name:'Harrison Ford'});
CREATE (:Actor {name:'Fernanda Torres'});
CREATE (:Actor {name:'Maria Fernanda Cândido'});
CREATE (:Actor {name:'George Walker Bush'});
CREATE (:Actor {name:'Debora Bloch'});
CREATE (:Actor {name:'Marina Ruy Barbosa'});
CREATE (:Actor {name:'Jonathan Roumie'});

CREATE (:Director {name:'George Lucas'});
CREATE (:Director {name:'Michael Moore'});
CREATE (:Director {name:'Kleber Mendonça Filho'});

//Cria gêneros
CREATE (:Genre {type:'Ficção Científica'});
CREATE (:Genre {type:'Ação'});
CREATE (:Genre {type:'Drama'});
CREATE (:Genre {type:'Documentário'});
CREATE (:Genre {type:'Drama Histórico'});
CREATE (:Genre {type:'Drama Político'});
CREATE (:Genre {type:'Crime'});
   
//Este código cria os relacionamentos de filmes e séries com gêneros
//15 JAN 2026
//FILMES
//Liga filmes a gêneros
MATCH (m:Movie {title:'Star Wars 77'})
MATCH (g:Genre {type:'Ficção Científica'})
MERGE (m)-[:IS]->(g);

MATCH (m:Movie {title:'Tropa de Elite'})
MATCH (g:Genre {type:'Ação'})
MERGE (m)-[:IS]->(g);

MATCH (m:Movie {title:'All The Presidents Men'})
MATCH (g:Genre {type:'Drama'})
MERGE (m)-[:IS]->(g);

MATCH (m:Movie {title:'Fahrenheit, 11 de Setembro'})
MATCH (g:Genre {type:'Documentário'})
MERGE (m)-[:IS]->(g);

MATCH (m:Movie {title:'Ainda Estou Aqui'})
MATCH (g:Genre {type:'Drama Histórico'})
MERGE (m)-[:IS]->(g);

MATCH (m:Movie {title:'O Agente Secreto'})
MATCH (g:Genre {type:'Drama Político'})
MERGE (m)-[:IS]->(g);

//Séries
//Liga séries a gêneros

MATCH (s:Serie {title:'Star Trek 60s'})
MATCH (g:Genre {type:'Ficção Científica'})
MERGE (s)-[:IS]->(g);

MATCH (s:Serie {title:'Dias Perfeitos'})
MATCH (g:Genre {type:'Crime'})
MERGE (s)-[:IS]->(g);

MATCH (s:Serie {title:'Tremembé'})
MATCH (g:Genre {type:'Crime'})
MERGE (s)-[:IS]->(g);

MATCH (s:Serie {title:'The Chosen'})
MATCH (g:Genre {type:'Drama Histórico'})
MERGE (s)-[:IS]->(g);

// Para ver todos os nós - MATCH (n) RETURN n;
// Para ver todos os nós e seus relacionamentos MATCH (a)-[r]->(b) RETURN a, r, b;

//Liga atores a filmes e séries
//liga atores a filmes
MATCH (a:Actor {name:'Harrison Ford'})
MATCH (m:Movie {title:'Star Wars 77'})
MERGE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'Wagner Moura'})
MATCH (m:Serie {title:'Tropa de Elite'})
MERGE (a)-[:ACTED_IN]->(m);

MATCH (dh:Actor {name:'Dustin Hoffman'})
MATCH (rr:Actor {name:'Robert Redford'})
MATCH (m:Movie {title:'All The Presidents Men'})
MERGE (dh)-[:ACTED_IN]->(m)
MERGE (rr)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'George Walker Bush'})
MATCH (m:Movie {title:'Fahrenheit, 11 de Setembro'})
MERGE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'Fernanda Torres'})
MATCH (m:Movie {title:'Ainda Estou Aqui'})
MERGE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'Maria Fernanda Cândido'})
MATCH (m:Movie {title:'O Agente Secreto'})
MERGE (a)-[:ACTED_IN]->(m);

//liga atores a séries
MATCH (a:Actor {name:'Leonard Nimoy'})
MATCH (s:Serie {title:'Star Trek 60s'})
MERGE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:'Debora Bloch'})
MATCH (s:Serie {title:'Dias Perfeitos'})
MERGE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:'Marina Ruy Barbosa'})
MATCH (s:Serie {title:'Tremembé'})
MERGE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:'Jonathan Roumie'})
MATCH (s:Serie {title:'The Chosen'})
MERGE (a)-[:ACTED_IN]->(s);

//ligar alguns diretores famosos a alguns filmes famosos
MATCH (d:Director {name:'George Lucas'})
MATCH (m:Movie {title:'Star Wars 77'})
MERGE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Michael Moore'})
MATCH (m:Movie {title:'Fahrenheit, 11 de Setembro'})
MERGE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Kleber Mendonça Filho'})
MATCH (m:Movie {title:'O Agente Secreto'})
MERGE (d)-[:DIRECTED]->(m);

//Meu código revisado com pequena ajuda do google para criar o rating
MATCH (u:User {name: 'Sid'})
MATCH (m1:Movie {title: 'Star Wars 77'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5

MATCH (u:User {name: 'Sid'}) 
MATCH (m2:Movie {title: 'Fahrenheit, 11 de Setembro'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5

MATCH (u:User {name: 'Sid'}) 
MATCH (m3:Movie {title: 'Tropa de Elite'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 5

MATCH (u:User {name: 'Sid'}) 
MATCH (m4:Movie {title: 'All The Presidents Men'})
MERGE (u)-[w4:WATCHED]->(m4)
SET w4.rating = 5;

MATCH (u:User {name: 'Sid'}) 
MATCH (m5:Serie {title: 'Star Trek 60s'})
MERGE (u)-[w2:WATCHED]->(m5)
SET w5.rating = 4

//ele disse que with is required between SET and MATCH
//corrigido pelo google - tentar esta 20:27
//user: sid, filmes e série assistida, com notas (rating)
MATCH (u:User {name: 'Sid'})
MATCH (m1:Movie {title: 'Star Wars 77'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Movie {title: 'Fahrenheit, 11 de Setembro'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5
WITH u

MATCH (m3:Movie {title: 'Tropa de Elite'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 5
WITH u

MATCH (m4:Movie {title: 'All The Presidents Men'})
MERGE (u)-[w4:WATCHED]->(m4)
SET w4.rating = 5
WITH u

MATCH (m5:Serie {title: 'Star Trek 60s'})
MERGE (u)-[w5:WATCHED]->(m5)
SET w5.rating = 4;

//versão curta criada pela IA do Google
// não usei porque ainda não entendi
//MATCH (u:User {name: 'Sid'})
//UNWIND [
//  {t: 'Star Wars 77', r: 5},
//  {t: 'Star Trek 60s', r: 4},
//  {t: 'Fahrenheit, 11 de Setembro', r: 5},
//  {t: 'Tropa de Elite', r: 5},
//  {t: 'All The Presidents Men', r: 5}
//] AS item
//MATCH (m:Movie {title: item.t})
//MERGE (u)-[w:WATCHED]->(m)
//SET w.rating = item.r;

//user Meg, filmes e série assistidos, com notas (rating)
MATCH (u:User {name: 'Meg'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 4
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5
WITH u

MATCH (m3:Serie {title: 'Tremembé'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 4;

//user Rosi, filmes e série assistidos, com notas (rating)
//foi assistir junto com Meg, por isso são os mesmos (só a nota que é diferente)
MATCH (u:User {name: 'Rosi'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 4
WITH u

MATCH (m3:Serie {title: 'Tremembé'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 5;

//User Lê, só assistiu 2 filmes porque está fazendo pós-doc
//foi assistir junto com Meg e Rosi
MATCH (u:User {name: 'Lê'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5;

//User Dan, assistiu 2 filmes junto com Lê, Meg e Rosi
MATCH (u:User {name: 'Dan'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 4
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 4;

//User Dani, assistiu 2 filmes junto com Lê, Meg e Rosi e Dan
MATCH (u:User {name: 'Dani'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5;

//User Sérgio, assistiu 1 filme e duas séries
MATCH (u:User {name: 'Sérgio'})
MATCH (m1:Movie {title: 'Star Wars 77'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Serie {title: 'Star Trek 60s'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5;
WITH u

MATCH (m3:Serie {title: 'Dias Perfeitos'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 5;

//Foi assistir com a namorada e assistiu mesmo! Não namorou!!
MATCH (u:User {name: 'Vini'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 4
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 4
WITH u

MATCH (m3:Serie {title: 'Tremembé'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 4;

//Lia foi assistir com o namorado e assistiu mesmo! Não namorou!!
MATCH (u:User {name: 'Lia'})
MATCH (m1:Movie {title: 'Ainda Estou Aqui'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Movie {title: 'O Agente Secreto'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 5
WITH u

MATCH (m3:Serie {title: 'Tremembé'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 5;

//Paty assistiu a dois filmes e a uma série
MATCH (u:User {name: 'Paty'})
MATCH (m1:Movie {title: 'Star Wars 77'})
MERGE (u)-[w1:WATCHED]->(m1)
SET w1.rating = 5
WITH u

MATCH (m2:Movie {title: 'Tropa de Elite'})
MERGE (u)-[w2:WATCHED]->(m2)
SET w2.rating = 4
WITH u

MATCH (m3:Serie {title: 'The Chosen'})
MERGE (u)-[w3:WATCHED]->(m3)
SET w3.rating = 5;
