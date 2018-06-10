alter table CHOISIR
   drop constraint FK_CHOISIR_CHOISIR_FACTURE;

alter table CHOISIR
   drop constraint FK_CHOISIR_CHOISIR2_CHAMBREB;

alter table ETAPE
   drop constraint FK_ETAPE_ASSOCIER_TOUR;

alter table FACTURE
   drop constraint FK_FACTURE_ACHAT_CLIENT;

alter table FACTURE
   drop constraint FK_FACTURE_DEPLACER_TRANSFER;

alter table GROUPE
   drop constraint FK_GROUPE_GROUPE_GUIDE;

alter table GROUPE
   drop constraint FK_GROUPE_GROUPE2_CLIENT;

alter table GROUPE
   drop constraint FK_GROUPE_GROUPE3_ETAPE;

alter table INSCRIPTION
   drop constraint FK_INSCRIPT_INSCRIPTI_CLIENT;

alter table INSCRIPTION
   drop constraint FK_INSCRIPT_INSCRIPTI_TOUR;

alter table INSCRIPTION
   drop constraint FK_INSCRIPT_INSCRIPTI_FACTURE;

alter table LIEU
   drop constraint FK_LIEU_VISITER_VILLE;

alter table SEJOURNER
   drop constraint FK_SEJOURNE_SEJOURNER_HOTEL;

alter table SEJOURNER
   drop constraint FK_SEJOURNE_SEJOURNER_VILLE;

alter table SEJOURNER
   drop constraint FK_SEJOURNE_SEJOURNER_ETAPE;

alter table TOUR
   drop constraint FK_TOUR_ESTIMER_PRIX_DE_;

drop table CHAMBREBIS cascade constraints;

drop table CHOISIR cascade constraints;

drop table CLIENT cascade constraints;

drop table ETAPE cascade constraints;

drop table FACTURE cascade constraints;

drop table GROUPE cascade constraints;

drop table GUIDE cascade constraints;

drop table HOTEL cascade constraints;

drop table INSCRIPTION cascade constraints;

drop table LIEU cascade constraints;

drop table PRIX_DE_BASE cascade constraints;

drop table SEJOURNER cascade constraints;

drop table TOUR cascade constraints;

drop table TRANSFERTBIS cascade constraints;

drop table VILLE cascade constraints;

/*==============================================================*/
/* Table : CHAMBREBIS                                           */
/*==============================================================*/
create table CHAMBREBIS 
(
   CHAMBRE_DEMANDE      VARCHAR(30)                 not null,
   constraint PK_CHAMBREBIS primary key (CHAMBRE_DEMANDE)
);

