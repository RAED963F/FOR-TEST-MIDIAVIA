-- MediVia: reversible case archiving.
-- Archived cases remain in the database and their Storage files are untouched.
ALTER TABLE public.cases
  ADD COLUMN IF NOT EXISTS archived_at timestamptz;

CREATE INDEX IF NOT EXISTS cases_archived_created_idx
  ON public.cases (archived_at, created_at DESC);
