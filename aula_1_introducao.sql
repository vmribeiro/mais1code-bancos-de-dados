
-- Isso é um comentário :)

CREATE TABLE "EXAMPLES".entidades
(
      ENTITY_NAME 	VARCHAR(150) 	NOT NULL
	, ENTITY_AGE	INT				NOT NULL
	, ENTITY_TYPE	VARCHAR(150) 	NOT NULL
);

/*
VARCHAR(3000)
TEXT
INT -- 1 ou 0 para simular True ou False
BIGINT -- para identificadores
DECIMAL(18,2)
CHAR(1) -- True / False -> Y / N ou Y / NULL
*/


/*
entidade1 = Entidades(entity_name = "Jonas Pedro", entity_type = "Física", entity_age = 44)
*/
INSERT INTO "EXAMPLES".entidades (ENTITY_NAME, ENTITY_TYPE, ENTITY_AGE)
VALUES ('Jonas Pedro', 'Física', 44);

INSERT INTO "EXAMPLES".entidades
VALUES ('Pedrinho', 20, 'Física');

INSERT INTO "EXAMPLES".entidades
VALUES ('Itaú', 65, 'Jurídica');



SELECT * 
FROM "EXAMPLES".entidades
WHERE   ( ENTITY_NAME NOT LIKE '%Alberto%'
	AND ENTITY_AGE > 25)
	
	OR
	
	ENTITY_TYPE = 'Física'
	;
	

UPDATE "EXAMPLES".entidades SET ENTITY_TYPE = 'Jurídica'
WHERE ENTITY_NAME = 'Jonas Alberto';





-- FOREIGN KEYS

CREATE TABLE students 
( 
  student_id SERIAL PRIMARY KEY,
  player_name TEXT
);


CREATE TABLE tests 
( 
   subject_id SERIAL,
   subject_name text,
   highestStudent_id integer REFERENCES students -- Chave estrangeira
);












-- Produtos
CREATE TABLE "LIVRARIA".PRODUTOS
(
	  ID_PRODUTO 		BIGINT 			PRIMARY KEY
	, NOME_PRODUTO		VARCHAR(300)	NOT NULL
	, VALOR				DECIMAL(18, 2)	NOT NULL
	, MARCA				VARCHAR(300)	
	, DESCRICAO			TEXT			NOT NULL
);

INSERT INTO "LIVRARIA".PRODUTOS
VALUES (1, 'Sapiens', 55, 'Record', 'Livro sobre a historia humana.');

INSERT INTO "LIVRARIA".PRODUTOS
VALUES (2, 'Poder do hábito', 55, 'Record', 'Livro que fala sobre habitos humanos');

INSERT INTO "LIVRARIA".PRODUTOS
VALUES (3, 'Narnia', 55, 'Sextante', 'Historias para criancas');

INSERT INTO "LIVRARIA".PRODUTOS
VALUES (4, 'Senhor dos aneis', 55, 'Sextante', 'Historias para adultos');

SELECT * FROM "LIVRARIA".PRODUTOS;


-- Vendas
CREATE TABLE "LIVRARIA".VENDAS
(
	  ID_VENDA				BIGINT			PRIMARY KEY
	, ID_PRODUTO			BIGINT			REFERENCES  "LIVRARIA".PRODUTOS -- FOREIGN KEY (CHAVE ESTRANGEIRA)
	, QUANTIDADE_VENDIDA	INT				NOT NULL
	, DATA_TRANSACAO	 	DATE			NOT NULL
);

INSERT INTO "LIVRARIA".VENDAS
VALUES (1, 2, 3, TO_DATE('2022-06-15','YYYY-MM-DD')  );

INSERT INTO "LIVRARIA".VENDAS
VALUES (2, 1, 1, TO_DATE('2022-06-15','YYYY-MM-DD')  );

INSERT INTO "LIVRARIA".VENDAS
VALUES (3, 3, 6, TO_DATE('2022-06-15','YYYY-MM-DD')  );

INSERT INTO "LIVRARIA".VENDAS
VALUES (4, 4, 2, TO_DATE('2022-06-15','YYYY-MM-DD')  );

INSERT INTO "LIVRARIA".VENDAS
VALUES (5, 4, 1, TO_DATE('2022-06-15','YYYY-MM-DD')  );



-- Valor total vendido do livro senhor dos anéis
SELECT 	  PD.ID_PRODUTO 
		, PD.NOME_PRODUTO
		, SUM(VD.QUANTIDADE_VENDIDA * PD.VALOR) AS VALOR_VENDIDO

FROM "LIVRARIA".PRODUTOS AS PD

	JOIN "LIVRARIA".VENDAS   AS VD
	ON PD.ID_PRODUTO = VD.ID_PRODUTO

WHERE PD.NOME_PRODUTO = 'Senhor dos aneis'

GROUP BY 1,2
;













