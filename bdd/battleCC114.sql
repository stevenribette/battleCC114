drop table if exists DEMANDE_INSCRIPTION;

drop table if exists JEUX;

drop table if exists JOUEUR;

drop table if exists JOUEUR_PARTIE;

drop table if exists JOUEUR_TOURNOI;

drop table if exists PARTIE;

drop table if exists PARTIE_TOURNOI;

drop table if exists SCORE;

drop table if exists TOURNOI;

/*==============================================================*/
/* Table : DEMANDE_INSCRIPTION                                  */
/*==============================================================*/
create table DEMANDE_INSCRIPTION
(
   DI_ID                int PRIMARY_KEY,
   JOU_ID               int not null,
   DI_STATUT            boolean not null
);

/*==============================================================*/
/* Table : JEUX                                                 */
/*==============================================================*/
create table JEUX
(
   JEU_ID               int PRIMARY_KEY,
   JEU_NOM              varchar(256) not null,
   JEU_IMG              varchar(256) not null,
   JEU_P_MIN            int not null,
   JEU_P_MAX            int,
   JEU_XP_VICTOIRE      decimal(10,2) not null
);

/*==============================================================*/
/* Table : JOUEUR                                               */
/*==============================================================*/
create table JOUEUR
(
   JOU_ID               int PRIMARY_KEY,
   JOU_NAME             varchar(256) not null,
   JOU_IMG              varchar(256) not null,
   JOU_MDP              varchar(256) not null,
   JOU_MAIL             varchar(256) not null,
   JOU_XP               decimal(10,2) not null,
   JOU_ROLE             boolean not null
);

/*==============================================================*/
/* Table : JOUEUR_PARTIE                                        */
/*==============================================================*/
create table JOUEUR_PARTIE
(
   JP_ID                decimal(10,2) PRIMARY_KEY,
   PAR_ID               int not null,
   JOU_ID               int not null
);

/*==============================================================*/
/* Table : JOUEUR_TOURNOI                                       */
/*==============================================================*/
create table JOUEUR_TOURNOI
(
   JT_ID                int PRIMARY_KEY,
   TOU_ID               int not null,
   JOU_ID               int not null
);

/*==============================================================*/
/* Table : PARTIE                                               */
/*==============================================================*/
create table PARTIE
(
   PAR_ID               int PRIMARY_KEY,
   PAR_DATE             date not null,
   JEU_ID               int not null
);

/*==============================================================*/
/* Table : PARTIE_TOURNOI                                       */
/*==============================================================*/
create table PARTIE_TOURNOI
(
   PT_ID                int PRIMARY_KEY,
   TOU_ID               int not null,
   PAR_ID               int not null
);

/*==============================================================*/
/* Table : SCORE                                                */
/*==============================================================*/
create table SCORE
(
   SCO_ID               int PRIMARY_KEY,
   JP_ID                int not null,
   SCO_VALUE            decimal(10,2) not null
);

/*==============================================================*/
/* Table : TOURNOI                                              */
/*==============================================================*/
create table TOURNOI
(
   TOU_ID               int PRIMARY_KEY,
   TOU_NAME             varchar(256) not null,
   TOU_DATE             date not null,
   JEU_ID               int not null,
);