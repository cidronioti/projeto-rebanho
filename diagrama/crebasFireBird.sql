/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     26/11/2007 11:16:15                          */
/*==============================================================*/


drop table if exists AGRUPAMENTO;

drop table if exists ANIMAL;

drop table if exists BAIXA;

drop table if exists CAUSAS_MARTIS;

drop table if exists CLIENTES;

drop table if exists COBERTURAS;

drop table if exists COLETA_EMBRIOES;

drop table if exists CONTAS_PAGAR;

drop table if exists CONTAS_RECEBER;

drop table if exists CRIADOR_PROPRIETARIO;

drop table if exists DESMAMA;

drop table if exists DIAGNOSTICO;

drop table if exists ENDERECO;

drop table if exists EVENTOS_SANITARIOS_ZOOTECNICOS;

drop table if exists EVENTO_SANITARIO;

drop table if exists FONE;

drop table if exists FORNECEDOR;

drop table if exists FUNCIONARIOS;

drop table if exists INSEMINADORES;

drop table if exists LOCAL1;

drop table if exists MEDICAMENTOS;

drop table if exists PARTO;

drop table if exists PARTO_REGISTRO_CRIA;

drop table if exists PESAGEM;

drop table if exists PROPRIEDADE;

drop table if exists RACA;

drop table if exists USUARIOS;

drop table if exists VENDA_ANIMAIS;

/*==============================================================*/
/* Table: AGRUPAMENTO                                           */
/*==============================================================*/
create table AGRUPAMENTO
(
   COD_AGRUPAMENTO      int not null ,
   DATA_BAIXA           varchar(10),
   GRAU_SANGUE          varchar(10),
   GRUPO                varchar(50),
   ORIGEM               varchar(50),
   DESTINACAO           varchar(50),
   PELAGEM              varchar(50),
   DATA_DESMAMA         varchar(10),
   PAI                  varchar(7),
   MAE                  varchar(7),
   REGIME_ALIMENTAR     varchar(50),
   OBS                  varchar(150),
   COD_CRIADOR          int,
   COD_ANIMAL           varchar(7),
   primary key (COD_AGRUPAMENTO)
);

/*==============================================================*/
/* Table: ANIMAL                                                */
/*==============================================================*/
create table ANIMAL
(
   COD_ANIMAL           varchar(7) not null,
   NOME_ANIMAL          varchar(50),
   SEXO_ANIMAL          char(1),
   CITUACAO             varchar(50),
   BRINCO               varchar(15),
   COD_RACA             varchar(3),
   COD_LOCAL            varchar(3),
   FOTO                 blob,
   primary key (COD_ANIMAL)
);

/*==============================================================*/
/* Table: BAIXA                                                 */
/*==============================================================*/
create table BAIXA
(
   COD_BAIXA            int not null ,
   COD_ANIMAL           varchar(7),
   COD_CAUSAS_MORITS    int,
   VALOR_ANIMAL         decimal,
   DATA_BAIXA           varchar(10),
   OBS                  varchar(150),
   primary key (COD_BAIXA)
);

/*==============================================================*/
/* Table: CAUSAS_MARTIS                                         */
/*==============================================================*/
create table CAUSAS_MARTIS
(
   COD_CAUSAS_MORITS    int not null ,
   NOME_CAUSA           varchar(50),
   primary key (COD_CAUSAS_MORITS)
);

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES
(
   COD_CLIENTE          int not null ,
   NOME_CLIENTE         varchar(80),
   CPF                  varchar(15),
   RG                   varchar(15),
   COD_FONE             int,
   PROPRIEDADE          varchar(80),
   COD_ENDERECO         int,
   primary key (COD_CLIENTE)
);

/*==============================================================*/
/* Table: COBERTURAS                                            */
/*==============================================================*/
create table COBERTURAS
(
   COD_COBERTURA        int not null,
   COD_ANIMAL           varchar(7),
   COD_INSEMINADOR      int,
   DATA_CIO             varchar(10),
   HORA_CIO             varchar(8),
   TIPO_COBERTURA       varchar(30),
   MACHO                varchar(7),
   PARTIDA              varchar(20),
   DOSES                int,
   VALOR_GASTO          decimal,
   OBS                  varchar(150),
   primary key (COD_COBERTURA)
);

