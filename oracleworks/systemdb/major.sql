--�б� �����ͺ��̽� ���� 
--�а� ���̺� ����
CREATE TABLE major(
    mname     VARCHAR2(20) PRIMARY KEY,
    mphone    VARCHAR2(20) NOT NULL, --�ʼ� �Է�
    location  VARCHAR2(20) NOT NULL
);

--�а� �߰�
INSERT INTO major ( mname , mphone ,location)
VALUES('����Ʈ�����а�' , '02-2623-8887' ,'B�� ');
INSERT INTO major ( mname , mphone ,location)
VALUES('�濵�а�' , '02-2623-8877' ,'B�� 3��');
INSERT INTO major ( mname , mphone ,location)
VALUES('ö�а�' , '02-2623-8777' ,'B�� 9��');

--���� ���� ũ�� �ø��� ������..���ƿ���.. �ڷ� ũ�� ���� 20 -> 30
ALTER TABLE major MODIFY mname VARCHAR2(30);
 
--��ü ������ ��ȸ 
SELECT * FROM major;

-- Ư�� ������ ��ȸ ( ��Ī ��� -> AS ��� ) 
SELECT mname  AS �а��� ,mphone  AS ��ȭ��ȣ FROM major;


COMMIT;

DROP TABLE major;