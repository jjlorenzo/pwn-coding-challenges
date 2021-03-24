BEGIN;
--
-- Create model Catalog
--
CREATE TABLE "marketplace_catalog" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(120) NOT NULL);
--
-- Create model Product
--
CREATE TABLE "marketplace_product" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(120) NOT NULL, "visibility" varchar(30) NOT NULL, "price" numeric(10, 2) NOT NULL, "catalog_id" integer NULL);
--
-- Create model Buyer
--
CREATE TABLE "marketplace_buyer" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(120) NOT NULL, "catalog_id" integer NOT NULL);
ALTER TABLE "marketplace_product" ADD CONSTRAINT "marketplace_product_catalog_id_c9e25627_fk_marketpla" FOREIGN KEY ("catalog_id") REFERENCES "marketplace_catalog" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "marketplace_product_catalog_id_c9e25627" ON "marketplace_product" ("catalog_id");
ALTER TABLE "marketplace_buyer" ADD CONSTRAINT "marketplace_buyer_catalog_id_dab292f7_fk_marketplace_catalog_id" FOREIGN KEY ("catalog_id") REFERENCES "marketplace_catalog" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "marketplace_buyer_catalog_id_dab292f7" ON "marketplace_buyer" ("catalog_id");
COMMIT;
