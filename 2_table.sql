--3. Create table
create table DDL_AUDIT_TABLE
(
  id               NUMBER not null,
  sys_date         DATE,
  sys_user         VARCHAR2(2000),
  sys_event        VARCHAR2(2000),
  obj_type         VARCHAR2(2000),
  obj_owner        VARCHAR2(2000),
  obj_name         VARCHAR2(2000),
  terminal         VARCHAR2(2000),
  sessionid        VARCHAR2(2000),
  instance         VARCHAR2(2000),
  entryid          VARCHAR2(2000),
  isdba            VARCHAR2(2000),
  current_user     VARCHAR2(2000),
  current_userid   VARCHAR2(2000),
  session_user     VARCHAR2(2000),
  session_userid   VARCHAR2(2000),
  db_domain        VARCHAR2(2000),
  db_name          VARCHAR2(2000),
  host             VARCHAR2(2000),
  os_user          VARCHAR2(2000),
  external_name    VARCHAR2(2000),
  ip_address       VARCHAR2(2000),
  network_protocol VARCHAR2(2000),
  saved_object     CLOB
);