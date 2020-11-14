CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "kitchen_items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "receipts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "kitchen_item_id" integer NOT NULL, "count" integer, "quantity" float, "price" float, "quantity_scale" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_a760ef0655"
FOREIGN KEY ("kitchen_item_id")
  REFERENCES "kitchen_items" ("id")
);
CREATE INDEX "index_receipts_on_kitchen_item_id" ON "receipts" ("kitchen_item_id");
CREATE TABLE IF NOT EXISTS "recipes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "recipe_items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "receipt_id" integer NOT NULL, "quantity" float, "quantity_scale" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_5e50808053"
FOREIGN KEY ("receipt_id")
  REFERENCES "receipts" ("id")
);
CREATE INDEX "index_recipe_items_on_receipt_id" ON "recipe_items" ("receipt_id");
INSERT INTO "schema_migrations" (version) VALUES
('20201108003819'),
('20201108004209'),
('20201108035910'),
('20201108043425');


