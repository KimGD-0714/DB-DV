use DB_project;

create table user(
	ID varchar(50) not null primary key,
    PW varchar(45) not null,
    이름 varchar(45) not null,
    전화번호 varchar(13),
    주소 varchar(50),
    나이 INT not null,
    성별 char(1) not null,
    계좌번호 varchar(15) not null unique);
    
create table account(
	ID varchar(50) not null,
    계좌번호 varchar(15) not null,
    계좌금액 INT not null default 0,
    primary key (ID, 계좌번호),
    foreign key (ID) references user(ID)
		on delete cascade	on update cascade,
	foreign key (계좌번호) references user(계좌번호)
		on delete cascade	on update cascade);
        
create table event(
	종목코드 varchar(30) not null primary key,
    종목이름 varchar(45) not null);
    
create table enterprise(
	종목코드 varchar(30) not null,
    기업이름 varchar(50) not null,
    상장주식수 INT not null,
    기업개요 MEDIUMTEXT not null,
    primary key(종목코드),
    foreign key(종목코드) references event(종목코드)
		on delete cascade	on update cascade);
        
create table market(
	종목코드 varchar(30) not null,
    날짜 timestamp not null,
    Open INT not null DEFAULT 0,
    High INT not null DEFAULT 0,
    Low INT not null DEFAULT 0,
    Close INT not null DEFAULT 0,
    Volume INT unsigned not null DEFAULT 0,
    Changes DOUBLE not null DEFAULT 0,
    market_hit INT unsigned not null DEFAULT 0,
    primary key (종목코드, 날짜),
    foreign key (종목코드) references event(종목코드)
		on delete cascade	on update cascade);
        
create table trade_stock(
	idx INT unsigned not null primary key auto_increment,
    ID varchar(50) not null,
    종목코드 varchar(30) not null,
    거래량 INT not null,
    거래날짜 timestamp not null DEFAULT CURRENT_TIMESTAMP,
    거래유형 boolean not null,
    거래가격 INT unsigned not null,
    foreign key (ID) references user(ID)
		on delete cascade	on update cascade,
	foreign key (종목코드) references event(종목코드)
		on delete cascade	on update cascade);
        
create table user_have(
	ID varchar(50) not null,
    종목코드 varchar(30) not null,
    보유주식 INT not null DEFAULT 0,
    지분 DOUBLE not null,
    primary key (ID, 종목코드),
    foreign key (ID) references user(ID)
		on delete cascade	on update cascade,
	foreign key (종목코드) references event(종목코드)
		on delete cascade	on update cascade);
    
create table status(
	종목코드 varchar(30) not null,
    주요주주 varchar(100) not null,
    보유주식수 INT not null,
    보유지분 DOUBLE not null,
    primary key (종목코드, 주요주주),
    foreign key (종목코드) references event(종목코드)
		on delete cascade	on update cascade);
        
create table board(
	idx INT unsigned not null primary key auto_increment,
    ID varchar(50) not null,
    PW varchar(45) not null,
    title varchar(100) not null,
    content MEDIUMTEXT not null,
    hit INT unsigned not null DEFAULT 0,
    create_date timestamp not null DEFAULT CURRENT_TIMESTAMP,
    foreign key (ID) references user(ID)
		on delete cascade	on update cascade);