/*==============================================================*/
/* Table: COLETA_EMBRIOES                                       */
/*==============================================================*/
create table COLETA_EMBRIOES
(
   COD_COLETA           int not null,
   COD_ANIMAL           varchar(7),
   COD_FUNCIONARIO      int,
   DATA                 varchar(10),
   VALOR                decimal,
   NUM_ENBRIOES         int,
   OBS                  varchar(150),
   primary key (COD_COLETA)
);

/*==============================================================*/
/* Table: CONTAS_PAGAR                                          */
/*==============================================================*/
create table CONTAS_PAGAR
(
   COD_CONTA_PAGAR      int not null,
   TIPO_DESPESA         varchar(80),
   COD_FORNECEDOR       int,
   NUM_DOCUMENTO        char(10),
   STATUS               varchar(40),
   NUM_PARCELAS         int,
   TOTAL_PARCELAS_PAGAS int,
   DATA_VENCIMENTO      varchar(10),
   VALOR                decimal,
   VALOR_JUROS          decimal,
   VALOR_DESCONTO       decimal,
   VALOR_TOTAL          decimal,
   VALOR_MULTA          decimal,
   NUM_NF               varchar(40),
   DATA_BAIXA           varchar(10),
   DATA_LANCAMENTO      varchar(10),
   LANCAR_CUSTO_POR     varchar(30),
   OBS                  varchar(150),
   primary key (COD_CONTA_PAGAR)
);

/*==============================================================*/
/* Table: CONTAS_RECEBER                                        */
/*==============================================================*/
create table CONTAS_RECEBER
(
   COD_CONTA_RECEBER      int not null,
   TIPO_DESPESA         varchar(80),
   COD_CLIENTE          int,
   NUM_DOCUMENTO        char(10),
   STATUS               varchar(40),
   NUM_PARCELAS         int,
   TOTAL_PARCELAS_RECEBIDAS int,
   DATA_VENCIMENTO      varchar(10),
   VALOR                decimal,
   VALOR_JUROS          decimal,
   VALOR_DESCONTO       decimal,
   VALOR_TOTAL          decimal,
   VALOR_MULTA          decimal,
   NUM_NF               varchar(40),
   DATA_BAIXA           varchar(10),
   DATA_LANCAMENTO      varchar(10),
   LANCAR_CUSTO_POR     varchar(30),
   OBS                  varchar(150),
   primary key (COD_CONTA_RECEBER)
);

/*==============================================================*/
/* Table: CRIADOR_PROPRIETARIO                                  */
/*==============================================================*/
create table CRIADOR_PROPRIETARIO
(
   COD_CRIADOR          int not null,
   NOME_CRIADOR         varchar(80),
   primary key (COD_CRIADOR)
);

/*==============================================================*/
/* Table: DESMAMA                                               */
/*==============================================================*/
create table DESMAMA
(
   COD_CRIA_DEFINITIVO  varchar(7) not null,
   COD_CRIA             varchar(7),
   DATA_DESMAMA         varchar(10),
   DESTINACAO           varchar(50),
   PESO                 decimal,
   COD_LOCAL            varchar(3),
   OBS                  varchar(150),
   primary key (COD_CRIA_DEFINITIVO)
);

/*==============================================================*/
/* Table: DIAGNOSTICO                                           */
/*==============================================================*/
create table DIAGNOSTICO
(
   COD_DIAGNOSTICO      int not null,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   RESULTADO            varchar(20),
   OBS                  varchar(150),
   primary key (COD_DIAGNOSTICO)
);

/*==============================================================*/
/* Table: ENDERECO                                              */
/*==============================================================*/
create table ENDERECO
(
   COD_ENDERECO         int not null,
   RUA                  varchar(80),
   BAIRRO               varchar(80),
   CIDADE               varchar(80),
   NUM                  varchar(10),
   CEP                  varchar(12),
   primary key (COD_ENDERECO)
);

/*==============================================================*/
/* Table: EVENTOS_SANITARIOS_ZOOTECNICOS                        */
/*==============================================================*/
create table EVENTOS_SANITARIOS_ZOOTECNICOS
(
   COD_EVENTO_SANITARIO_ZOOTECNICO int not null,
   NOME_EVENTO          varchar(50),
   primary key (COD_EVENTO_SANITARIO_ZOOTECNICO)
);

/*==============================================================*/
/* Table: EVENTO_SANITARIO                                      */
/*==============================================================*/
create table EVENTO_SANITARIO
(
   COD_EVENTOSANITARIO  int not null,
   COD_ANIMAL           varchar(7),
   COD_EVENTO_SANITARIO_ZOOTECNICO int,
   QTD                  decimal,
   DOSES                varchar(20),
   SCORE                varchar(10),
   NOTA_FISCAL          varchar(50),
   COD_MEDICAMENTO      varchar(15),
   VALOR                decimal,
   ALERTA               int,
   OBS                  varchar(150),
   primary key (COD_EVENTOSANITARIO)
);

