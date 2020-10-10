
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
	user_local	VARCHAR2(100)	NOT NULL,
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
	tag_no varchar2(20) NOT NULL,
    user_id varchar2(30) NOT NULL,
	tag_color VARCHAR2(100) NOT NULL,
    tag_ani_kind varchar2(50) NOT NULL,
	tag_font VARCHAR2(50) NOT NULL,
	tag_ani_name VARCHAR2(50)	NOT NULL,
	tag_ani_ssn VARCHAR2(30),
	tag_person_name	VARCHAR2(50)	NOT NULL,
	tag_person_phone VARCHAR2(20)	NOT NULL,
    ssg_name varchar2(30) NOT NULL,
    ssg_tel varchar2(13) NOT NULL,
    ssg_addr0 varchar2(10) not null,
    ssg_addr1 varchar2(100) NOT NULL,
    ssg_addr2 varchar2(100) NOT NULL,
    buy_date DATE default sysdate,
    constraints pk_tag_id primary key(tag_no),
    constraints fk_user_id foreign key(user_id)
                                    references tb_user(user_id)
                                    on delete cascade
);

create sequence seq_tag_no;

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
    ani_weight number,
    ani_age number,
    constraint pk_desertion_no primary key(desertion_no)
);
commit;

-- ani_weight 성공
update shelteranimal SA
set SA.ani_weight = (select to_number(S1.weight2)
                    from (
                            select S.desertion_no, nvl(regexp_replace(regexp_replace(substr(S.weight, 0, instr(S.weight, '(', 1)-1), ' |/', ''),'\.\.|~|,|-', '.'), 0) weight2
                            from shelterAnimal S
                          ) S1
                    where regexp_like(S1.weight2, '^[0-9]{1,3}[\.]{0,1}[0-9]{0,3}$') and SA.desertion_no = S1.desertion_no);
                         
-- ani_age 성공
update shelterAnimal SA
set SA.ani_age = (select to_number(extract(year from sysdate)-extract(year from to_date(substr(nvl(regexp_replace(substr(S.age, 0, instr(S.age, '(', 1)-1), ' |-|`', ''),0), 0, 4), 'rrrr'))) 
                 from shelterAnimal S
                 where SA.desertion_no = S.desertion_no);

create table adoption_application(
    adopt_id	NUMBER,
    ani_bo_id number,
    sender_id varchar2(30) ,
    sender_local varchar2(100),
    sender_phone char(11),
	sender_job varchar2(100),
    sender_home varchar2(100),
    a1 VARCHAR2(100),
    a2 VARCHAR2(10),
    a3 VARCHAR2(100),
    a4 VARCHAR2(3000),
    a5 VARCHAR2(10),
    a6 VARCHAR2(1000),
    a7 VARCHAR2(3000),
    a8 VARCHAR2(1000),
    a9 VARCHAR2(10),
    a10 VARCHAR2(1000),
    a11 VARCHAR2(100),
    a12 VARCHAR2(100),
    a13 VARCHAR2(10),
    constraints pk_adopt_id primary key(adopt_id),
    constraints fk_adopt_ani_bo_id foreign key(ani_bo_id)
                                    references animal_board(ani_bo_id)
                                    on delete set null,
     constraints fk_adopt_receiver foreign key(sender_id)
                                    references tb_user(user_id)
                                    on delete set null
);