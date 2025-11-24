SET SERVEROUTPUT ON;
DECLARE
  -- 1. Collection of book titles (VARRAY)
  TYPE BookList IS VARRAY(5) OF VARCHAR2(100);

  -- 2. Record to store member information
  TYPE MemberRec IS RECORD (
    member_id NUMBER,
    member_name VARCHAR2(50),
    borrowed_books BookList
  );

  -- 3. Declare variables
  member MemberRec;
  total_books NUMBER := 0;

BEGIN
  -- 4. Assign Member Information
  member.member_id := 2001;
  member.member_name := 'Tessy IRAKOZE MICK';
  member.borrowed_books := BookList('C Programming', 'Data Analytics', 'Networking Basics');

  -- 5. Check if the member borrowed any books
  IF member.borrowed_books.COUNT = 0 THEN
    GOTO no_books;
  END IF;

  -- 6. Count how many books were borrowed
  total_books := member.borrowed_books.COUNT;

  -- 7. Display results
  DBMS_OUTPUT.PUT_LINE('Member Name: ' || member.member_name);
  DBMS_OUTPUT.PUT_LINE('Number of Borrowed Books: ' || total_books);

  DBMS_OUTPUT.PUT_LINE('List of Borrowed Books:');
  FOR i IN 1..member.borrowed_books.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('- ' || member.borrowed_books(i));
  END LOOP;

  GOTO end_program;

  -- 8. Label for no books borrowed
  <<no_books>>
  DBMS_OUTPUT.PUT_LINE('This member has not borrowed any books.');

  -- 9. End program label
  <<end_program>>
  DBMS_OUTPUT.PUT_LINE('Library book check completed.');

END;
/
