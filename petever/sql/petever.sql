--=================================
-- 관리자(system) 계정
--=================================
create user petever 
identified by petever
default tablespace users;

grant resource, connect to petever;


----------------------------
--테이블 드랍문
----------------------------
drop table animal_attach;
drop table animal_comment;
drop table animal_tag;
drop table report;
drop table animal_board;
drop table review_attach;
drop table review_comment;
drop table review_board;
drop table tb_user;
------------------------------

------------------------------ 
-- 테이블 생성
------------------------------
CREATE TABLE tb_user (
	user_id	VARCHAR2(30)	NOT NULL,
	user_pwd	VARCHAR2(300)	NOT NULL,
	user_email	VARCHAR2(100)	NOT NULL,
	user_birth_date	date NOT NULL,
	user_phone	 VARCHAR2(11)	NOT NULL,
	user_local	VARCHAR2(40)	NOT NULL,
	user_role	CHAR(1) default 'U' NOT NULL,
    constraints pk_user_id primary key(user_id),
    constraints ck_user_role check(user_role in ('U','A')) 
);


--CREATE TABLE message (
--	msg_num	NUMBER	NOT NULL,
--	user_id	VARCHAR2(30)	NOT NULL,
--	user_id_send	VARCHAR2(30)	NOT NULL,
--	msg_content	VARCHAR2(2000) NOT NULL,
--	msg_time	DATE	 default sysdate,
--    constraint pk_msg_num primary key (msg_num, user_id),
--    constraint fk_msg_user_id foreign key(user_id)
--                                    references "user"(user_id)
--);

CREATE TABLE animal_board (
	ani_bo_id	NUMBER	NOT NULL,
	user_id	VARCHAR2(30)	NOT NULL,
	ani_bo_title	VARCHAR(200) NOT NULL,
	ani_bo_content	VARCHAR2(3000)	NOT NULL,
	ani_bo_date DATE default sysdate,
	ani_bo_tag VARCHAR2(30) NOT NULL,
	ani_bo_local	VARCHAR2(1000)	NOT NULL,
   	ani_bo_type	VARCHAR2(20),
	ani_bo_kind	VARCHAR2(50),
	ani_bo_gender	 VARCHAR2(10),
	ani_bo_age	VARCHAR2(20),
	ani_bo_size	VARCHAR2(20),
	ani_bo_hair	VARCHAR2(50),
	ani_bo_color	VARCHAR2(50),
	ani_bo_cha VARCHAR2(500),
	ani_bo_miss_date	DATE,
    constraints pk_ani_bo_id primary key(ani_bo_id),
    constraints fk_ani_bo_user_id foreign key(user_id)
                                    references tb_user(user_id)
                                    on delete cascade
                           
);

CREATE TABLE animal_attach (
	ani_at_id	 NUMBER	NOT NULL,
	ani_bo_id 	NUMBER	NOT NULL,
	ani_at_original_name	VARCHAR2(300)	NULL	,
	ani_at_renamed_name	VARCHAR2(300)	NULL	,
	ani_at_upload_date DATE	default sysdate,
    constraints pk_ani_at_id primary key(ani_at_id, ani_bo_id),
    constraints fk_at_ani_bo_id foreign key(ani_bo_id)
                                    references animal_board(ani_bo_id)
                                    on delete cascade
);


--drop table animal_comment;
CREATE TABLE animal_comment (
	ani_co_id	NUMBER	NOT NULL	,
	ani_bo_id	NUMBER	NOT NULL	,
	user_id	VARCHAR2(30)	NOT NULL	,
	ani_co_content	VARCHAR(1000)	NOT NULL	,
	ani_co_level 	NUMBER default 1	NOT NULL	,
    ani_co_ref number,  --대댓글인 경우: 댓글번호 | 댓글인 경우 : null
	ani_co_date	 DATE default sysdate,
    constraints pk_ani_co_id primary key(ani_co_id),
    constraints fk_co_ani_bo_id foreign key(ani_bo_id)
                                    references animal_board(ani_bo_id)
                                    on delete cascade,
    constraints fk_co_user_id foreign key(user_id)
                                    references tb_user(user_id)
                                    on delete cascade,
    constraints ck_ani_co_level check (ani_co_level in('1','2')),
    constraints fk_ani_co_ref foreign key(ani_co_ref)
                                            references animal_comment(ani_co_id)
                                            on delete cascade
);


CREATE TABLE animal_tag (
	tag_ID NUMBER,
	tag_color VARCHAR2(100)	NOT NULL	,
	tag_font VARCHAR2(30)	NOT NULL	,
	tag_pet_name	VARCHAR2(50)	NOT NULL	,
	tag_birth_date	DATE,
	tag_gender	VARCHAR2(30),
	tag_num NUMBER,
	tag_family_name	VARCHAR2(50)	NOT NULL,
	tag_family_phone VARCHAR2(20)	NOT NULL,
     constraints pk_tag_id primary key(tag_ID)
);


CREATE TABLE review_board (
	rew_bo_id	NUMBER,
	user_id	VARCHAR2(30)	NOT NULL	,
	rew_bo_title	VARCHAR(200)	NOT NULL	,
	rew_bo_content	VARCHAR2(2000)	NOT NULL	,
	rew_bo_reg_date	DATE default sysdate,
    constraints pk_rew_bo_id primary key(rew_bo_id),
    constraints fk_rew_user_id foreign key(user_id)
                                    references tb_user(user_id)
                                    on delete cascade
);

