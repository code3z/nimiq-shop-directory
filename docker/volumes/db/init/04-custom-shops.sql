/* Create shops database with schema and rules and full text search
made by code3z for use with supabase */

CREATE TABLE public.shops (
  image text NULL,
  promos json[] NULL,
  location json NULL,
  email text NOT NULL,
  description text NULL,
  "shippingCountries" text[] NULL,
  phone bigint NULL,
  website text,
  type smallint, -- 1: online-only, 2: retail, 3: both
  name text,
  created_at timestamp default NOW(),
  id uuid default uuid_generate_v4()
);

ALTER TABLE public.shops ADD CONSTRAINT shops_pkey PRIMARY KEY (id);
alter table public.shops enable row level security;

-- Full text search index
alter table
  shops
add column
  fts tsvector generated always as (to_tsvector('english', description || ' ' || name || ' ' || website)) stored;

create index shops_fts on shops using gin (fts); -- generate the index

-- Rules access control

CREATE POLICY "everyone_can_view"
ON public.shops
FOR SELECT USING (
  true
);

CREATE POLICY "insert"
ON public.shops
FOR INSERT WITH CHECK (
  auth.role() = 'authenticated'
);

CREATE POLICY "update"
ON public.shops
FOR UPDATE USING (
  auth.email() = email
) WITH CHECK (
  auth.email() = email
);

CREATE POLICY "deletion"
ON public.shops
FOR UPDATE USING (
  auth.email() = email
) WITH CHECK (
  auth.email() = email
);
