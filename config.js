// Configurazione Supabase per Offer Schedule.
// Supabase Dashboard -> Project Settings -> API:
//   - Project URL        -> SUPABASE_URL
//   - anon / public key  -> SUPABASE_ANON_KEY  (è pubblica per design; la sicurezza è nelle policy RLS)
// Se lasci i valori vuoti l'app funziona solo in locale (localStorage del browser).
window.SCHEDULE_CONFIG = {
  SUPABASE_URL: "https://llrgvorriwkbkvqtpvbw.supabase.co",
  SUPABASE_ANON_KEY: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxscmd2b3JyaXdrYmt2cXRwdmJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTE0ODk0NDYsImV4cCI6MjEwNzA2NTQ0Nn0.LRUfiT4Cu1mNSga5U3nQz0tzTU0OwOzh7IhToGqdTaQ"
};
