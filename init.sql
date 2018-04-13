CREATE DATABASE YOURNAME_WORKSPACE_PILOT_DATABASE;
CREATE ROLE YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE;
GRANT OWNERSHIP ON DATABASE YOURNAME_WORKSPACE_PILOT_DATABASE TO ROLE YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE;
GRANT ROLE YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE TO ROLE SYSADMIN;
GRANT USAGE ON WAREHOUSE YOURWAREHOUSE TO ROLE YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE;
CREATE USER YOURNAME_WORKSPACE_PILOT_ADMIN 
    PASSWORD='123456' 
    DEFAULT_ROLE=YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE 
    MUST_CHANGE_PASSWORD=TRUE
;
GRANT ROLE YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE TO USER YOURNAME_WORKSPACE_PILOT_ADMIN;

CREATE ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE;
GRANT USAGE ON WAREHOUSE YOURWAREHOUSE TO ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE;
GRANT USAGE ON DATABASE YOURNAME_WORKSPACE_PILOT_DATABASE TO ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE;
GRANT USAGE ON ALL SCHEMAS IN DATABASE YOURNAME_WORKSPACE_PILOT_DATABASE TO ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE;

CREATE USER YOURNAME_WORKSPACE_PILOT_READONLY 
    PASSWORD='123456' 
    DEFAULT_ROLE=YOURNAME_WORKSPACE_PILOT_READONLY_ROLE 
    MUST_CHANGE_PASSWORD=TRUE
;
GRANT ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE TO USER YOURNAME_WORKSPACE_PILOT_READONLY;

-- create empty DEFAULT schema
CREATE SCHEMA YOURNAME_WORKSPACE_PILOT_DATABASE.DEFAULT;
GRANT OWNERSHIP ON SCHEMA YOURNAME_WORKSPACE_PILOT_DATABASE.DEFAULT TO ROLE YOURNAME_WORKSPACE_PILOT_ADMIN_ROLE;
GRANT USAGE ON ALL SCHEMAS IN DATABASE YOURNAME_WORKSPACE_PILOT_DATABASE TO ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE;
GRANT USAGE ON DATABASE YOURNAME_WORKSPACE_PILOT_DATABASE TO ROLE YOURNAME_WORKSPACE_PILOT_READONLY_ROLE;
