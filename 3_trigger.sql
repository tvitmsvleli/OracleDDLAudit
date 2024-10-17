create or replace trigger ddl_audit_trigger
  after ddl on database
  ---------------------------------
  -- TMUMLADZE 11/09/2024
  ---------------------------------

begin
-- 
    if dbms_standard.dictionary_obj_type in ('PACKAGE','PACKAGE BODY', 'VIEW', 'TRIGGER', 'FUNCTION', 'PROCEDURE','TABLE') 
       and sys_context('USERENV', 'SESSION_USER', 256) is not null
    then
      insert into ddl_audit_table
        (id,
         sys_date,
         sys_user,
         sys_event,
         obj_type,
         obj_owner,
         obj_name,
         terminal,
         sessionid,
         instance,
         entryid,
         isdba,
         current_user,
         current_userid,
         session_user,
         session_userid,
         db_domain,
         db_name,
         host,
         os_user,
         external_name,
         ip_address,
         network_protocol,
         saved_object
        )
      values
        (ddl_audit_seq.nextval,
         sysdate,
         user,
         dbms_standard.sysevent,
         dbms_standard.dictionary_obj_type,
         dbms_standard.dictionary_obj_owner,
         dbms_standard.dictionary_obj_name,
         sys_context('USERENV', 'TERMINAL', 256),
         sys_context('USERENV', 'SESSIONID', 256),
         sys_context('USERENV', 'INSTANCE', 256),
         sys_context('USERENV', 'ENTRYID', 256),
         sys_context('USERENV', 'ISDBA', 256),
         sys_context('USERENV', 'CURRENT_USER', 256),
         sys_context('USERENV', 'CURRENT_USERID', 256),
         sys_context('USERENV', 'SESSION_USER', 256),
         sys_context('USERENV', 'SESSION_USERID', 256),
         sys_context('USERENV', 'DB_DOMAIN', 256),
         sys_context('USERENV', 'DB_NAME', 256),
         sys_context('USERENV', 'HOST', 256),
         sys_context('USERENV', 'OS_USER', 256),
         sys_context('USERENV', 'EXTERNAL_NAME', 256),
         sys_context('USERENV', 'IP_ADDRESS', 256),
         sys_context('USERENV', 'NETWORK_PROTOCOL', 256),
         decode(dbms_standard.dictionary_obj_type
                             ,'VIEW'
                             ,dbms_metadata.get_ddl('VIEW', upper(dbms_standard.dictionary_obj_name),user)
                             ,'PACKAGE BODY'
                             ,dbms_metadata.get_ddl('PACKAGE', upper(dbms_standard.dictionary_obj_name),user)
                             ,'TRIGGER'
                             ,dbms_metadata.get_ddl('TRIGGER', upper(dbms_standard.dictionary_obj_name),user)
                             ,'TABLE'
                             ,dbms_metadata.get_ddl('TABLE', upper(dbms_standard.dictionary_obj_name),user)
                             ,'INDEX'
                             ,dbms_metadata.get_ddl('INDEX', upper(dbms_standard.dictionary_obj_name),user)
                             ,'SEQUENCE'
                             ,dbms_metadata.get_ddl('SEQUENCE', upper(dbms_standard.dictionary_obj_name),user)
                             ,'PROCEDURE'
                             ,dbms_metadata.get_ddl('PROCEDURE', upper(dbms_standard.dictionary_obj_name),user)
                             ,'FUNCTION'
                             ,dbms_metadata.get_ddl('FUNCTION', upper(dbms_standard.dictionary_obj_name),user)
                             ,'SYNONYM'
                             ,dbms_metadata.get_ddl('SYNONYM', upper(dbms_standard.dictionary_obj_name),user)
                             ,NULL)
        );       
        
--
    end if;
    --
exception
  when others then null;
--
end;