BEGIN;
--
-- Create model Catalog
--
CREATE TABLE "catalog" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(120) NOT NULL);
--
-- Create model Product
--
CREATE TABLE "product" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(120) NOT NULL, "visibility" varchar(30) NOT NULL, "price" numeric(10, 2) NOT NULL);
CREATE TABLE "product_catalog" ("id" serial NOT NULL PRIMARY KEY, "product_id" integer NOT NULL, "catalog_id" integer NOT NULL);
--
-- Create model Buyer
--
CREATE TABLE "buyer" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(120) NOT NULL, "catalog_id" integer NOT NULL);
ALTER TABLE "product_catalog" ADD CONSTRAINT "product_catalog_product_id_catalog_id_ab66c96e_uniq" UNIQUE ("product_id", "catalog_id");
ALTER TABLE "product_catalog" ADD CONSTRAINT "product_catalog_product_id_1dbe703d_fk_product_id" FOREIGN KEY ("product_id") REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "product_catalog" ADD CONSTRAINT "product_catalog_catalog_id_033f0463_fk_catalog_id" FOREIGN KEY ("catalog_id") REFERENCES "catalog" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "product_catalog_product_id_1dbe703d" ON "product_catalog" ("product_id");
CREATE INDEX "product_catalog_catalog_id_033f0463" ON "product_catalog" ("catalog_id");
ALTER TABLE "buyer" ADD CONSTRAINT "buyer_catalog_id_85016274_fk_catalog_id" FOREIGN KEY ("catalog_id") REFERENCES "catalog" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "buyer_catalog_id_85016274" ON "buyer" ("catalog_id");
COMMIT;
