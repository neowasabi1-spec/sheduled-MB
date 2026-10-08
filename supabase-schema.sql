-- Offer Schedule · Media Buyer — schema Supabase
-- Esegui una volta in: Supabase Dashboard -> SQL Editor -> New query -> Run

-- Tabella chiave/valore: una riga per ogni dato salvato dal calendario.
--   k = "pos:<YYYY-MM-DD_buyer>"        v = "<offerId>" oppure "m:<nome manuale>"
--   k = "extra:<YYYY-MM-DD_buyer>"      v = [{"sid":"s1","off":"<offerId>"}, ...]
--   k = "done:<slotKey>"                v = true
create table if not exists public.schedule_kv (
  k           text primary key,
  v           jsonb not null,
  updated_at  timestamptz not null default now()
);

-- RLS attiva: il sito usa la anon key, quindi anon può leggere e scrivere.
-- (Niente login: chi ha il link al calendario può modificarlo, come oggi.)
alter table public.schedule_kv enable row level security;

drop policy if exists "schedule_kv anon read"  on public.schedule_kv;
drop policy if exists "schedule_kv anon write" on public.schedule_kv;

create policy "schedule_kv anon read"
  on public.schedule_kv for select
  to anon, authenticated
  using (true);

create policy "schedule_kv anon write"
  on public.schedule_kv for all
  to anon, authenticated
  using (true)
  with check (true);

-- Realtime: i buyer vedono subito le modifiche degli altri senza ricaricare.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'schedule_kv'
  ) then
    alter publication supabase_realtime add table public.schedule_kv;
  end if;
end $$;