/*==============================================================*/
/* Table: FONE                                                  */
/*==============================================================*/
create table FONE
(
   COD_FONE             int not null,
   FONE                 varchar(15),
   primary key (COD_FONE)
);

/*==============================================================*/
/* Table: FORNECEDOR                                            */
/*==============================================================*/
create table FORNECEDOR
(
   COD_FORNECEDOR       int not null,
   NOME_FANTASIA        varchar(80),
   RAZAO_SOCIAL         varchar(80),
   CPF_CNPJ             varchar(20),
   EMAIL                varchar(100),
   COD_FONE             int,
   COD_ENDERECO         int,
   primary key (COD_FORNECEDOR)
);

/*==============================================================*/
/* Table: FUNCIONARIOS                                          */
/*==============================================================*/
create table FUNCIONARIOS
(
   COD_FUNCIONARIO      int not null,
   NOME_FUNC            varchar(100),
   COD_ENDERECO         int,
   CPF_FUNC             varchar(15),
   RG_FUNC              varchar(15),
   DATA_NASC            varchar(10),
   CARTEIRA_TRABALHO    varchar(12),
   COD_FONE             int,
   DATA_ADIMISSAO       varchar(10),
   SALARIO              decimal,
   DESCONTO             decimal,
   SALARIO_COM_DESCONTO decimal,
   primary key (COD_FUNCIONARIO)
);

/*==============================================================*/
/* Table: INSEMINADORES                                         */
/*==============================================================*/
create table INSEMINADORES
(
   COD_INSEMINADOR      int not null,
   COD_FUNCIONARIO      int,
   REGISTRO             varchar(15),
   CRMV                 varchar(20),
   primary key (COD_INSEMINADOR)
);

/*==============================================================*/
/* Table: LOCAL1                                                */
/*==============================================================*/
create table LOCAL1
(
   COD_LOCAL            varchar(3) not null,
   NOME_LOCAL           varchar(50),
   AREA_LOCAL           decimal,
   GRAMINEA             varchar(50),
   DATA_AVALIACAO       varchar(10),
   PADRAO_CORTE         varchar(20),
   PADRAO_PASTEJO       varchar(20),
   SUPORTE              decimal,
   PASTEJO              decimal,
   PERDA                decimal,
   CONSUMO              decimal,
   DESCANSO             int,
   OBS                  varchar(150),
   primary key (COD_LOCAL)
);

/*==============================================================*/
/* Table: MEDICAMENTOS                                          */
/*==============================================================*/
create table MEDICAMENTOS
(
   COD_MEDICAMENTO      varchar(15) not null,
   NOME_COMERCIAL       varchar(80),
   PRINCIPIO_ATIVO      varchar(80),
   VALIDADE             varchar(10),
   CATEGORIA            varchar(50),
   APRESENTACAO         varchar(80),
   QTD_POR_EMBALAGEM    int,
   QTD_DE_EMBALAGENS    int,
   UNIDADE              varchar(20),
   QTD_MIN              int,
   PRECO_COMPRA         decimal,
   LABORATORIO_RESP     varchar(80),
   INDICACOES           varchar(150),
   MODO_USO             varchar(150),
   OBS                  varchar(150),
   FOTO                 blob,
   primary key (COD_MEDICAMENTO)
);

/*==============================================================*/
/* Table: PARTO                                                 */
/*==============================================================*/
create table PARTO
(
   COD_PARTO            int not null,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   NUM_CRIAS            int,
   NUM_NATIMORTOS       int,
   primary key (COD_PARTO)
);

/*==============================================================*/
/* Table: PARTO_REGISTRO_CRIA                                   */
/*==============================================================*/
create table PARTO_REGISTRO_CRIA
(
   COD_CRIA             varchar(7) not null,
   NOME_CRIA            varchar(80),
   SEXO                 char(1),
   COD_RACA             varchar(3),
   PESO                 decimal,
   OBS                  varchar(150),
   primary key (COD_CRIA)
);

/*==============================================================*/
/* Table: PESAGEM                                               */
/*==============================================================*/
create table PESAGEM
(
   COD_PESAGEM          int not null,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   PESO_ANIMAL          decimal,
   primary key (COD_PESAGEM)
);

