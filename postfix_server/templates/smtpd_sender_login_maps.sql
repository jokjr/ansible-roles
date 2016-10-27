hosts={{ postgres_host }}
user={{ postgres_user }}
password={{ postgres_password }}
dbname={{ postgres_dbname }}
query = select permitted_sasl_usernames from (select coalesce((select lower(localpart || '@' || domain || ',') as permitted_sasl_usernames from users where lower(localpart || '@' || domain) = lower('%s')),'') || coalesce((select destination || ',' as permitted_sasl_usernames from virtual_alias_maps where lower(localpart || '@' || domain) = lower('%s')),'') || coalesce((select permitted_sasl_usernames from smtpd_sender_login_maps where lower(envelope_sender)=lower('%s')),'') as permitted_sasl_usernames) as permitted_sasl_usernames where permitted_sasl_usernames <> '';
