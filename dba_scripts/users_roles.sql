-- USERS EXISTING IN THE DB
SELECT username, account_status, lock_date, created
FROM dba_users
ORDER BY username;

select * from dba_profiles

-- ACCOUNT PERMISSIONS
SELECT * FROM DBA_SYS_PRIVS WHERE grantee = 'ATLAS_PANDA_READROLE';
SELECT * FROM DBA_TAB_PRIVS WHERE grantee = 'ATLAS_PANDA_READER'

SELECT * FROM DBA_TAB_PRIVS WHERE grantee = 'ATLAS_PANDA'

ORDER BY OWNER;
SELECT * FROM DBA_ROLE_PRIVS WHERE grantee = 'ATLAS_PANDA_READROLE';

SELECT * FROM DBA_ROLES WHERE ROLE LIKE '%GRISLI%'


WHERE ROLE = 'ATLAS_PANDA_READROLE';
SELECT * FROM dba_role_privs

SELECT * FROM role_tab_privs

select *
from DBA_ROLE_PRIVS
where ROLE = 'ATLAS_PANDA_READROLE'
order by 1;


DBA_ROLE_PRIVS - Roles granted to users and roles
ROLE_ROLE_PRIVS - Roles which are granted to roles
ROLE_SYS_PRIVS - System privileges granted to roles
ROLE_TAB_PRIVS - Table privileges granted to roles