/*==============================================================*/
/* Table: PROPRIEDADE                                           */
/*==============================================================*/
create table PROPRIEDADE
(
   COD_PROPRIEDADE      int not null,
   NOME_PROPRIEDADE     varchar(80),
   NIRF_PROPRIEDADE     varchar(20),
   PROPRIETARIO         varchar(100),
   ENDERECO             varchar(100),
   CIDADE               varchar(80),
   UF                   varchar(2),
   CEP                  varchar(10),
   EMAIL                varchar(100),
   FONE                 varchar(20),
   CPF_CNPJ_PROPRIETARIO varchar(20),
   primary key (COD_PROPRIEDADE)
);

/*==============================================================*/
/* Table: RACA                                                  */
/*==============================================================*/
create table RACA
(
   COD_RACA             varchar(3) not null,
   NOME_RACA            varchar(50),
   PERIODO_GESTACAO     int,
   primary key (COD_RACA)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   COD_USUARIO          int not null,
   COD_FUNCIONARIO      int,
   PERMSSAO             varchar(80),
   LOGIN                varchar(80),
   SENHA                varchar(40),
   primary key (COD_USUARIO)
);

/*==============================================================*/
/* Table: VENDA_ANIMAIS                                         */
/*==============================================================*/
create table VENDA_ANIMAIS
(
   COD_VENDA            int not null,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   VALOR_KG             decimal,
   COD_CLIENTE          int,
   NOTA_FISCAL          varchar(30),
   GTA                  varchar(20),
   OBS                  varchar(150),
   primary key (COD_VENDA)
);

/*ALTERANDO AS TABELAS INSERINDO AS CHAVES ESTRANGEIRAS*/

alter table AGRUPAMENTO add  foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table AGRUPAMENTO add foreign key (COD_CRIADOR)
      references CRIADOR_PROPRIETARIO (COD_CRIADOR);

alter table ANIMAL add foreign key (COD_RACA)
      references RACA (COD_RACA);

alter table ANIMAL add foreign key (COD_LOCAL)
      references LOCAL1 (COD_LOCAL);

alter table BAIXA add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table BAIXA add foreign key (COD_CAUSAS_MORITS)
      references CAUSAS_MARTIS (COD_CAUSAS_MORITS);

alter table CLIENTES add foreign key (COD_FONE)
      references FONE (COD_FONE);

alter table CLIENTES add foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO);

alter table COBERTURAS add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table COBERTURAS add foreign key (COD_INSEMINADOR)
      references INSEMINADORES (COD_INSEMINADOR);

alter table COLETA_EMBRIOES add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table COLETA_EMBRIOES add foreign key (COD_FUNCIONARIO)
      references FUNCIONARIOS (COD_FUNCIONARIO);

alter table CONTAS_PAGAR add foreign key (COD_FORNECEDOR)
      references FORNECEDOR (COD_FORNECEDOR);

alter table CONTAS_RECEBER add foreign key (COD_CLIENTE)
      references CLIENTES (COD_CLIENTE);

alter table DESMAMA add foreign key (COD_CRIA)
      references PARTO_REGISTRO_CRIA (COD_CRIA);

alter table DESMAMA add foreign key (COD_LOCAL)
      references LOCAL1 (COD_LOCAL);

alter table DIAGNOSTICO add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table EVENTO_SANITARIO add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table EVENTO_SANITARIO add foreign key (COD_MEDICAMENTO)
      references MEDICAMENTOS (COD_MEDICAMENTO);

alter table EVENTO_SANITARIO add foreign key (COD_EVENTO_SANITARIO_ZOOTECNICO)
      references EVENTOS_SANITARIOS_ZOOTECNICOS (COD_EVENTO_SANITARIO_ZOOTECNICO);

alter table FORNECEDOR add foreign key (COD_FONE)
      references FONE (COD_FONE);

alter table FORNECEDOR add foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO);

alter table FUNCIONARIOS add foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO);

alter table FUNCIONARIOS add foreign key (COD_FONE)
      references FONE (COD_FONE) ;

alter table INSEMINADORES add foreign key (COD_FUNCIONARIO)
      references FUNCIONARIOS (COD_FUNCIONARIO) ;

alter table PARTO add  foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table PARTO_REGISTRO_CRIA add foreign key (COD_RACA)
      references RACA (COD_RACA);

alter table PESAGEM add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table USUARIOS add foreign key (COD_FUNCIONARIO)
      references FUNCIONARIOS (COD_FUNCIONARIO);

