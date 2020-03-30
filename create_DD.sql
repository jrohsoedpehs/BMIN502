### This sql code creates a data dictionary from the abic schema.
### The schema name is changed when appropriate


select t.table_schema as abic,
  t.table_name,
  (case when t.table_type = 'BASE TABLE' then 'table'
        when t.table_type = 'VIEW' then 'view'
        else t.table_type
   end) as table_type,
   c.column_name,
   c.column_type,
   c.column_key,
   c.is_nullable,
   c.column_comment
from information_schema.tables as t
inner join information_schema.columns as c on t.table_name = c.table_name and t.table_schema = c.table_schema where t.table_type in('base table', 'view') and t.table_schema like '%'
order by t.table_schema, t.table_name, c.ordinal_position
