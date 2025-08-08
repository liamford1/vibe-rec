CREATE EXTENSION IF NOT EXISTS vector;
CREATE TABLE IF NOT EXISTS tracks(
  id TEXT PRIMARY KEY,
  title TEXT,
  artist TEXT,
  preview_url TEXT,
  tempo REAL,
  "key" INT,
  valence REAL,
  energy REAL
);
CREATE TABLE IF NOT EXISTS embeddings_audio(
  track_id TEXT PRIMARY KEY REFERENCES tracks(id) ON DELETE CASCADE,
  emb vector(512)
);
CREATE TABLE IF NOT EXISTS embeddings_lyric(
  track_id TEXT PRIMARY KEY REFERENCES tracks(id) ON DELETE CASCADE,
  emb vector(384)
);
CREATE TABLE IF NOT EXISTS user_feedback(
  user_id TEXT,
  track_id TEXT REFERENCES tracks(id) ON DELETE CASCADE,
  label SMALLINT,
  PRIMARY KEY (user_id, track_id)
);
