
create or replace function pgq_coop.version()
returns text as $$
-- ----------------------------------------------------------------------
-- Function: pgq_coop.version(0)
--
--      Returns version string for pgq_coop.
-- ----------------------------------------------------------------------
declare
    _vers text;
begin
    select extversion from pg_catalog.pg_extension
        where extname = 'pgq_coop' into _vers;
    return _vers;
end;
$$ language plpgsql;

