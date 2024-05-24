create database KaitechControl;

use KaitechControl;

#CRIAÇÃO DAS TABELAS


-- ControleDeResiduo:
-- id  pesoKg  status  dataArmazenamento   areaGeracaoDeResiduo  turnoDeGeracao
 -- ResiduoEletronico : nomeEquipamento,  quantE
-- ResiduoQuimico: estadoFisico  ,codigONU


create table ControleDeResiduo
(
	id primary key not null,
	cod_controlededesiduo int auto_increment primary key not null,
	pesoKg double not null,
	status varchar(50) not null,
	dataArmazenamento varchar(50) null,
	areaGeracaoDeResiduo varchar(50) null,
	turnoDeGeracao varchar(30) null
    );
    
create table ResiduoEletronico
(
	id primary key not null,
	cod_residuoeltronico int auto_increment primary key not null,
	cod_controlededesiduo int not null,
	nomeEquipamento varchar(50) null,
	dataArmazenamento varchar(50) null,
    quantE	 double not null,
	nome_categoria varchar(20) not null
);

create table ResiduoQuimico
(
	cod_residuoquimico int auto_increment primary key not null,
	cod_controlededesiduo int not null,
	estadoFisico varchar(30) not null,
    codigONU char(4) not null
    
);

create table Residuo
(
	cod_residuo int auto_increment not null,
	cod_controlededesiduo int not null,
	cod_residuoeltronico int not null,
    cod_residuoquimico int not null,
	constraint pk_residuo_controlededesiduo primary key(cod_residuo, cod_controlededesiduo, cod_residuoeltronico,cod_residuoquimico)
);
#CRIAÇÃO DOS RELACIONAMENTOS 
#residuo - ControleDeResiduos
alter table Residuo add constraint fk_residuo_controlededesiduo foreign key (cod_controlededesiduo) 
references ControleDeResiduo(cod_controlededesiduo);

#ResiduoEletronico - ControleDeResiduos
alter table ResiduoEletronico add constraint fk_residuoeltronico_controlededesiduo foreign key (cod_controlededesiduo) 
references ControleDeResiduo(cod_controlededesiduo);

#ResiduoQuimico - ControleDeResiduos
alter table ResiduoQuimico add constraint fk_residuoquimico_controlededesiduo foreign key (cod_controlededesiduo)
 references ControleDeResiduo(cod_controlededesiduo);
 
 select * from ControleDeResiduo;

