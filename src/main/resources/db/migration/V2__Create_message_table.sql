CREATE TABLE "public"."message" (
    "id"         SERIAL8     NOT NULL,
    "text"       TEXT        NOT NULL,
    "tag"        TEXT        NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE INDEX "message_idx_tag"        ON "public"."message" USING BTREE ("tag");
CREATE INDEX "message_idx_created_at" ON "public"."message" USING BTREE ("created_at");
