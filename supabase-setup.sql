create table calcs (
  id bigint generated always as identity primary key,
  created_at timestamptz default now(),
  device text,
  gate_type text,
  width numeric,
  height numeric,
  fill text,
  auto boolean,
  gate boolean,
  mount boolean,
  deliv boolean,
  total numeric
);
alter table calcs enable row level security;
create policy "приложение пишет" on calcs for insert to anon with check (true);
create policy "админ читает" on calcs for select to authenticated using (true);
