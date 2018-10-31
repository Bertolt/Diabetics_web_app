#---------- DIABETESBD ----------
	#DROP
    drop database if exists diabetes;
    #CREATE
    create database if not exists diabetes;
	#SHOW TABLES
    show tables from diabetes;





#---------- UTILIZADORES ----------
	#DROP
	drop table if exists diabetes.registo_user;
    #CREATE
    create table diabetes.registo_user(
		user_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
		nome VARCHAR(60) NOT NULL, 
		email VARCHAR(20) NOT NULL, 
		telefone INT(12) NOT NULL, 
		morada VARCHAR(100) NOT NULL, 
		nivel INT(5) NOT NULL, 
		data_reg DATE NOT NULL, 
		username INT NOT NULL INDEX UNIQUE;
	#INSERT
	insert into diabetes.registo_user(
		user_number, 
        nome, 
        email, 
        telefone, 
        morada, 
        nivel,
        data_reg)
	values( 
		"admin",
        "dmin@admin.pt", 
        "9289652314", 
        "Porto", 
        1, 
        "2015-12-10");
	#DELETE
    delete from diabetes.registo_user where user_number=1;
    #RESET AUTO_INCREMENT
    ALTER TABLE diabetes.registo_user AUTO_INCREMENT=1;
    #SELECT
    SELECT * FROM diabetes.registo_user;
	#UPDATE
    update diabetes.registo_user set util_nome="admin admin" where user_number=7;



#---------- UTENTES ----------
	#DROP
	drop table if exists diabetes.registo_utente;
    #CREATE
    create table diabetes.registo_utente(
		ut_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
		nome VARCHAR(45) NOT NULL, 
		morada VARCHAR(45) NOT NULL, 
		telefone INT(10) NOT NULL,
		email VARCHAR(20) NOT NULL,
		data_nasc DATE NOT NULL, 
		sexo BOOLEAN NOT NULL, 
		data_reg_ut DATE NOT NULL, 
		data_prox_consulta DATE NOT NULL,
		username VARCHAR(20) NOT NULL,
		alta boolean NOT NULL DEFAULT 0,
        FOREIGN KEY (username) REFERENCES diabetes.registo_user(username));
	#INSERT
	insert into diabetes.registo_utente(
		nome, 
        morada, 
        telefone, 
        email, 
        data_nasc,
		sexo, 
        data_reg_ut, 
        data_prox_consulta,
        username,
		alta)
	values( 
		"antonio",
        "Porto", 
        9547896321, 
        "antonio@mail.pt", 
        "1", 
        "2014-10-03",
		"2016-02-01", 
        "rbertelo",
        0);
	#DELETE
    delete from diabetes.registo_utente where ut_number=1;
    #RESET AUTO_INCREMENT
    ALTER TABLE diabetes.registo_utente AUTO_INCREMENT=1;
    #SELECT
    SELECT * FROM diabetes.registo_utente;
	#UPDATE
    update diabetes.registo_utente set nome="Jose" where ut_number=7;



#---------- AUTENTICACAO ----------
	#DROP
    drop table if exists diabetes.login;
    #CREATE
    create table diabetes.login(
		user_number int not null,
		aut_password varchar(45) not null,
        foreign key (user_number) references diabetes.registo_user(user_number));
	#INSERT
	insert into diabetes.login(
		user_number,
		aut_password)
	values(
		(SELECT  user_number FROM registo_user WHERE username = "admin"),
		"admin");
	#DELETE
    delete from diabetes.login where user_number=1;
    #SELECT
    select * from diabetes.login;
	#UPDATE
    update diabetes.login set password="administrad" where user_number=1;




#---------- PRIMEIRA CONSULTA ----------
	#DROP
	drop table if exists diabetes.primeira_consulta;
    #CREATE
    create table diabetes.primeira_consulta(
		ut_number INT NOT NULL, 
		data_consulta DATE NOT NULL, 
		tip_diabetes VARCHAR(12) NOT NULL, 
		data_diag DATE,
		insulina INT(2) NOT NULL,
		antecedentes INT(10) NOT NULL,
		neurop INT(2) NOT NULL, 
		retinop INT(2) NOT NULL,
		nefrop INT(2) NOT NULL, 
		eam INT(2) NOT NULL,
		avc INT(2) NOT NULL, 
		fumador INT(2) NOT NULL, 
		perf_lipidico INT(2) NOT NULL,
		username VARCHAR(20) NOT NULL,
		FOREIGN KEY (username) REFERENCES diabetes.registo_user(username),
		FOREIGN KEY (ut_number) REFERENCES diabetes.registo_uTENTE(ut_number));
	#INSERT
    insert into diabetes.primeira_consultas(
		ut_number, 
        data_consulta, 
        tip_diabetes, 
        data_diag, 
        insulina,
		antecedentes, 
        neurop, 
        retinop,
        nefrop,
		eam, 
        avc, 
        fumador,
        perf_lipidico,
		username)
	values(
		3,
		"2016-02-01",
        "tip2", 
        "2014-10-03", 
        1, 
        1, 
        1,
		1,
		1, 
        1, 
        1,
		1,
		1,		
        "rbertelo");
	
    #SELECT
    select * from diabetes.primeira_consulta;
    SELECT data_diag FROM primeira_consulta WHERE ut_number=1;




#---------- SINAIS VITAIS ----------
	#DROP 
    drop table if exists diabetes.sinais_vitais;
    #CREATE 
    create table diabetes.sinais_vitais(
		ut_number INT NOT NULL, 
		data_consulta DATE NOT NULL, 
		pulso INT(10) NOT NULL, 
		parterial INT(10) NOT NULL,
		freq_resp INT(10) NOT NULL,
		temp INT(10) NOT NULL,
		spo2 INT(10) NOT NULL, 
		dor INT(10) NOT NULL,
		peso INT(10) NOT NULL, 
		altura INT(10) NOT NULL,
		bmi INT(10) NOT NULL, 
		p_adominal INT(10) NOT NULL, 
		exercicio INT(10) NOT NULL,
		cfv INT(10) NOT NULL, 
		hab_tabag INT(10) NOT NULL,
		username VARCHAR(20) NOT NULL,
		FOREIGN KEY (username) REFERENCES diabetes.registo_user(username),
		FOREIGN KEY (ut_number) REFERENCES diabetes.registo_uTENTE(ut_number));
	#INSERT
    insert into diabetes.sinais_vitais(
		ut_number, 
        data_consulta, 
        pulso, 
        parterial, 
        freq_resp,
		temp, 
        spo2, 
        dor,
        peso,
		altura, 
        bmi, 
        p_adominal,
        exercicio, 
        cfv,
        hab_tabag,
		username)
    values(
		3,
		"2016-02-01",
        80, 
        120, 
        20, 
        37, 
        95,
		2,
		60, 
        150, 
        27,
		80,
		2,
		2,
		0,		
        "rbertelo");
    #SELECT
    select * from diabetes.sinais_vitais WHERE ut_number=1;




#---------- TESTES RAPIDOS ----------
	#DROP
	drop table if exists diabetes.testes_rapidos;
    #CREATE
    create table ddiabetes.testes_rapidos(
		ut_number INT NOT NULL, 
		data_consulta DATE NOT NULL, 
		glicemia INT(10) NOT NULL, 
		cetonas INT(10) NOT NULL,
		proteinuria INT(10) NOT NULL,
		glicosuria INT(10) NOT NULL,
		c_cetonicos INT(10) NOT NULL, 
		ph INT(10) NOT NULL,
		debsidade INT(10) NOT NULL, 
		hematuria INT(10) NOT NULL,
		username VARCHAR(20) NOT NULL,
		FOREIGN KEY (username) REFERENCES diabetes.registo_user(username),
		FOREIGN KEY (ut_number) REFERENCES diabetes.registo_utente(ut_number));
	#INSERT
    insert into diabetes.testes_rapidos(
		ut_number, 
        data_consulta, 
        glicemia, 
        cetonas, 
        proteinuria,
		glicosuria, 
        c_cetonicos, 
        ph,
        debsidade,
		hematuria,
		username) 
	values (
		3,
		"2016-02-01",
        120, 
        0, 
        5, 
        2, 
        3,
		2,
		1, 
        0, 		
        "rbertelo");
	#SELECT
    select * from diabetes.testes_rapidos WHERE ut_number=1;




#---------- EXAME FISICO ----------
	#DROP
	drop table if exists diabetes.exame_fisico;
    #CREATE
    create table diabetes.exame_fisico(
		ut_number INT NOT NULL, 
		data_consulta DATE NOT NULL, 
		acuidade_visual INT(10) NOT NULL, 
		pe_sensibilidade INT(10) NOT NULL,
		pe_temp INT(10) NOT NULL,
		pe_pulsoperif INT(10) NOT NULL,
		pe_integridade INT(10) NOT NULL,
		username VARCHAR(20) NOT NULL,
		FOREIGN KEY (username) REFERENCES diabetes.registo_user(username),
		FOREIGN KEY (ut_number) REFERENCES diabetes.registo_utente(ut_number));
	#INSERT
    insert into diabetes.exame_fisico(
		ut_number, 
        data_consulta, 
        acuidade_visual, 
        pe_sensibilidade, 
        pe_temp,
		pe_pulsoperif, 
        pe_integridade,
		username)
    values(
		3,
		"2016-02-01",
		2, 
        3,
		2,
		1, 
        0, 		
        "rbertelo");
	#SELECT
    select * from diabetes.exame_fisico;
    select * from diabetes.exame_fisico where ut_number=4;
	
#---------- REFERENCIAS ----------
	#DROP
	drop table if exists diabetes.referencias;
    #CREATE
    create table diabetes.referencias(
		ut_number INT NOT NULL, 
		data_referencia DATE NOT NULL, 
		cardio INT(10) NOT NULL, 
		vascular INT(10) NOT NULL,
		oftal INT(10) NOT NULL,
		nefro INT(10) NOT NULL,
		fisio INT(10) NOT NULL, 
		ot INT(10) NOT NULL,
		tabag INT(10) NOT NULL, 
		username VARCHAR(20) NOT NULL,
		FOREIGN KEY (username) REFERENCES diabetes.registo_user(username),
		FOREIGN KEY (ut_number) REFERENCES diabetes.registo_utente(ut_number));
	#INSERT
    insert into diabetes.referencias(
		ut_number, 
        data_referencia, 
        cardio, 
        vascular,
		oftal, 
        nefro, 
        fisio,
        ot,
		tabag,
		username) 
	values (
		3,
		"2016-02-01",
        1, 
        0, 
        1, 
        1, 
        0,
		0,
		1, 
        0, 		
        "rbertelo");
	#SELECT
    select * from ddiabetes.referencias WHERE ut_number=1;




