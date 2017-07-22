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
   COD_AGRUPAMENTO      int not null auto_increment,
   DATA_BAIXA           varchar(10),
   GRAU_SANGUE          varchar(10),
   GRUPO                varchar(50),
   ORIGEM               varchar(50),
   DESTINACAO           varchar(50),
   PELAGEM              varchar(50),
   COD_DESMAMA          int,
   PAI                  varchar(7),
   MAE                  varchar(7),
   REGIME_ALIMENTAR     varchar(50),
   OBS                  text,
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
   FOTO                 varchar(100),
   primary key (COD_ANIMAL)
);

/*==============================================================*/
/* Table: BAIXA                                                 */
/*==============================================================*/
create table BAIXA
(
   COD_BAIXA            int not null auto_increment,
   COD_ANIMAL           varchar(7),
   COD_CAUSAS_MORITS    int,
   VALOR_ANIMAL         double,
   DATA_BAIXA           varchar(10),
   OBS                  text,
   primary key (COD_BAIXA)
);

/*==============================================================*/
/* Table: CAUSAS_MARTIS                                         */
/*==============================================================*/
create table CAUSAS_MARTIS
(
   COD_CAUSAS_MORITS    int not null auto_increment,
   NOME_CAUSA           varchar(50),
   primary key (COD_CAUSAS_MORITS)
);

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES
(
   COD_CLIENTE          int not null auto_increment,
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
   COD_COBERTURA        int not null auto_increment,
   COD_ANIMAL           varchar(7),
   COD_INSEMINADOR      int,
   COD_INSEMINADORES    int,
   DATA_CIO             varchar(10),
   HORA_CIO             varchar(8),
   TIPO_COBERTURA       varchar(30),
   MACHO                varchar(7),
   PARTIDA              varchar(20),
   DOSES                int,
   VALOR_GASTO          double,
   OBS                  text,
   primary key (COD_COBERTURA)
);

/*==============================================================*/
/* Table: COLETA_EMBRIOES                                       */
/*==============================================================*/
create table COLETA_EMBRIOES
(
   COD_COLETA           int not null auto_increment,
   COD_ANIMAL           varchar(7),
   COD_FUNCIONARIO      int,
   DATA                 varchar(10),
   VALOR                double,
   NUM_ENBRIOES         int,
   OBS                  text,
   primary key (COD_COLETA)
);

/*==============================================================*/
/* Table: CONTAS_PAGAR                                          */
/*==============================================================*/
create table CONTAS_PAGAR
(
   COD_CONTA_PAGAR      int not null auto_increment,
   TIPO_DESPESA         varchar(80),
   COD_FORNECEDOR       int,
   NUM_DOCUMENTO        char(10),
   STATUS               varchar(40),
   NUM_PARCELAS         int,
   TOTAL_PARCELAS_PAGAS int,
   DATA_VENCIMENTO      varchar(10),
   VALOR                double,
   VALOR_JUROS          double,
   VALOR_DESCONTO       double,
   VALOR_TOTAL          double,
   VALOR_MULTA          double,
   NUM_NF               varchar(40),
   DATA_BAIXA           varchar(10),
   DATA_LANCAMENTO      varchar(10),
   LANCAR_CUSTO_POR     varchar(30),
   OBS                  text,
   primary key (COD_CONTA_PAGAR)
);

/*==============================================================*/
/* Table: CONTAS_RECEBER                                        */
/*==============================================================*/
create table CONTAS_RECEBER
(
   COD_CONTA_PAGAR      int not null auto_increment,
   TIPO_DESPESA         varchar(80),
   COD_CLIENTE          int,
   NUM_DOCUMENTO        char(10),
   STATUS               varchar(40),
   NUM_PARCELAS         int,
   TOTAL_PARCELAS_RECEBIDAS int,
   DATA_VENCIMENTO      varchar(10),
   VALOR                double,
   VALOR_JUROS          double,
   VALOR_DESCONTO       double,
   VALOR_TOTAL          double,
   VALOR_MULTA          double,
   NUM_NF               varchar(40),
   DATA_BAIXA           varchar(10),
   DATA_LANCAMENTO      varchar(10),
   LANCAR_CUSTO_POR     varchar(30),
   OBS                  text,
   primary key (COD_CONTA_PAGAR)
);

/*==============================================================*/
/* Table: CRIADOR_PROPRIETARIO                                  */
/*==============================================================*/
create table CRIADOR_PROPRIETARIO
(
   COD_CRIADOR          int not null auto_increment,
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
   PESO                 double,
   COD_LOCAL            varchar(3),
   OBS                  text,
   primary key (COD_CRIA_DEFINITIVO)
);

