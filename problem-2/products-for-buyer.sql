
PREPARE get_products_for_buyer (int) AS
  SELECT "marketplace_product"."id",
         "marketplace_product"."name",
         "marketplace_product"."visibility",
         "marketplace_product"."price",
         "marketplace_product"."catalog_id"
    FROM "marketplace_product"
    LEFT OUTER JOIN "marketplace_catalog"
      ON ("marketplace_product"."catalog_id" = "marketplace_catalog"."id")
    LEFT OUTER JOIN "marketplace_buyer"
      ON ("marketplace_catalog"."id" = "marketplace_buyer"."catalog_id")
   WHERE ("marketplace_product"."visibility" = 'default' OR
         ("marketplace_product"."visibility" = 'catalog_members' AND
          "marketplace_buyer"."id" = $1)
         )
   ORDER BY "marketplace_product"."id" ASC;

-- sample execution
EXECUTE get_products_for_buyer(1);
EXECUTE get_products_for_buyer(2);

-- deallocate the previously prepared SQL statement
DEALLOCATE get_products_for_buyer;
