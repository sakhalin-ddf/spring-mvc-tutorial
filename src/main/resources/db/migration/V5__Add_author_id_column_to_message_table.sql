DELETE FROM "public"."message";

ALTER TABLE "public"."message"
ADD COLUMN "author_id" INT8 NOT NULL;

ALTER TABLE "public"."message"
ADD FOREIGN KEY ("author_id") REFERENCES "public"."user" ("id") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE INDEX "message_idx_auth_id" ON "public"."message" USING BTREE ("author_id");
