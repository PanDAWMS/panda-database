--------------------------------------------------------
--  File created - Thursday-November-17-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function GETHS06SSUMMARY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ATLAS_PANDABIGMON"."GETHS06SSUMMARY" (CONDITION IN VARCHAR2) RETURN HS06SSUMMARY_T IS
coll HS06SSUMMARY_T;
sqlstatement varchar2(32767);
BEGIN

sqlstatement := '
select ATLAS_PANDABIGMON.HS06S_T(h.nucleus, h.COMPUTINGSITE, h.usedhs06spersite, h.failedhs06spersite) 
from (
select nucleus, COMPUTINGSITE, 
sum(usedhs06spertask) as usedhs06spersite, 
sum(failedhs06spertask) as failedhs06spersite 
from (
select jj.nucleus, jj.COMPUTINGSITE,  (ceil(sum(hs06perjob)*1.5*max(hs06perjob)/avg(hs06perjob))) as usedhs06spertask,
case when jobstatus=''failed'' then (ceil(sum(hs06perjob)*1.5*max(hs06perjob)/avg(hs06perjob))) end  as failedhs06spertask 
from (
select jt.NUCLEUS, jt.COMPUTINGSITE, jt.jobstatus, ((jt.jobduration-ts.BASEWALLTIME)*jt.sitecoef*ts.CPUEFFICIENCY/100) as hs06perjob from (
(select t.NUCLEUS, t.COMPUTINGSITE, t.JEDITASKID, t.jobstatus, (t.ENDTIME-t.STARTTIME)*24*60*60 as jobduration, case when s.corecount is null then s.COREPOWER else (s.CORECOUNT*s.COREPOWER) end as sitecoef  from 
ATLAS_PANDA.JOBSARCHIVED4 t 
INNER JOIN 
ATLAS_PANDAMETA.SCHEDCONFIG s 
ON t.COMPUTINGSITE=s.SITEID
where t.MODIFICATIONTIME>=(sysdate-3) and t.CLOUD=''WORLD'' and t.JOBSTATUS in (''finished'',''failed'') and '|| CONDITION ||'
)) jt 
INNER JOIN
ATLAS_PANDA.JEDI_TASKS ts 
ON ts.JEDITASKID = jt.JEDITASKID
) jj
where hs06perjob>0
group by jj.COMPUTINGSITE, jj.jobstatus, jj.nucleus
) 
group by COMPUTINGSITE, nucleus
order by nucleus) h';

EXECUTE IMMEDIATE sqlstatement BULK COLLECT INTO coll;
RETURN coll;
END;

/

  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."GETHS06SSUMMARY" TO "ATLAS_PANDABIGMON_W";
  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."GETHS06SSUMMARY" TO "ATLAS_PANDABIGMON_R";
