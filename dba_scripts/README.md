# DBA Scripts for PanDA Database

This directory contains useful DBA scripts for monitoring, troubleshooting, and managing the PanDA database. 
The queries were collected from various sources throughout the years based on common database administration tasks.

## 📂 Script Descriptions

### **1. `db_objects.sql`**
   - Retrieves information about database objects, such as tables, indexes, and schemas.
   - Helps analyze the structure of the PanDA database.

### **2. `execution_plan.sql`**
   - Extracts execution plans for SQL queries using `DBMS_XPLAN`.
   - Useful for performance tuning and query optimization.

### **3. `general.sql`**
   - General database information queries.
   - Includes checks for Oracle version, diagnostic trace location, and system parameters.

### **4. `jobs.sql`**
   - Retrieves details about scheduled jobs in the PanDA system.
   - Fetches job logs and execution details.

### **5. `partitions.sql`**
   - Lists partitioned tables and their configurations.
   - Helps manage and optimize partitioned datasets.

### **6. `queries.sql`**
   - Monitors query execution across the database.
   - Retrieves slow-running queries, bind variables, and execution statistics.

### **7. `sessions_blocking.sql`**
   - Identifies blocking sessions that might be causing performance issues.
   - Displays detailed information about blocked and blocking sessions.

### **8. `sessions_connections.sql`**
   - Lists active database sessions and user connections.
   - Provides an overview of user activity across database instances.

### **9. `sessions_usage.sql`**
   - Monitors session-level resource usage.
   - Shows CPU, memory, and disk consumption for each active session.

### **10. `tablespaces.sql`**
   - Retrieves tablespace details, quotas, and usage statistics.
   - Helps manage storage and database capacity.

## 📌 Usage

Copy the individual query to your SQL Developer and execute. Most of the queries require dictionary access, so ensure you have the necessary privileges.