/*==============================================================*/
/* Table : CHOISIR                                              */
/*==============================================================*/
create table CHOISIR 
(
   CHAMBRE_DEMANDE      VARCHAR(30)                 not null,
   NUMERO_FACTURE       INTEGER              not null,
   constraint PK_CHOISIR primary key (CHAMBRE_DEMANDE, NUMERO_FACTURE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT 
(
   NUMERO               INTEGER              not null,
   NOM                  VARCHAR(30),
   PRENOM               VARCHAR(30),
   DATE_DE_NAISSANCE    VARCHAR(30),
   ADDRESSE             VARCHAR(255),
   TELEPHONE            VARCHAR(30),
   constraint PK_CLIENT primary key (NUMERO)
);

/*==============================================================*/
/* Table : ETAPE                                                */
/*==============================================================*/
create table ETAPE 
(
   REPAS                INTEGER,
   DATE_DEPART_COURANT  DATE                 not null,
   NUMERO_TOUR          INTEGER              not null,
   constraint PK_ETAPE primary key (DATE_DEPART_COURANT)
);

/*==============================================================*/
/* Table : FACTURE                                              */
/*==============================================================*/
create table FACTURE 
(
   NUMERO_FACTURE       INTEGER              not null,
   VILLE_CLIENT         VARCHAR(30),
   NUMERO               INTEGER              not null,
   DATE_DE_PAIEMENT     DATE,
   constraint PK_FACTURE primary key (NUMERO_FACTURE)
);

/*==============================================================*/
/* Table : GROUPE                                               */
/*==============================================================*/
create table GROUPE 
(
   GUI_NUMERO           INTEGER              not null,
   NUMERO               INTEGER              not null,
   DATE_DEPART_COURANT  DATE                 not null,
   constraint PK_GROUPE primary key (GUI_NUMERO, NUMERO, DATE_DEPART_COURANT)
);

/*==============================================================*/
/* Table : GUIDE                                                */
/*==============================================================*/
create table GUIDE 
(
   NUMERO               INTEGER              not null,
   NOM                  VARCHAR(30),
   PRENOM               VARCHAR(30),
   DATE_DE_NAISSANCE    VARCHAR(30),
   ADDRESSE             VARCHAR(255),
   TELEPHONE            VARCHAR(30),
   constraint PK_GUIDE primary key (NUMERO)
);

/*==============================================================*/
/* Table : HOTEL                                                */
/*==============================================================*/
create table HOTEL 
(
   NOM_HOTEL            VARCHAR(30)                 not null,
   ADDRESSE_HOTEL       VARCHAR(255),
   CATEGORIE__ETOILE_   SMALLINT,
   constraint PK_HOTEL primary key (NOM_HOTEL)
);

/*==============================================================*/
/* Table : INSCRIPTION                                          */
/*==============================================================*/
create table INSCRIPTION 
(
   NUMERO               INTEGER              not null,
   NUMERO_TOUR          INTEGER              not null,
   NUMERO_FACTURE       INTEGER              not null,
   constraint PK_INSCRIPTION primary key (NUMERO, NUMERO_TOUR, NUMERO_FACTURE)
);

/*==============================================================*/
/* Table : LIEU                                                 */
/*==============================================================*/
create table LIEU 
(
   NOM_LIEU             VARCHAR(30)                 not null,
   NOM_VILLE            VARCHAR(30)                 not null,
   NOM__PAYS            VARCHAR(30)                 not null,
   DESCRIPTION_LIEU     VARCHAR(30),
   constraint PK_LIEU primary key (NOM_LIEU)
);

/*==============================================================*/
/* Table : PRIX_DE_BASE                                         */
/*==============================================================*/
create table PRIX_DE_BASE 
(
   DATE_DEPART_INITIALE DATE                 not null,
   ALLER                INTEGER,
   RETOUR               INTEGER,
   CHAMBRE              VARCHAR(30),
   ASSURANCE_RAPATRIEMENT VARCHAR(30),
   constraint PK_PRIX_DE_BASE primary key (DATE_DEPART_INITIALE)
);

/*==============================================================*/
/* Table : SEJOURNER                                            */
/*==============================================================*/
create table SEJOURNER 
(
   NOM_VILLE            VARCHAR(30)                 not null,
   NOM__PAYS            VARCHAR(30)                 not null,
   DATE_DEPART_COURANT  DATE                 not null,
   NOM_HOTEL            VARCHAR(30)                 not null,
   constraint PK_SEJOURNER primary key (NOM_VILLE, NOM__PAYS, DATE_DEPART_COURANT, NOM_HOTEL)
);

/*==============================================================*/
/* Table : TOUR                                                 */
/*==============================================================*/
create table TOUR 
(
   VILLE_DEPART         VARCHAR(30),
   VILLE_ARRIVEE        VARCHAR(30),
   DATE_ARRIVEE         DATE                 not null,
   JOUR                 INTEGER,
   NUIT                 INTEGER,
   MOYEN_TRANSPORT      VARCHAR(30),
   NUMERO_TOUR          INTEGER              not null,
   DATE_DEPART_INITIALE DATE                 not null,
   constraint PK_TOUR primary key (NUMERO_TOUR)
);

/*==============================================================*/
/* Table : TRANSFERTBIS                                         */
/*==============================================================*/
create table TRANSFERTBIS 
(
   VILLE_CLIENT         VARCHAR(30)                 not null,
   constraint PK_TRANSFERTBIS primary key (VILLE_CLIENT)
);

/*==============================================================*/
/* Table : VILLE                                                */
/*==============================================================*/
create table VILLE 
(
   NOM_VILLE            VARCHAR(30)                 not null,
   NOM__PAYS            VARCHAR(30)                 not null,
   POISTION_GEOGRPAHIQUE VARCHAR(30),
   DESCRIPITION_VILLE   VARCHAR(30),
   ASPECT_CARACTERISTIQUE VARCHAR(30),
   constraint PK_VILLE primary key (NOM_VILLE, NOM__PAYS)
);

alter table CHOISIR
   add constraint FK_CHOISIR_CHOISIR_FACTURE foreign key (NUMERO_FACTURE)
      references FACTURE (NUMERO_FACTURE);

alter table CHOISIR
   add constraint FK_CHOISIR_CHOISIR2_CHAMBREB foreign key (CHAMBRE_DEMANDE)
      references CHAMBREBIS (CHAMBRE_DEMANDE);

alter table ETAPE
   add constraint FK_ETAPE_ASSOCIER_TOUR foreign key (NUMERO_TOUR)
      references TOUR (NUMERO_TOUR);

alter table FACTURE
   add constraint FK_FACTURE_ACHAT_CLIENT foreign key (NUMERO)
      references CLIENT (NUMERO);

alter table FACTURE
   add constraint FK_FACTURE_DEPLACER_TRANSFER foreign key (VILLE_CLIENT)
      references TRANSFERTBIS (VILLE_CLIENT);

alter table GROUPE
   add constraint FK_GROUPE_GROUPE_GUIDE foreign key (GUI_NUMERO)
      references GUIDE (NUMERO);

alter table GROUPE
   add constraint FK_GROUPE_GROUPE2_CLIENT foreign key (NUMERO)
      references CLIENT (NUMERO);

alter table GROUPE
   add constraint FK_GROUPE_GROUPE3_ETAPE foreign key (DATE_DEPART_COURANT)
      references ETAPE (DATE_DEPART_COURANT);

alter table INSCRIPTION
   add constraint FK_INSCRIPT_INSCRIPTI_CLIENT foreign key (NUMERO)
      references CLIENT (NUMERO);

alter table INSCRIPTION
   add constraint FK_INSCRIPT_INSCRIPTI_TOUR foreign key (NUMERO_TOUR)
      references TOUR (NUMERO_TOUR);

alter table INSCRIPTION
   add constraint FK_INSCRIPT_INSCRIPTI_FACTURE foreign key (NUMERO_FACTURE)
      references FACTURE (NUMERO_FACTURE);

alter table LIEU
   add constraint FK_LIEU_VISITER_VILLE foreign key (NOM_VILLE, NOM__PAYS)
      references VILLE (NOM_VILLE, NOM__PAYS);

alter table SEJOURNER
   add constraint FK_SEJOURNE_SEJOURNER_HOTEL foreign key (NOM_HOTEL)
      references HOTEL (NOM_HOTEL);

alter table SEJOURNER
   add constraint FK_SEJOURNE_SEJOURNER_VILLE foreign key (NOM_VILLE, NOM__PAYS)
      references VILLE (NOM_VILLE, NOM__PAYS);

alter table SEJOURNER
   add constraint FK_SEJOURNE_SEJOURNER_ETAPE foreign key (DATE_DEPART_COURANT)
      references ETAPE (DATE_DEPART_COURANT);

alter table TOUR
   add constraint FK_TOUR_ESTIMER_PRIX_DE_ foreign key (DATE_DEPART_INITIALE)
      references PRIX_DE_BASE (DATE_DEPART_INITIALE);
