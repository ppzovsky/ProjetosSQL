create database CampanhaBD;

create table campanha(
	nome varchar(50),
	data_inicio date,
	data_final date
);

create table funcionario(
    funcionarioID serial primary key,
    nome varchar(50),
    cpf char(11)  
);

create table quizzes(
    quizID serial primary key, 
    tema varchar(50),
    titulo varchar(50), 
    descricao varchar(200),
    data_inicio date,
    prazo timestamp 
);

alter table quizzes alter column prazo type date;

create table participantes (
    ID serial primary key,
    quizID int,
    funcionarioID int,
    data_participacao timestamp default current_timestamp,
    foreign key (funcionarioID) references funcionario(funcionarioID),
    foreign key (quizID) references quizzes(quizID)
);

create table pergunta(
    perguntaID serial PRIMARY KEY,
    texto_pergunta varchar(100),
    texto_resposta varchar(100),
    opcao char  
);

alter table pergunta alter column texto_resposta type text;
alter table pergunta alter column texto_pergunta type text;

alter table pergunta
add column quizID int default null,
add constraint fk_quizID foreign key(quizID) references quizzes(quizId);

create table resposta(
	Resposta_id serial primary key,
	quizID int,
	opcao_correta char,
	texto_resposta varchar(80),
	foreign key (quizID) references quizzes(quizID)
);


insert into funcionario(
    nome,
    cpf
)
values(
	'Lucas Boeck', '13245567800'),
	('Fernando Silva','19966677722'),	
	('Gabriel Barbosa','19288766599'),
	('Bruno Henrique', '56787643212'),
	('Luiz Mata Porco', '34567890125'),
	('Alexandre Silveira', '44567833400'),
	('Flavinho do Pneu', '33245678923'),
	('Deyde Silva', '23456712239'),
	('Isadora do Santos Pinto', '34567890123'),
	('Luiz Miele', '45577722211'
);

insert into campanha(
     nome,
     data_inicio,
	 data_final 
)
    
values(
	'Mecânica Simas Nitro', '2024-03-26', '2024-04-26'
);


insert into quizzes (
    tema,
    titulo, 
    descricao,
    data_inicio,
    prazo
)  
values(
	'Dia da mulher', 
	'Mulheres Fortes', 
	'Um quiz para conscientizar sobre a importância da mulher',
	'2024-03-27',
	'2024-04-24 23:59:59'
	);

insert into quizzes (
    tema,
    titulo, 
    descricao,
    data_inicio,
    prazo
 )   
values(
	'Funcionarios PCD', 
	'Quiz PCD: Seus direitos no mercado de trabalho', 
	'Teste seus conhecimentos sobre os direitos das pessoas com deficiência (PCD) no mercado de trabalho e aprenda como garantir a inclusão e a igualdade de oportunidades',
	'2024-04-24',
	'2024-04-30'
);

insert into pergunta (texto_pergunta, texto_resposta, opcao) values
(
    'O que a sigla PCD significa?',
    'Pessoa com Deficiência',
    'a'
),
(
    'Qual a lei que garante a reserva de cotas para pessoas com deficiência no mercado de trabalho?',
    'Lei de Cotas para PCD (Lei nº 8.213/91)',
    'c'
),
(
    'Qual a porcentagem de vagas para PcD em empresas com mais de 100 funcionários?',
    '2%',
    'b'
),
(
    'O que é considerado deficiência para fins de reserva de cotas?',
    'Toda restrição física, mental, intelectual ou sensorial de longo prazo',
    'd'
),
(
    'Qual o prazo para a empresa se adequar à reserva de cotas para pessoas com deficiência?',
    '90 dias',
    'c'
),
(
    'Quais os benefícios de contratar pessoas com deficiência?',
    'Melhoria do clima organizacional',
    'd'
),
(
    'Qual o papel do RH na inclusão de pessoas com deficiência no mercado de trabalho?',
    'Em acessibilidade, recrutamento e combate ao preconceito são essenciais.',
    'a'
),
(
    'Quais os desafios enfrentados pelas pessoas com deficiência no mercado de trabalho?',
    'Discriminação, falta de acessibilidade e preconceito são os maiores desafios.',
    'c'
),
(
    'Como as empresas podem garantir a inclusão de pessoas com deficiência?',
    'Acessibilidade, treinamento, adaptação e combate ao preconceito são essenciais.',
    'd'
),
(
    'Quais os direitos das pessoas com deficiência no mercado de trabalho?',
    'Salário igualitário, jornada especial, benefícios e acessibilidade são seus direitos.',
    'b'
),
(
    'Qual o órgão responsável por fiscalizar o cumprimento da lei de cotas para PCD?',
    'Ministério do Trabalho e Previdência',
    'a'
);

update pergunta
set quizID = 1
where perguntaID < 12;

insert into pergunta (texto_pergunta, texto_resposta, opcao, quizID) values
(
    'Qual a data comemorativa do Dia Internacional da Mulher?',
    '08 de março',
    'a',
	 2
),
(
    'Qual o tema central do Dia Internacional da Mulher em 2024?',
    'Geração Igualdade: por um mundo com direitos iguais para mulheres e meninas',
    'b',
	 2	
),
(
    'Qual a origem do Dia Internacional da Mulher?',
    'Greve das operárias têxteis de Nova York em 1857',
    'b',
	 2
),
(
    'Qual o principal objetivo do Dia Internacional da Mulher?',
    'Celebrar conquistas, promover igualdade e conscientizar sobre desafios.',
    'd',
	 2
),
(
    'Qual a primeira mulher a ser eleita presidente no Brasil?',
    'Dilma Rousseff',
    'c',
	 2
),
(
    'Qual a principal conquista das mulheres na luta pela igualdade de gênero?',
    'Direito ao voto',
    'd',
	 2
),
(
    'Quem foi a primeira mulher a receber o Prêmio Nobel de Física?',
    'Marie Curie',
    'd',
 	 2
),
(
    'Qual a importância da representatividade feminina em diferentes áreas da sociedade?',
    'Inspiração para outras mulheres',
    'd',
	 2
),
(
    'Qual a data de criação da ONU Mulheres?',
    '2 de julho de 2010',
    'd',
	 2
),
(
    'Qual o lema da campanha da ONU Mulheres para o Dia Internacional da Mulher em 2024?',
    'Geração Igualdade: por um mundo com direitos iguais para mulheres e meninas',
     'd',
	  2
);

alter table campanha
add column campanhaID serial primary key;

alter table quizzes
add column campanhaID int default null,
add constraint fk_campanhaID foreign key(campanhaID) references campanha(campanhaID); 

update quizzes 
set campanhaID = 1
where quizID<3; -- adicionado chave estrangeira referenciando quiz a sua campanha 

alter table participantes 
add column acertos int;

alter table funcionario 
add column participou boolean;

update funcionario 
set participou = true 
where funcionarioid%2=0; --popular de forma mais rapida

update funcionario 
set participou = false 
where funcionarioid%2=1; --popular de forma mais rapida

insert into participantes (funcionarioid) 
select  funcionarioid from funcionario 
where participou = true;

drop table resposta; -- tabela resposta deixou de ser necessaria, pois estamos armazenando elas dentro da tabela pergunta

update participantes 
set quizid = 2 , acertos = 10
where id in (4);

insert into funcionario (nome, cpf, participou) values
(
	'Fernandinho Pilintra',
	'18974419054',
	true
);

insert into participantes (quizid, funcionarioid, acertos) values
( 
	2, 11, 8
);


select * from participantes;
select * from campanha;
select * from funcionario;
select * from pergunta;
select * from quizzes;
select * from resposta;
