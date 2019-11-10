CREATE TABLE "public"."user_role" (
    "user_id"    INT8        NOT NULL,
    "role"       VARCHAR(32) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("user_id", "role"),
    FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX "user_role_idx_created_at" ON "public"."user_role" USING BTREE ("created_at");
