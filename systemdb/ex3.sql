-- ex3 ���̺� ����
CREATE TABLE ex3(
    col_null VARCHAR2(10),
    col_not_null VARCHAR2(10) NOT NULL
);

INSERT INTO ex3 VALUES ('', 'hello');
INSERT INTO ex3 VALUES ('�ȳ�', '');

COMMIT;

SELECT * FROM ex3;