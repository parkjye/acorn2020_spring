/* ********** TABLE NAME: board_cafe ********** */
-- 시퀀스
create SEQUENCE board_cafe_seq;

--CREATE table, 시퀀스
CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	content CLOB, --Smart Editor에 작성된 자료들은 html로 DB에 저장하기 때문에 CLOB type으로 한다.
	viewCount NUMBER, --조회수
	regdate DATE
);



--이전글/다음글 확인을 위한 sql
select result1.* 
from 
	(SELECT num, writer, title, content, viewCount, regdate,
	LAG(num, 1, 0) OVER (order by num desc) as prevNum,
	LEAD(num, 1, 0) over (order by num desc) as nextNum
	FROM board_cafe) result1 
WHERE num=?



/* ********** table name: board_cafe_comment (댓글), 시퀀스 ********** */
--시퀀스
create sequence board_cafe_comment_seq;

create table board_cafe_comment(
	num number primary key, --댓글의 글번호
	writer varchar2(100), --작성자 ID
	content varchar2(500), --댓글 내용
	target_id varchar2(100), --댓글의 대상자 아이디(대댓달 때 @ID 표시할 것)
	ref_group number, --해당 글 번호에 달린 댓글을 가져오기 위한 reference group number
	comment_group number, --댓글의 그룹 번호. (ex.첫 번째 댓글의 그룹번호가 12번이면 대댓들 번호도 전부 12번)
							--원글의 댓글 번호와 대댓 번호가 다르면 들여쓰기를 해서 대댓을 표현한다.
	deleted char(3) default 'no', --댓글 삭제 여부
	regdate date
);



/* ********** TABLE NAME: board_file ********** */
--시퀀스
create sequence board_file_seq;

create table board_file(
	nun number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	orgFileName varchar2(100) not null, --원본 파일명
	saveFileName varchar2(100) not null, --서버에 실제로 저장된 파일명
	fileSize number not null,
	regdate date
);



/*
 * [ 키워드 검색하는 sql문 ]
 * 
 * 	where title like '%' || '안녕' ||'%' --'안녕'이라는 단어가 포함된 제목 검색
 * */
select *
from (select result1.*, ROWNUM as rnum
		from(select * from board_file 
			where title like '%' || ? ||'%' or content like '%' || ? || '%'
			order by num desc) result1 )
where rnum between 1 and 5 --1page



/*
 * [ 페이징 처리를 위한 select문 ]
 * 
 * between 1 and 5 ==> 1page 보여지는 글의 갯수
 * (( 1 == startRowNum / 5 == endRowNum ))
 * */
select *
from (select result1.*, ROWNUM as rnum
		from(select * from board_file order by num desc) result1 )
where rnum between 1 and 5 --1page




/* ********** TABLE NAME: board_gallery ********** */
--시퀀스
create sequence board_gallery_seq;

create table board_gallery(
	num number primary key,
	writer varchar2(100),
	caption varchar2(100),
	imagePath varchar2(100),
	regdate date
);



/* ********** TABLE NAME: users (사용자(회원) 정보를 저장할 테이블) ********** */
--시퀀스
create sequence users_seq;

create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100), --프로필 이미지 경로를 저장할 컬럼
	regdate date
);