alter table VENDA_ANIMAIS add foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL);

alter table VENDA_ANIMAIS add foreign key (COD_CLIENTE)
      references CLIENTES (COD_CLIENTE);

/*CRIANDO O GENERATOR PARA AS TABELAS QUE POSSUI ID COM AUTO INCREMENTO É OBRIGATÓRIO NO FIREBIRD*/

CREATE GENERATOR gen_agrupamento_id;

CREATE GENERATOR gen_baixa_id;

CREATE GENERATOR gen_causas_mortis_id;

CREATE GENERATOR gen_cobertura_id;

CREATE GENERATOR gen_coleta_embrioes_id;

CREATE GENERATOR gen_contas_pagar_id;

CREATE GENERATOR gen_contas_receber_id;

CREATE GENERATOR gen_criador_id;

CREATE GENERATOR gen_diagnostico_id;

CREATE GENERATOR gen_endereco_id;

CREATE GENERATOR gen_evt_san_zoo_id;

CREATE GENERATOR gen_evento_sanitario_id;

CREATE GENERATOR gen_fone_id;

CREATE GENERATOR gen_funcionarios_id;

CREATE GENERATOR gen_fornecedores_id;

CREATE GENERATOR gen_inseminadores_id;

CREATE GENERATOR gen_parto_id;

CREATE GENERATOR gen_pesagem_id;

CREATE GENERATOR gen_propriedade_id;

CREATE GENERATOR gen_usuarios_id;

CREATE GENERATOR gen_venda_animais_id;


/*CRIANDO TRIGGERS DE INCREMENTO PARA AS TABELAS QUE POSSUI ID COM AUTO INCREMENTO É OBRIGATÓRIO NO FIREBIRD*/

SET TERM ^ ;

CREATE TRIGGER tr_agrupamento FOR AGRUPAMENTO 
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_AGRUPAMENTO = gen_id(gen_agrupamento_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_baixa FOR BAIXA 
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_BAIXA = gen_id(gen_baixa_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_causas_mortis FOR CAUSAS_MARTIS 
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_CAUSAS_MORITS = gen_id(gen_causas_mortis_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_coberturas FOR COBERTURAS 
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_COBERTURA = gen_id(gen_cobertura_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_coleta FOR COLETA_EMBRIOES
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_COLETA = gen_id(gen_coleta_embrioes_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_conta_pagar FOR CONTAS_PAGAR
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_CONTA_PAGAR = gen_id(gen_contas_pagar_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_conta_receber FOR CONTAS_RECEBER
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_CONTA_RECEBER = gen_id(gen_contas_receber_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_criador FOR CRIADOR_PROPRIETARIO
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_CRIADOR = gen_id(gen_criador_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_diagnostico FOR DIAGNOSTICO
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_DIAGNOSTICO = gen_id(gen_diagnostico_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_endereco FOR ENDERECO
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_ENDERECO = gen_id(gen_endereco_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_evento_sanitario_zootecnico FOR EVENTOS_SANITARIOS_ZOOTECNICOS
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_EVENTO_SANITARIO_ZOOTECNICO = gen_id(gen_evt_san_zoo_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_evento_sanitario FOR EVENTO_SANITARIO
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_EVENTOSANITARIO = gen_id(gen_evento_sanitario_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_fone FOR FONE
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_FONE = gen_id(gen_fone_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_funcionario FOR FUNCIONARIOS
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_FUNCIONARIO = gen_id(gen_funcionarios_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_fornecedor FOR FORNECEDOR
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_FORNECEDOR = gen_id(gen_fornecedores_id,1);
END^

SET TERM ^ ;

CREATE TRIGGER tr_inseminadores FOR INSEMINADORES
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_INSEMINADOR = gen_id(gen_inseminadores_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_parto FOR PARTO
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_PARTO = gen_id(gen_parto_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_pesagem FOR PESAGEM
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_PESAGEM = gen_id(gen_pesagem_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_propriedade FOR PROPRIEDADE
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_PROPRIEDADE = gen_id(gen_propriedade_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_usuarios FOR USUARIOS
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_USUARIO = gen_id(gen_usuarios_id,1);
END^


SET TERM ^ ;

CREATE TRIGGER tr_venda_animais FOR VENDA_ANIMAIS
 ACTIVE BEFORE INSERT position 0 AS 
 
BEGIN 
    new.COD_VENDA = gen_id(gen_venda_animais_id,1);
END^