/*==============================================================*/
/* Table: DIAGNOSTICO                                           */
/*==============================================================*/
create table DIAGNOSTICO
(
   COD_DIAGNOSTICO      int not null auto_increment,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   RESULTADO            varchar(20),
   OBS                  text,
   primary key (COD_DIAGNOSTICO)
);

/*==============================================================*/
/* Table: ENDERECO                                              */
/*==============================================================*/
create table ENDERECO
(
   COD_ENDERECO         int not null auto_increment,
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
   COD_EVENTO_SANITARIO_ZOOTECNICO int not null auto_increment,
   NOME_EVENTO          varchar(50),
   primary key (COD_EVENTO_SANITARIO_ZOOTECNICO)
);

/*==============================================================*/
/* Table: EVENTO_SANITARIO                                      */
/*==============================================================*/
create table EVENTO_SANITARIO
(
   COD_EVENTOSANITARIO  int not null auto_increment,
   COD_ANIMAL           varchar(7),
   COD_EVENTO_SANITARIO_ZOOTECNICO int,
   QTD                  double,
   DOSES                varchar(20),
   SCORE                varchar(10),
   NOTA_FISCAL          varchar(50),
   COD_MEDICAMENTO      varchar(15),
   VALOR                double,
   ALERTA               int,
   OBS                  text,
   primary key (COD_EVENTOSANITARIO)
);

/*==============================================================*/
/* Table: FONE                                                  */
/*==============================================================*/
create table FONE
(
   COD_FONE             int not null auto_increment,
   FONE                 varchar(15),
   primary key (COD_FONE)
);

/*==============================================================*/
/* Table: FORNECEDOR                                            */
/*==============================================================*/
create table FORNECEDOR
(
   COD_FORNECEDOR       int not null auto_increment,
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
   COD_FUNCIONARIO      int not null auto_increment,
   NOME_FUNC            varchar(100),
   COD_ENDERECO         int,
   CPF_FUNC             varchar(15),
   RG_FUNC              varchar(15),
   DATA_NASC            varchar(10),
   CARTEIRA_TRABALHO    varchar(12),
   COD_FONE             int,
   DATA_ADIMISSAO       varchar(10),
   SALARIO              double,
   DESCONTO             double,
   SALARIO_COM_DESCONTO double,
   primary key (COD_FUNCIONARIO)
);

/*==============================================================*/
/* Table: INSEMINADORES                                         */
/*==============================================================*/
create table INSEMINADORES
(
   COD_INSEMINADOR      int not null auto_increment,
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
   AREA_LOCAL           double,
   GRAMINEA             varchar(50),
   DATA_AVALIACAO       varchar(10),
   PADRAO_CORTE         varchar(20),
   PADRAO_PASTEJO       varchar(20),
   SUPORTE              double,
   PASTEJO              double,
   PERDA                double,
   CONSUMO              double,
   DESCANSO             int,
   OBS                  text,
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
   PRECO_COMPRA         double,
   LABORATORIO_RESP     varchar(80),
   INDICACOES           text,
   MODO_USO             text,
   OBS                  text,
   FOTO                 varchar(100),
   primary key (COD_MEDICAMENTO)
);

/*==============================================================*/
/* Table: PARTO                                                 */
/*==============================================================*/
create table PARTO
(
   COD_PARTO            int not null auto_increment,
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
   PESO                 double,
   OBS                  text,
   primary key (COD_CRIA)
);

/*==============================================================*/
/* Table: PESAGEM                                               */
/*==============================================================*/
create table PESAGEM
(
   COD_PESAGEM          int not null auto_increment,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   PESO_ANIMAL          double,
   primary key (COD_PESAGEM)
);

/*==============================================================*/
/* Table: PROPRIEDADE                                           */
/*==============================================================*/
create table PROPRIEDADE
(
   COD_PROPRIEDADE      int not null auto_increment,
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
   COD_USUARIO          int not null auto_increment,
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
   COD_VENDA            int not null auto_increment,
   COD_ANIMAL           varchar(7),
   DATA                 varchar(10),
   VALOR_KG             double,
   COD_CLIENTE          int,
   NOTA_FISCAL          varchar(30),
   GTA                  varchar(20),
   OBS                  text,
   primary key (COD_VENDA)
);

