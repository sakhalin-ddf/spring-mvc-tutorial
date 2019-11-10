CREATE TABLE "public"."user" (
    "id"         SERIAL8      NOT NULL,
    "active"     BOOLEAN      NOT NULL,
    "login"      VARCHAR(128) NOT NULL,
    "password"   VARCHAR(128) NOT NULL,
    "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE INDEX "user_idx_active"     ON "public"."user" USING BTREE ("active");
CREATE INDEX "user_idx_login"      ON "public"."user" USING BTREE ("login");
CREATE INDEX "user_idx_created_at" ON "public"."user" USING BTREE ("created_at");
