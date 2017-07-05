drop table if exists buyOrderCommentRecord;
drop table if exists lendOrderCommentRecord;
drop table if exists creditChangeRecord;
drop table if exists coinChangeRecord;
drop table if exists buyOrderFeedback;
drop table if exists lendOrderFeedback;
drop table if exists buyOrder;
drop table if exists lendOrder;
drop table if exists bookIN;
drop table if exists bookComment;
drop table if exists book;
drop table if exists admin;
drop table if exists user;


/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table user
(
   userID               int                        	   not null auto_increment,
   userName             varchar(20)                    not null,
   password             varchar(20)                    not null,
   realName             varchar(20)                    not null,
   sex                  enum("male","female")          not null,
   phone                varchar(20)                    not null,
   email                varchar(20)                    not null,
   address              varchar(50)                    not null,
   registerDate         datetime                       not null,
   validationProblem    varchar(200)                   default null, 
   validationAnswer     varchar(200)                   default null,
   credit               int                            not null default 0,
   bookCoin             int                            not null default 0,
   primary key (userID),
   unique (userName)
);



/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin 
(
   adminID              int                            not null auto_increment,
   password             varchar(20)                    not null,
   realName             varchar(20)                    not null,
   sex                  enum("male","female")          not null,
   phone                varchar(20)                    not null,
   email                varchar(20)                    not null,
   address              varchar(50)                    not null,
   primary key (adminID)
);



/*==============================================================*/
/* Table: book                                                  */
/*==============================================================*/
create table book 
(
   ISBN                 varchar(20)                    not null,
   bookName             varchar(200)                    not null,
   author               varchar(200)                    not null,
   publisher            varchar(200)                    not null,
   pageNumber           int                            not null,
   price                varchar(50)                 not null,
   doubanRate           float                          default null,	/*豆瓣评分*/
   raterNumber          int                            default null,	/*豆瓣上参与评分人数*/
   summary              text,						   
   image                text,	
   lastUpdateTime		datetime					   default null,
   pubdate				varchar(50)					   default null,
   primary key (ISBN)
);



/*==============================================================*/
/* Table: bookComment                                           */
/*==============================================================*/
create table bookComment 
(
   ID                   int                            not null auto_increment,
   ISBN                 varchar(20)                    not null,
   userName               varchar(20)                            not null,
   commentTime          datetime                       not null,
   content              text                           not null,
   checkResult          enum("pass","reject")          default null,
   primary key (ID)
);

alter table bookComment add constraint FK_Reference_1 foreign key (ISBN)
      references book (ISBN) on update cascade on delete cascade;

alter table bookComment add constraint FK_Referance_2 foreign key (userName)
      references user (userName) on update cascade on delete cascade;






/*==============================================================*/
/* Table: bookIN                                                */
/*==============================================================*/
create table bookIN 
(
   bookRecordID         int                            not null auto_increment,
   userID               int                            not null,
   ISBN                 varchar(20)                    not null,
   recency              enum("20%","50%","80%","100%") not null,
   inTime               datetime                       not null,
   coinNumber           int                            not null,
   ownerName            varchar(20)                    not null,
   type                 enum("lend","sell")            not null,
   sendWay              varchar(200)                   not null,
   city                 varchar(20)                    not null,
   latestReturnDate     datetime                       default null,	/*借书时才需要*/
   ownerPhone           varchar(20)                    not null,
   ownerAddress         varchar(50)                    default null,	/*借书时才需要*/
   inStatus             enum("yes","no")               not null,
   note					text						   default null,
   province				varchar(20)					   not null,
   primary key (bookRecordID)
);

alter table bookIN
   add constraint FK_Reference_3 foreign key (userID) 
		references user (userID) on update cascade on delete cascade;
        
alter table bookIN
	add constraint FK_Reference_4 foreign key(ISBN)
		references book(ISBN) on update cascade on delete cascade;




/*==============================================================*/
/* Table: lendOrder                                             */
/*==============================================================*/
create table lendOrder 
(
   lendID               int                            not null auto_increment,
   bookRecordID         int                            not null,
   lenderID             int                            not null,
   returnWay            text                           not null,
   lendAddress          varchar(50)                    not null,
   lendPhone            varchar(20)                    not null,
   receiver             varchar(20)                    not null,
   arrivalTime          datetime                       default null,
   returnTime           datetime                       default null,
   status               enum("0","1","2","3","4","5","6","7","8","9")  not null,	/*0~9各自有不同含义*/
   ownerID				int 						   not null,
   primary key (lendID)
);

alter table lendOrder
   add constraint FK_Reference_5 foreign key (lenderID)
      references user (userID) on update cascade on delete cascade;

alter table lendOrder
   add constraint FK_Reference_6 foreign key (bookRecordID)
      references bookIN (bookRecordID) on update cascade on delete cascade;
      
alter table lendOrder
	add constraint FK_Reference_7 foreign key (ownerID)
		references user(userID) on update cascade on delete cascade;





