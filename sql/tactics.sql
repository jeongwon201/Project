CREATE TABLESPACE tactics DATAFILE
'tactics' SIZE 2048M AUTOEXTEND ON NEXT 4M;

CREATE USER tactics IDENTIFIED BY tactics DEFAULT TABLESPACE tactics;
GRANT connect, resource, dba TO tactics;

CONNECT tactics/tactics@localhost;

CREATE TABLE tactics_member ( 
    userid       VARCHAR2(40)   NOT NULL,
    userpw       VARCHAR2(500),
    username     VARCHAR2(40),
    regdate      DATE,
    CONSTRAINT tactics_mamber_pk PRIMARY KEY (userid)
) TABLESPACE tactics;

CREATE TABLE tactics_tactics ( 
    tno         NUMBER(6)   NOT NULL,
    title       VARCHAR2(40),
    url         VARCHAR2(100),
    userid      VARCHAR2(40),
    CONSTRAINT tactics_tactics_pk PRIMARY KEY (tno)
) TABLESPACE tactics;

CREATE SEQUENCE tactics_tactics_seq 
    INCREMENT BY 1 START WITH 1
    MINVALUE 1 MAXVALUE 9999
    NOCYCLE NOCACHE NOORDER;

CREATE TABLE tactics_board ( 
    bno         NUMBER(6)  NOT NULL,
    title       VARCHAR2(100),
    content     VARCHAR2(1000),
    userid      VARCHAR2(40),
    regdate     DATE,
    hit         NUMBER(6),
    tno         NUMBER(6),
    CONSTRAINT tactics_board_pk PRIMARY KEY (bno)
) TABLESPACE tactics;

CREATE SEQUENCE tactics_board_seq
    INCREMENT BY 1 START WITH 1
    MINVALUE 1 MAXVALUE 9999
    NOCYCLE NOCACHE NOORDER;

CREATE TABLE tactics_reply ( 
    bno         NUMBER(6)  NOT NULL,
    rno         VARCHAR2(40),
    content     VARCHAR2(1000),
    userid      VARCHAR2(40),
    regdate     DATE,
    CONSTRAINT tactics_reply_pk PRIMARY KEY (rno)
) TABLESPACE tactics;

CREATE SEQUENCE tactics_reply_seq 
    INCREMENT BY 1 START WITH 1
    MINVALUE 1 MAXVALUE 9999
    NOCYCLE NOCACHE NOORDER;