alter table AGRUPAMENTO add constraint FK_REFERENCE_1 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table AGRUPAMENTO add constraint FK_REFERENCE_14 foreign key (COD_CRIADOR)
      references CRIADOR_PROPRIETARIO (COD_CRIADOR) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_REFERENCE_2 foreign key (COD_RACA)
      references RACA (COD_RACA) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_REFERENCE_3 foreign key (COD_LOCAL)
      references LOCAL1 (COD_LOCAL) on delete restrict on update restrict;

alter table BAIXA add constraint FK_REFERENCE_7 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table BAIXA add constraint FK_REFERENCE_8 foreign key (COD_CAUSAS_MORITS)
      references CAUSAS_MARTIS (COD_CAUSAS_MORITS) on delete restrict on update restrict;

alter table CLIENTES add constraint FK_REFERENCE_23 foreign key (COD_FONE)
      references FONE (COD_FONE) on delete restrict on update restrict;

alter table CLIENTES add constraint FK_REFERENCE_24 foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO) on delete restrict on update restrict;

alter table COBERTURAS add constraint FK_REFERENCE_4 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table COBERTURAS add constraint FK_REFERENCE_5 foreign key (COD_INSEMINADOR)
      references INSEMINADORES (COD_INSEMINADOR) on delete restrict on update restrict;

alter table COLETA_EMBRIOES add constraint FK_REFERENCE_15 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table COLETA_EMBRIOES add constraint FK_REFERENCE_16 foreign key (COD_FUNCIONARIO)
      references FUNCIONARIOS (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table CONTAS_PAGAR add constraint FK_REFERENCE_27 foreign key (COD_FORNECEDOR)
      references FORNECEDOR (COD_FORNECEDOR) on delete restrict on update restrict;

alter table CONTAS_RECEBER add constraint FK_REFERENCE_31 foreign key (COD_CLIENTE)
      references CLIENTES (COD_CLIENTE) on delete restrict on update restrict;

alter table DESMAMA add constraint FK_REFERENCE_29 foreign key (COD_CRIA)
      references PARTO_REGISTRO_CRIA (COD_CRIA) on delete restrict on update restrict;

alter table DESMAMA add constraint FK_REFERENCE_30 foreign key (COD_LOCAL)
      references LOCAL1 (COD_LOCAL) on delete restrict on update restrict;

alter table DIAGNOSTICO add constraint FK_REFERENCE_20 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table EVENTO_SANITARIO add constraint FK_REFERENCE_10 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table EVENTO_SANITARIO add constraint FK_REFERENCE_11 foreign key (COD_MEDICAMENTO)
      references MEDICAMENTOS (COD_MEDICAMENTO) on delete restrict on update restrict;

alter table EVENTO_SANITARIO add constraint FK_REFERENCE_9 foreign key (COD_EVENTO_SANITARIO_ZOOTECNICO)
      references EVENTOS_SANITARIOS_ZOOTECNICOS (COD_EVENTO_SANITARIO_ZOOTECNICO) on delete restrict on update restrict;

alter table FORNECEDOR add constraint FK_REFERENCE_25 foreign key (COD_FONE)
      references FONE (COD_FONE) on delete restrict on update restrict;

alter table FORNECEDOR add constraint FK_REFERENCE_26 foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO) on delete restrict on update restrict;

alter table FUNCIONARIOS add constraint FK_REFERENCE_18 foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO) on delete restrict on update restrict;

alter table FUNCIONARIOS add constraint FK_REFERENCE_19 foreign key (COD_FONE)
      references FONE (COD_FONE) on delete restrict on update restrict;

alter table INSEMINADORES add constraint FK_REFERENCE_6 foreign key (COD_FUNCIONARIO)
      references FUNCIONARIOS (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table PARTO add constraint FK_REFERENCE_17 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table PARTO_REGISTRO_CRIA add constraint FK_REFERENCE_28 foreign key (COD_RACA)
      references RACA (COD_RACA) on delete restrict on update restrict;

alter table PESAGEM add constraint FK_REFERENCE_13 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table USUARIOS add constraint FK_REFERENCE_12 foreign key (COD_FUNCIONARIO)
      references FUNCIONARIOS (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table VENDA_ANIMAIS add constraint FK_REFERENCE_21 foreign key (COD_ANIMAL)
      references ANIMAL (COD_ANIMAL) on delete restrict on update restrict;

alter table VENDA_ANIMAIS add constraint FK_REFERENCE_22 foreign key (COD_CLIENTE)
      references CLIENTES (COD_CLIENTE) on delete restrict on update restrict;