/*==============================================================*/
/* Table: buyOrder                                              */
/*==============================================================*/
create table buyOrder 
(
   buyID                int                            not null auto_increment,
   bookRecordID         int                            not null,
   buyerID              int                            not null,
   buyAddress           varchar(50)                    not null,
   buyPhone             varchar(20)                    not null,
   receiver             varchar(20)                    not null,
   arrivalTime          datetime                       default null,
   status               enum("0","1","2","3","4","5")  not null,	/*0~5各有不同含义*/
   ownerID              int                            not null,
   primary key (buyID)
);

alter table buyOrder
   add constraint FK_Reference_8 foreign key (buyerID)
      references user (userID) on update cascade on delete cascade;

alter table buyOrder
   add constraint FK_Reference_9 foreign key (bookRecordID)
      references bookIN (bookRecordID) on update cascade on delete cascade;
	
alter table buyOrder
	add constraint FK_Reference_10 foreign key(ownerID)
		references user(userID) on update cascade on delete cascade;
        




/*==============================================================*/
/* Table: lendOrderFeedback                                     */
/*==============================================================*/
create table lendOrderFeedback 
(
   ID                   int                        	   not null auto_increment,
   lendID               int                            not null,
   topic                varchar(50)                    not null,
   content              text                           not null,
   time                 datetime                       not null,
   handleResult         text                           default null,
   adminID              int                        	   default null,
   userID               int(11)                        not null,
   primary key (ID)
);

alter table lendOrderFeedback
   add constraint FK_Reference_11 foreign key (lendID)
      references lendOrder (lendID) on update cascade on delete cascade;

alter table lendOrderFeedback
   add constraint FK_Reference_12 foreign key (userID)
      references user (userID) on update cascade on delete cascade;

alter table lendOrderFeedback
   add constraint FK_Reference_13 foreign key (adminID)
      references admin (adminID) on update cascade on delete cascade;
      




/*==============================================================*/
/* Table: buyOrderFeedback                                      */
/*==============================================================*/
create table buyOrderFeedback 
(
   ID                   int                            not null auto_increment,
   buyID                int                            not null,
   topic                varchar(50)                    not null,
   content              text                           not null,
   time                 datetime                       not null,
   handleResult         text                           default null,
   adminID              int                            default null,
   userID               int                            not null,
   primary key (ID)
);

alter table buyOrderFeedback
   add constraint FK_Reference_14 foreign key (adminID)
      references admin (adminID) on update cascade on delete cascade;

alter table buyOrderFeedback
   add constraint FK_Reference_15 foreign key (buyID)
      references buyOrder (buyID) on update cascade on delete cascade;

alter table buyOrderFeedback
   add constraint FK_Reference_16 foreign key (userID)
      references user (userID) on update cascade on delete cascade;
      




/*==============================================================*/
/* Table: coinChangeRecord                                      */
/*==============================================================*/
create table coinChangeRecord 
(
   ID                   int                            not null auto_increment,
   userID               int                            not null,
   number               int                            not null,
   time                 datetime                       not null,
   reason               enum("buy","sell","lendin","lendout","other") not null,
   primary key (ID)
);

alter table coinChangeRecord
   add constraint FK_Reference_17 foreign key (userID)
      references user (userID) on update cascade on delete cascade;






/*==============================================================*/
/* Table: creditChangeRecord                                    */
/*==============================================================*/
create table creditChangeRecord 
(
   ID                   int                            not null auto_increment,
   userID               int                            not null,
   number               int                            not null,
   time                 datetime                       not null,
   reason               enum("good seller","good lendin","good lendout","bad seller","bad lendin","bad lendout","other")  not null,
   primary key(ID)
);

alter table creditChangeRecord
   add constraint FK_Reference_18 foreign key (userID)
      references user (userID) on update cascade on delete cascade;





/*==============================================================*/
/* Table: lendOrderCommentRecord                                */
/*==============================================================*/
create table lendOrderCommentRecord 
(
   ID                   int                            not null auto_increment,
   commentType          enum("good","normal","bad")    not null,
   lendID               int                            not null,
   commenterID          int                            not null,
   content              text                           default null,
   primary key (ID)
);

alter table lendOrderCommentRecord
   add constraint FK_Reference_19 foreign key (commenterID)
      references user (userID) on update cascade on delete cascade;

alter table lendOrderCommentRecord
   add constraint FK_Reference_20 foreign key (lendID)
      references lendOrder (lendID) on update cascade on delete cascade;





/*==============================================================*/
/* Table: buyOrderCommentRecord                                 */
/*==============================================================*/
create table buyOrderCommentRecord 
(
   ID                   int                            not null auto_increment,
   buyID                int                            not null,
   commenterID          int                            not null,
   commentType          enum("good","normal","bad")    not null,
   content              text                           default null,
   primary key(ID)
);

alter table buyOrderCommentRecord
   add constraint FK_Reference_21 foreign key (commenterID)
      references user (userID) on update cascade on delete cascade;

alter table buyOrderCommentRecord
   add constraint FK_Reference_22 foreign key (buyID)
      references buyOrder (buyID) on update cascade on delete cascade;