CREATE TABLE review_comment (
	rew_co_id	NUMBER	NOT NULL	,
	rew_bo_id	NUMBER	NOT NULL	,
	user_id	VARCHAR2(30)	NOT NULL,
	rew_co_content	VARCHAR(2000)	NOT NULL	,
	rew_co_level	NUMBER default 1	NOT NULL	,
	rew_co_date	DATE	 default sysdate,
    constraints pk_rew_co_id primary key(rew_co_id,rew_bo_id),
    constraints fk_com_rew_bo_id foreign key(rew_bo_id)
                                    references review_board(rew_bo_id)
                                    on delete cascade,
    constraints fk_rew_co_user_id foreign key(user_id)
                                    references tb_user(user_id)
                                    on delete cascade,
    constraints ck_rew_co_level check (rew_co_level in('1','2'))
);

CREATE TABLE review_attach (
	rew_at_id	NUMBER,
	rew_bo_id	NUMBER NOT NULL,
	rew_at_original_name	VARCHAR2(300)	NULL,
	rew_at_renamed_name	VARCHAR2(300)	NULL,
	rew_at_upload_date 	DATE default sysdate,
    constraints pk_rew_at_id primary key(rew_at_id, rew_bo_id),
    constraints fk_at_rew_bo_id foreign key(rew_bo_id)
                                    references review_board(rew_bo_id)
                                    on delete cascade
);

CREATE TABLE Report (
	ani_bo_id	NUMBER,
	user_id	VARCHAR2(30),
	rep_content	VARCHAR2(1000),
	rep_display	CHAR(1) default 'Y' not null,
	rep_date	DATE	 default sysdate,
	rep_do_user	VARCHAR2(30)	NOT NULL,
    constraints pk_rep_ani_bo_id primary key(ani_bo_id),
    constraints fk_rep_ani_bo_id foreign key(ani_bo_id)
                                        references animal_board(ani_bo_id)
                                        on delete cascade,
    constraints fk_rep_user_id foreign key(user_id)
                                        references tb_user(user_id)
                                        on delete cascade,
    constraints ck_rep_display check(rep_display in('Y','N'))
);

create table shelterAnimal(
    desertion_no varchar2(20),
    file_name varchar2(200),
    happen_dt date,
    happen_place varchar2(200),
    kind_cd varchar2(100),
    color_cd varchar2(100),
    age varchar2(30),
    weight varchar2(30),
    notice_no varchar2(50),
    notice_sdt date,
    notice_edt date,
    popfile varchar2(200),
    process_state varchar2(20),
    gender_cd varchar2(1),
    neuter_yn varchar2(1),
    special_mark varchar2(500),
    care_nm varchar2(100),
    care_tel varchar2(14),
    care_addr varchar2(300),
    org_nm varchar2(100),
    charge_nm varchar2(40),
    officetel varchar2(14),
    constraint pk_desertion_no primary key(desertion_no)
);
 select count(*) from shelterAnimal where process_state like '%입양%'  or process_state like '%보호%';
select * from shelterAnimal where process_state like '%미포획%';
select count(*) from shelterAnimal where notice_no like '%서대%' or notice_no like '%강서%' group by notice_no having notice_no like '%서대%' or notice_no like '%강서%';
select count(*),org_nm from shelterAnimal group by org_nm;
select count(*),process_state from shelterAnimal group by process_state having process_state not like '%미포획%';
and process_state like '%자연사%';
select count(*), process_state from shelterAnimal where notice_no like '%강서%' and 
		(happen_dt >= '20170808' and happen_dt <= '20200921') group by process_state having process_state not like '%미포획%' order by process_state;
select count(*)
 from shelterAnimal;
 where process_state like '%보호%'
 and 
		care_addr like '%서울특별시 강남구%'
 and (happen_dt   >=    '2017-01-01'
 and happen_dt   <=     '2019-09-21');


commit;
select count(*) from shelterAnimal where (org_nm like '%서울%' and (process_state like '%안락사%' or process_state like '%자연사%')) or (org_nm like '%경기%' and (process_state like '%안락사%' or process_state like '%자연사%'));
        
		select count(*),notice_no from shelterAnimal where notice_no like '%서울%' or notice_no like '%경기%' and (process_state like '%안락사%' or process_state like '%자연사%') group by notice_no;
SELECT 
    COUNT(CASE 
        WHEN org_nm='%서울%' 
            THEN 1 END AND 
        CASE WHEN process_state like '%안락사%' or process_state like '%자연사%' THEN 1 END) AS sCnt, 
COUNT(CASE WHEN org_nm='%경기%' THEN 1 END AND CASE WHEN process_state like '%안락사%' or process_state like '%자연사%' THEN 1 END) AS samsamCnt
FROM expenditure;

select 
    count(case when org_nm like '%서울%' then 1 end) ,
    count(case when org_nm like '%경기%' then 1 end),
    count(case when org_nm like '%인천%' then 1 end) as c,
    count(case when org_nm like '%강원%' then 1 end) as d,
    count(case when org_nm like '%충청남도%' then 1 end) as e,
    count(case when org_nm like '%충청북도%' then 1 end) as f,
    count(case when org_nm like '%경상남도%' then 1 end) as g,
    count(case when org_nm like '%경상북도%' then 1 end) as h,
    count(case when org_nm like '%전라남도%' then 1 end) as j,
    count(case when org_nm like '%전라북도%' then 1 end) as k,
    count(case when org_nm like '%제주%' then 1 end) as l
from shelterAnimal
where process_state like '%안락사%' or process_state like '%자연사%';