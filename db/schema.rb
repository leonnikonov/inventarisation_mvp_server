# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_17_181143) do
  create_table "abuse_stats", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "ip"
    t.date "date"
    t.integer "count", default: 0
    t.boolean "external"
    t.integer "ripe_resource_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ripe_resource_id"], name: "index_abuse_stats_on_ripe_resource_id"
  end

  create_table "acc_payment_expenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "acc_payment_id"
    t.integer "expense_id"
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["acc_payment_id"], name: "index_acc_payment_expenses_on_acc_payment_id"
    t.index ["expense_id"], name: "index_acc_payment_expenses_on_expense_id"
  end

  create_table "acc_payment_operation_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "direction"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "acc_payments", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "inn_payer", limit: 12
    t.string "inn_payee", limit: 12
    t.string "payer_account"
    t.string "payee_account"
    t.string "payment_num", default: "", null: false
    t.date "payment_date"
    t.date "dt", null: false
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.text "param"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "naznacenie"
    t.text "comment"
    t.string "payer_name"
    t.string "payee_name"
    t.date "dt_spisano"
    t.date "dt_postupilo"
    t.boolean "is_matched"
    t.string "payment_type", limit: 10
    t.string "currency", default: "RUB"
    t.text "param_backup"
    t.integer "acc_payment_operation_type_id"
    t.integer "bank_statement_id"
    t.string "type"
    t.decimal "sum_sent", precision: 10, scale: 2
    t.string "currency_sum_sent"
    t.boolean "notify_unlinked", default: true
    t.index ["inn_payee"], name: "key_inn_payee"
    t.index ["inn_payer", "inn_payee", "payment_date"], name: "inn_payer_payee_date_ndx"
    t.index ["inn_payer"], name: "key_inn_payer"
  end

  create_table "acc_payments_bills", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "bill_id", default: 0, null: false
    t.integer "acc_payment_id", default: 0, null: false
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.integer "agreement_id"
    t.integer "business_entity_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["acc_payment_id"], name: "ndx_acc_payment"
    t.index ["agreement_id"], name: "ndx_agreement_id"
    t.index ["bill_id"], name: "ndx_bill_id"
    t.index ["business_entity_id"], name: "ndx_business_entity"
  end

  create_table "acc_payments_provider_bills", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "acc_payment_id"
    t.integer "provider_bill_id"
    t.decimal "sum", precision: 10, scale: 2
    t.integer "provider_agreement_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["acc_payment_id"], name: "index_acc_payments_provider_bills_on_acc_payment_id"
    t.index ["provider_agreement_id"], name: "index_acc_payments_provider_bills_on_provider_agreement_id"
    t.index ["provider_bill_id"], name: "index_acc_payments_provider_bills_on_provider_bill_id"
  end

  create_table "act_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price_with_vat", precision: 15, scale: 2
    t.decimal "vat", precision: 10, scale: 2, default: "0.0"
    t.text "param"
    t.integer "act_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "msg"
    t.decimal "vat_in_money", precision: 15, scale: 2
    t.boolean "deleted", default: false
    t.integer "credited_act_row_id"
    t.decimal "price_without_vat", precision: 10, scale: 2
    t.string "vat_calculation_type", default: "modern_russian"
    t.index ["act_id"], name: "index_act_rows_on_act_id"
    t.index ["credited_act_row_id"], name: "index_act_rows_on_credited_act_row_id"
  end

  create_table "action_text_rich_texts", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :medium
    t.integer "record_id", null: false
    t.string "record_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "record_id", null: false
    t.string "record_type", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata", size: :medium
    t.integer "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "acts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "dt"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "number"
    t.integer "agreement_id"
    t.integer "template_id"
    t.integer "serial_number"
    t.string "service_or_product", limit: 20
    t.text "param"
    t.integer "signer_id"
    t.boolean "printed", default: false
    t.string "currency", default: "RUB"
    t.integer "payment_terms", default: 14
    t.string "token"
    t.decimal "accounting_sum", precision: 10, scale: 2, default: "0.0"
    t.decimal "accounting_sum_with_vat", precision: 10, scale: 2, default: "0.0"
    t.string "revenue_group"
    t.string "uuid"
    t.datetime "diadoc_export_at", precision: nil
    t.string "last_edo_status"
    t.index ["number"], name: "index_acts_on_number", unique: true
    t.index ["revenue_group"], name: "index_acts_on_revenue_group"
    t.index ["token"], name: "index_acts_on_token"
    t.index ["uuid"], name: "index_acts_on_uuid"
  end

  create_table "ad_accounts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "account_type"
    t.string "account_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "currency"
    t.string "app_id"
    t.string "app_token"
  end

  create_table "ad_campaign_stats", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ad_campaign_id"
    t.date "dt"
    t.integer "impressions"
    t.integer "clicks"
    t.decimal "cost", precision: 16, scale: 10
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ad_campaign_id"], name: "index_ad_campaign_stats_on_ad_campaign_id"
  end

  create_table "ad_campaigns", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ad_account_id"
    t.string "name"
    t.string "campaign_id"
    t.integer "cfr_id"
    t.string "currency"
    t.string "target_currency"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ad_account_id"], name: "index_ad_campaigns_on_ad_account_id"
    t.index ["cfr_id"], name: "index_ad_campaigns_on_cfr_id"
  end

  create_table "address_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "address_id"
    t.integer "country_id"
    t.string "postalcode"
    t.string "stateorprovincename"
    t.string "city"
    t.string "streetaddress"
    t.string "fulladdress"
    t.string "comment"
    t.string "business_entity_id"
    t.string "region_code"
    t.date "valid_on"
    t.string "russian_address_zip_code"
    t.string "russian_address_city"
    t.string "russian_address_street"
    t.string "russian_address_building"
    t.string "russian_address_apartment"
    t.string "russian_address_block"
    t.string "act_full_address"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.index ["address_id"], name: "index_address_histories_on_address_id"
    t.index ["user_id"], name: "index_address_histories_on_user_id"
    t.index ["valid_on"], name: "index_address_histories_on_valid_on"
  end

  create_table "addresses", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "sort"
    t.integer "country_id"
    t.string "postalcode"
    t.string "stateorprovincename"
    t.string "city"
    t.string "streetaddress"
    t.string "fulladdress"
    t.string "comment"
    t.integer "business_entity_id"
    t.text "param", size: :medium
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "region_code"
    t.integer "set_by"
    t.datetime "set_at", precision: nil
    t.string "reciever_full_name"
    t.string "reciever_phone"
    t.string "reciever_email"
    t.boolean "migrated_from_histories"
    t.string "house_number"
    t.index ["business_entity_id", "sort"], name: "key_be_and_sort", length: { sort: 1 }
    t.index ["set_by"], name: "index_addresses_on_set_by"
  end

  create_table "adv_campagins", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "adv_channels", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "visible"
    t.integer "adv_site_id"
    t.integer "business_entity_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "adv_contents", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "adv_medias", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "adv_sites", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "host"
    t.boolean "visible"
    t.integer "business_entity_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "adv_sitetargets", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "agreement_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "agreements", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "number"
    t.integer "supplier_business_entity_id"
    t.integer "buyer_business_entity_id"
    t.boolean "is_offerta"
    t.integer "my_id"
    t.string "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "contract_id"
    t.integer "crm_agreement"
    t.integer "dt_number"
    t.integer "crm_yur_fiz"
    t.date "dt"
    t.decimal "sum", precision: 15, scale: 2
    t.integer "template_id"
    t.integer "first_installment", limit: 2, default: 0, null: false
    t.integer "signer_id"
    t.boolean "printed", default: false
    t.string "currency", default: "RUB"
    t.decimal "sell_price", precision: 10, scale: 2
    t.string "sell_currency"
    t.string "condition_creating_acts"
    t.integer "agreement_type_id"
    t.integer "bank_account_id"
    t.integer "acc_signer_id"
    t.string "uuid"
    t.string "service_name"
    t.date "dt_to"
    t.datetime "diadoc_export_at", precision: nil
    t.string "last_edo_status"
    t.boolean "is_agreement_bill", default: false
    t.boolean "is_set_bill_in_invoices", default: false
    t.index ["acc_signer_id"], name: "index_agreements_on_acc_signer_id"
    t.index ["bank_account_id"], name: "index_agreements_on_bank_account_id"
    t.index ["buyer_business_entity_id"], name: "index_agreements_on_buyer_business_entity_id"
    t.index ["buyer_business_entity_id"], name: "ndx_agreement_buy_be"
    t.index ["buyer_business_entity_id"], name: "ndx_cd agreement_buy_be"
    t.index ["uuid"], name: "index_agreements_on_uuid"
  end

  create_table "allocations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "site_id"
    t.integer "placement_id"
    t.string "placement_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "no_index", default: true
    t.index ["placement_type", "placement_id"], name: "index_allocations_on_placement_type_and_placement_id"
    t.index ["site_id"], name: "index_allocations_on_site_id"
  end

  create_table "apcs", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.integer "rack_feed_id"
    t.integer "max_amps"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["rack_feed_id"], name: "index_apcs_on_rack_feed_id"
  end

  create_table "archive_statistics", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "uuid"
    t.string "ip"
    t.string "country"
    t.string "region"
    t.string "action_code"
    t.string "brand"
    t.string "product"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "vat", precision: 7, scale: 4
    t.integer "price_group"
    t.string "currency", default: "RUB"
    t.date "order_date"
    t.boolean "payed", default: false
    t.boolean "old_client", default: false
    t.decimal "buy_price", precision: 10, scale: 2
    t.string "buy_currency"
    t.integer "ssl_duration"
    t.boolean "comodo_to_thawte", default: false
    t.integer "lead_id"
    t.integer "contract_id"
    t.string "lang"
    t.string "site"
    t.datetime "utm_created_at", precision: nil
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_campaign"
    t.string "utm_content"
    t.string "utm_term"
    t.string "referrer", limit: 1024
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["uuid"], name: "index_archive_statistics_on_uuid"
  end

  create_table "archive_versions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.text "object_changes"
    t.datetime "created_at", precision: nil
    t.string "locale"
    t.datetime "updated_at", precision: nil
    t.index ["created_at"], name: "index_archive_versions_on_created_at"
    t.index ["item_type", "item_id"], name: "index_archive_versions_on_item_type_and_item_id"
    t.index ["whodunnit", "item_type", "created_at"], name: "index_whodunnit_item_type_created_at", length: { item_type: 4 }
  end

  create_table "article_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "code"
    t.boolean "is_not_listed", default: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "weight"
    t.string "meta_description"
    t.index ["weight"], name: "index_article_categories_on_weight"
  end

  create_table "article_category_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "article_category_id"
    t.string "locale"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "meta_description"
    t.index ["article_category_id"], name: "index_9ae0e1f9852231335c56f71693e5251aa9ee4db2"
  end

  create_table "article_relations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "article_id"
    t.integer "related_article_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["article_id"], name: "index_article_relations_on_article_id"
    t.index ["related_article_id"], name: "index_article_relations_on_related_article_id"
  end

  create_table "article_ssl_server_softwares", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "ssl_server_software_id", null: false
    t.string "article_type", null: false
  end

  create_table "article_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "article_id"
    t.string "locale"
    t.string "name"
    t.text "content", size: :medium
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "meta_title"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "public_image"
    t.string "slug"
    t.index ["article_id"], name: "index_article_translations_on_article_id"
  end

  create_table "articles", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id"
    t.boolean "is_category"
    t.string "name"
    t.text "content", size: :medium
    t.string "param"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "meta_title"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "lft"
    t.integer "rgt"
    t.string "code"
    t.boolean "is_not_listed", default: false
    t.integer "weight"
    t.string "public_image"
    t.text "extra_headers"
    t.boolean "hidden_on_site"
    t.boolean "is_faq"
    t.boolean "is_howto"
    t.string "lead_image"
    t.string "slug"
    t.boolean "hide_tags"
    t.index ["weight"], name: "index_articles_on_weight"
  end

  create_table "articles_article_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "article_id"
    t.integer "article_category_id"
    t.integer "position"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "assets", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at", precision: nil
    t.integer "assetable_id"
    t.string "assetable_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "asterisk_queue_members", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "queue_name"
    t.string "interface"
    t.integer "penalty"
    t.integer "paused"
    t.string "uniqueid"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "asterisk_queues", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "musiconhold"
    t.string "announce"
    t.string "context"
    t.integer "timeout"
    t.boolean "monitor_join"
    t.string "monitor_format"
    t.string "queue_youarenext"
    t.string "queue_thereare"
    t.string "queue_callswaiting"
    t.string "queue_holdtime"
    t.string "queue_minutes"
    t.string "queue_seconds"
    t.string "queue_lessthan"
    t.string "queue_thankyou"
    t.string "queue_reporthold"
    t.integer "announce_frequency"
    t.integer "announce_round_seconds"
    t.string "announce_holdtime"
    t.integer "retry"
    t.integer "wrapuptime"
    t.integer "maxlen"
    t.integer "servicelevel"
    t.string "strategy"
    t.string "joinempty"
    t.string "leavewhenempty"
    t.boolean "eventmemberstatus"
    t.boolean "eventwhencalled"
    t.boolean "reportholdtime"
    t.integer "memberdelay"
    t.integer "weight"
    t.boolean "timeoutrestart"
    t.string "periodic_announce"
    t.integer "periodic_announce_frequency"
    t.boolean "ringinuse"
    t.boolean "setinterfacevar"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "auction_lots", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "auction_id"
    t.integer "period_count"
    t.string "period_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "nomenclature_id"
    t.string "uuid"
  end

  create_table "auction_participants", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "price_change_notifiable"
    t.string "request_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "code"
  end

  create_table "auction_rates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "auction_id"
    t.integer "auction_participant_id"
    t.decimal "rate", precision: 10, scale: 2
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "request_ip"
    t.string "uuid"
  end

  create_table "auction_users", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "encrypted_password", limit: 128, default: "", null: false
    t.string "password_salt", default: "", null: false
    t.string "confirmation_token"
    t.string "reset_password_token"
    t.string "unconfirmed_email"
    t.string "login"
    t.string "email"
    t.string "remember_token"
    t.string "time_zone"
    t.string "language"
    t.string "phone"
    t.string "unsudo_code"
    t.string "company"
    t.string "job_title"
    t.string "jabber"
    t.string "inn"
    t.string "local_phone"
    t.string "mobile_phone"
    t.string "otrs_default_queue"
    t.string "authentication_token"
    t.string "megaplan_login"
    t.string "megaplan_pass_md5"
    t.string "call_context"
    t.string "comodo_login"
    t.string "comodo_pass"
    t.string "public_token"
    t.integer "rows_per_page"
    t.integer "otrs_owner_id"
    t.integer "business_entity_id"
    t.integer "real_estate_id"
    t.integer "cfr_id"
    t.integer "contract_id"
    t.integer "person_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.text "comment", size: :medium
    t.boolean "enabled", default: false
    t.boolean "insider"
    t.boolean "sms_enabled"
    t.boolean "production"
    t.boolean "is_uses_smb"
    t.boolean "password_set"
    t.boolean "is_uses_real_estate_space"
    t.datetime "confirmed_at", precision: nil
    t.datetime "remember_token_expires_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "password_reset_code_expires_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: nil
    t.index ["unlock_token"], name: "index_auction_users_on_unlock_token", unique: true
  end

  create_table "auctions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.decimal "price_start", precision: 10, scale: 2
    t.decimal "price_step_min", precision: 10, scale: 2
    t.decimal "price_step_max", precision: 10, scale: 2, default: "0.0"
    t.datetime "date_start", precision: nil
    t.datetime "date_finish", precision: nil
    t.string "auct_type", default: "standart"
    t.boolean "is_open", default: true
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.decimal "price_current", precision: 10, scale: 2
    t.integer "founder_id"
    t.text "rules"
    t.integer "position"
    t.string "link"
    t.integer "winner_id"
    t.datetime "deleted_at", precision: nil
    t.string "image"
    t.datetime "winner_notified_at", precision: nil
    t.integer "bids_count", default: 0
    t.string "uuid"
    t.index ["date_finish"], name: "index_auctions_on_date_finish"
    t.index ["date_start"], name: "index_auctions_on_date_start"
  end

  create_table "auto_payments", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "bill_id"
    t.integer "lead_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "token"
    t.integer "pay_pal_id"
    t.string "payment_type"
    t.integer "payment_id"
    t.index ["bill_id"], name: "index_auto_payments_on_bill_id"
    t.index ["lead_id"], name: "index_auto_payments_on_lead_id"
    t.index ["pay_pal_id"], name: "index_auto_payments_on_pay_pal_id"
  end

  create_table "balances", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "business_entity_id"
    t.decimal "sum", precision: 15, scale: 2
    t.date "date"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "bank_account_id"
    t.index ["bank_account_id"], name: "index_balances_on_bank_account_id"
    t.index ["business_entity_id", "date"], name: "business_entity_id_date_ndx"
  end

  create_table "bank_accounts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "account"
    t.string "bank_bik"
    t.string "korscet"
    t.integer "business_entity_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "bank_id"
    t.string "bank_name"
    t.string "currency", default: "RUB"
    t.string "iban"
    t.boolean "primary"
    t.index ["business_entity_id"], name: "index_bank_accounts_on_business_entity_id"
  end

  create_table "bank_statements", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "bank_name"
    t.string "bank_account"
    t.integer "number"
    t.integer "sequence"
    t.string "number_and_sequence"
    t.date "opening_balance_date"
    t.string "opening_balance_type"
    t.decimal "opening_balance_amount", precision: 10, scale: 2, default: "0.0"
    t.string "opening_balance_currency"
    t.date "closing_balance_date"
    t.decimal "closing_balance_amount", precision: 10, scale: 2, default: "0.0"
    t.binary "plain_text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "banks", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "bik"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "korscet"
  end

  create_table "banners", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.date "from_date"
    t.date "to_date"
    t.integer "position"
    t.string "banner_file_name"
    t.string "banner_content_type"
    t.integer "banner_file_size"
    t.datetime "banner_updated_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "be_legal_entries", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "business_entity_id"
    t.string "name_full_with_opf"
    t.string "name_short_with_opf"
    t.string "name_full"
    t.string "name_short"
    t.string "status"
    t.date "liquidation_date"
    t.string "address"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "kpp"
    t.string "raw_address"
    t.string "region_code"
    t.string "zip_code"
    t.string "city"
    t.string "street"
    t.string "building"
    t.string "block"
    t.string "apartment"
    t.index ["business_entity_id"], name: "index_be_legal_entries_on_business_entity_id"
  end

  create_table "be_type_translations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "be_type_id"
    t.string "locale"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["be_type_id"], name: "index_be_type_translations_on_be_type_id"
    t.index ["locale"], name: "index_be_type_translations_on_locale"
  end

  create_table "be_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "is_protected"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "bill_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.integer "quantity", default: 1, null: false
    t.decimal "price_with_vat", precision: 15, scale: 2
    t.decimal "vat", precision: 10, scale: 2, default: "0.0"
    t.text "param"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "bill_id"
    t.text "msg"
    t.decimal "vat_in_money", precision: 15, scale: 2
    t.boolean "deleted", default: false
    t.string "vat_calculation_type", default: "modern_russian"
    t.decimal "price_without_vat", precision: 10, scale: 2
    t.index ["bill_id"], name: "index_bill_rows_on_bill_id"
    t.index ["deleted"], name: "index_bill_rows_on_deleted"
  end

  create_table "billing_sessions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "start_dt", precision: nil
    t.datetime "end_dt", precision: nil
    t.decimal "price", precision: 16, scale: 10
    t.integer "quantity"
    t.decimal "sum", precision: 10, scale: 2
    t.integer "server_session_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "contract_item_id"
    t.index ["contract_item_id"], name: "index_billing_sessions_on_contract_item_id"
    t.index ["server_session_id"], name: "index_billing_sessions_on_server_session_id"
  end

  create_table "bills", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "dt", null: false
    t.integer "agreement_id"
    t.boolean "payed", default: false, null: false
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.string "number"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "param"
    t.integer "crm_bill"
    t.integer "crm_yur_fiz"
    t.integer "serial_number"
    t.integer "crm_agreement"
    t.string "payment_type", limit: 10
    t.boolean "hidden", default: false
    t.integer "template_id"
    t.integer "signer_id"
    t.date "estimated_payment_date"
    t.boolean "printed", default: false
    t.boolean "compulsory", default: false
    t.string "currency", default: "RUB"
    t.decimal "sell_price", precision: 10, scale: 2
    t.string "sell_currency"
    t.integer "bank_account_id"
    t.string "token"
    t.boolean "notify_unpaid", default: true
    t.integer "notify_unpaid_in", default: 7
    t.datetime "notified_unpaid_at", precision: nil
    t.boolean "online_payment"
    t.boolean "skip_notification"
    t.boolean "deleted"
    t.datetime "diadoc_export_at", precision: nil
    t.string "last_edo_status"
    t.boolean "prepayment", default: false
    t.index ["agreement_id"], name: "ndx_bill_agreement"
    t.index ["bank_account_id"], name: "index_bills_on_bank_account_id"
    t.index ["dt"], name: "ndx_bill_dt"
    t.index ["number"], name: "index_bills_on_number", unique: true
    t.index ["payed"], name: "ndx_bill_payed"
    t.index ["token"], name: "index_bills_on_token"
  end

  create_table "budget_versions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "budget_versionable_type"
    t.integer "number"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_current"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "business_entities", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "contractor_id"
    t.integer "be_type_id"
    t.string "name"
    t.string "name_short"
    t.string "ogrn"
    t.string "inn"
    t.string "kpp"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "okved"
    t.string "entrepreneur_udost_type"
    t.date "entrepreneur_udost_date"
    t.string "entrepreneur_udost_series"
    t.string "entrepreneur_udost_number"
    t.string "entrepreneur_udost_issued"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "is_supplier"
    t.integer "crm_yur_fiz"
    t.integer "crm_client"
    t.text "comment", size: :medium
    t.text "param", size: :medium
    t.boolean "is_usn"
    t.string "category"
    t.string "yellow_pages"
    t.string "duns"
    t.string "ogrn_svid_serija"
    t.string "ogrn_svid_number"
    t.date "ogrn_svid_dt"
    t.string "ogrn_svid_issued_by"
    t.string "ogrn_svid_issued_address"
    t.string "inn_svid_serija"
    t.string "inn_svid_number"
    t.date "inn_svid_dt"
    t.boolean "is_resident"
    t.string "vat_number"
    t.integer "country_id"
    t.string "sk_id"
    t.integer "interested_company_id"
    t.string "entrepreneur_udost_department_code"
    t.boolean "archive", default: false
    t.string "work_name"
    t.datetime "approved_dt", precision: nil
    t.integer "vat_rate"
    t.string "gsk_id"
    t.boolean "outsource_payrol", default: false
    t.string "uuid"
    t.string "diadoc_box_id"
    t.string "fns_participant_id"
    t.boolean "skip_vat_validation", default: false
    t.integer "edo_operator_id"
    t.string "department_id"
    t.datetime "diadoc_excluded_at", precision: nil
    t.boolean "is_filial", default: false
    t.string "blocked"
    t.string "department_name"
    t.string "buyer_reference"
    t.bigint "primary_delivery_address_id"
    t.boolean "migrated_from_histories"
    t.index ["contractor_id"], name: "index_business_entities_on_contractor_id"
    t.index ["edo_operator_id"], name: "index_business_entities_on_edo_operator_id"
    t.index ["gsk_id"], name: "index_business_entities_on_gsk_id"
    t.index ["inn"], name: "key_inn", length: 10
    t.index ["uuid"], name: "index_business_entities_on_uuid"
  end

  create_table "business_entity_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "business_entity_id"
    t.string "name", default: ""
    t.string "name_short", default: ""
    t.string "kpp", default: ""
    t.date "valid_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.index ["business_entity_id"], name: "index_business_entity_histories_on_business_entity_id"
    t.index ["user_id"], name: "index_business_entity_histories_on_user_id"
    t.index ["valid_on"], name: "index_business_entity_histories_on_valid_on"
  end

  create_table "business_expense_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "business_expenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "investment_date"
    t.decimal "value_without_vat", precision: 10
    t.string "currency"
    t.integer "provider_act_id"
    t.integer "business_expense_type_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["business_expense_type_id"], name: "index_business_expenses_on_business_expense_type_id"
    t.index ["provider_act_id"], name: "index_business_expenses_on_provider_act_id"
  end

  create_table "businesses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.text "name"
    t.text "content"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "meta_title"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "cart_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "service_id"
    t.integer "quantity"
    t.text "param", size: :medium
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "carts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.text "param", size: :medium
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_providers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 70, default: "", null: false
    t.string "tm", limit: 50, default: "", null: false
    t.string "url", limit: 100, default: "", null: false
    t.string "lic_telemat", limit: 40, default: "", null: false
    t.string "lic_transfer", limit: 40, default: "", null: false
    t.integer "is_bl", default: 0, null: false
    t.index ["tm"], name: "email"
  end

  create_table "categories", id: { type: :integer, limit: 2, unsigned: true }, charset: "utf8mb3", comment: "List of categories", force: :cascade do |t|
    t.string "category", limit: 20, default: "", null: false
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
    t.index ["category"], name: "category_key", unique: true
  end

  create_table "cdr", id: :integer, charset: "latin1", force: :cascade do |t|
    t.datetime "calldate", precision: nil
    t.string "clid", default: ""
    t.string "src", default: ""
    t.string "dst", default: ""
    t.string "dcontext", default: ""
    t.string "channel", default: ""
    t.string "dstchannel", default: ""
    t.string "lastapp", default: ""
    t.string "lastdata", default: ""
    t.integer "duration", default: 0
    t.integer "billsec", default: 0
    t.string "disposition", default: ""
    t.integer "amaflags", default: 0
    t.string "accountcode", default: ""
    t.string "uniqueid", default: ""
    t.string "userfield", default: "", null: false
    t.index ["accountcode"], name: "index_cdr_on_accountcode"
    t.index ["calldate"], name: "index_cdr_on_calldate"
    t.index ["dst"], name: "index_cdr_on_dst"
  end

  create_table "cel", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "eventtype", limit: 30, null: false
    t.timestamp "eventtime", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.string "userdeftype", null: false
    t.string "cid_name", limit: 80, null: false
    t.string "cid_num", limit: 80, null: false
    t.string "cid_ani", limit: 80, null: false
    t.string "cid_rdnis", limit: 80, null: false
    t.string "cid_dnid", limit: 80, null: false
    t.string "exten", limit: 80, null: false
    t.string "context", limit: 80, null: false
    t.string "channame", limit: 80, null: false
    t.string "appname", limit: 80, null: false
    t.string "appdata", limit: 80, null: false
    t.integer "amaflags", null: false
    t.string "accountcode", limit: 20, null: false
    t.string "peeraccount", limit: 20, null: false
    t.string "uniqueid", limit: 150, null: false
    t.string "linkedid", limit: 150, null: false
    t.string "userfield", null: false
    t.string "peer", limit: 80, null: false
    t.index ["id"], name: "id", unique: true
  end

  create_table "certificate_nomenclatures", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "nomenclature_id"
    t.string "brand"
    t.string "supplier_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_certificate_nomenclatures_on_code"
    t.index ["nomenclature_id"], name: "index_certificate_nomenclatures_on_nomenclature_id"
  end

  create_table "certificates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.text "issuer"
    t.text "subject"
    t.datetime "not_before_date", precision: nil
    t.datetime "not_after_date", precision: nil
    t.text "body"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "subject_hoster"
    t.string "subject_country"
    t.string "subject_country_zip_code"
    t.string "subject_region"
    t.string "subject_city"
    t.string "subject_street"
    t.string "subject_organization_name"
    t.string "subject_common_name"
    t.string "issuer_country"
    t.string "issuer_organization_name"
    t.text "full_info"
    t.integer "lead_id"
    t.datetime "end_date", precision: nil
    t.boolean "current", default: true
    t.integer "parent_id"
    t.date "checked_on"
    t.string "geo_city"
    t.string "geo_region"
    t.string "geo_district"
    t.string "geo_country"
    t.string "geo_region_code"
    t.string "geo_coordinates"
    t.string "subject_ou"
    t.string "issuer_cn"
    t.text "dns"
    t.integer "dns_count"
    t.string "serial"
    t.string "validation_type"
    t.boolean "is_wildcard"
    t.boolean "is_multidomain"
    t.boolean "is_ev"
    t.boolean "is_sgc"
    t.boolean "is_ov"
    t.boolean "is_dv"
    t.string "issuer_common_name"
    t.boolean "is_valid"
    t.boolean "is_self_signed"
    t.string "port"
    t.boolean "revoked"
    t.integer "check_failed"
    t.date "check_failed_on"
    t.boolean "verified"
    t.index ["end_date"], name: "index_certificates_on_end_date"
    t.index ["geo_country"], name: "index_certificates_on_geo_country"
    t.index ["ip"], name: "ip_index"
    t.index ["is_ev"], name: "index_certificates_on_is_ev"
    t.index ["is_multidomain"], name: "index_certificates_on_is_multidomain"
    t.index ["is_wildcard"], name: "index_certificates_on_is_wildcard"
    t.index ["issuer_common_name"], name: "index_certificates_on_issuer_common_name"
    t.index ["lead_id"], name: "index_certificates_on_lead_id"
    t.index ["not_after_date", "subject_common_name"], name: "certificates_return_code_not_after_date_subj_common_name"
    t.index ["not_after_date"], name: "certificates_not_after_date"
    t.index ["not_after_date"], name: "certificates_verify_return_code_not_after_date"
    t.index ["subject_common_name"], name: "index_certificates_on_subject_common_name", length: 10
  end

  create_table "cfr_countries", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "cfr_id"
    t.integer "country_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cfr_id"], name: "index_cfr_countries_on_cfr_id"
    t.index ["country_id"], name: "index_cfr_countries_on_country_id"
  end

  create_table "cfr_lead_sources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "cfr_id"
    t.integer "lead_source_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cfr_id"], name: "index_cfr_lead_sources_on_cfr_id"
    t.index ["lead_source_id"], name: "index_cfr_lead_sources_on_lead_source_id"
  end

  create_table "cfr_nomenclature_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "cfr_id"
    t.integer "nomenclature_category_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cfr_id"], name: "index_cfr_nomenclature_categories_on_cfr_id"
    t.index ["nomenclature_category_id"], name: "index_cfr_nomenclature_categories_on_nomenclature_category_id"
  end

  create_table "cfr_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "name_short"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "cfrs", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "cfr_type_id"
    t.integer "parent_id"
    t.integer "responsible_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "lft"
    t.integer "rgt"
    t.integer "business_entity_id"
    t.boolean "partner", default: false
    t.index ["business_entity_id"], name: "index_cfrs_on_business_entity_id"
  end

  create_table "chatgpt_dialogues", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.integer "chatgpt_prompt_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "system_message"
    t.string "model"
    t.string "api_version"
  end

  create_table "chatgpt_messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "user_message"
    t.text "assistant_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chatgpt_dialogue_id"
  end

  create_table "chatgpt_prompt_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatgpt_prompt_category_connections", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chatgpt_prompt_id"
    t.integer "chatgpt_prompt_category_id"
  end

  create_table "chatgpt_prompts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.boolean "system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "system_message"
    t.text "user_message"
    t.integer "user_id"
    t.boolean "private"
  end

  create_table "city_phone_codes", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "city"
    t.string "region"
    t.string "code"
  end

  create_table "client_bonuses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "contract_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.boolean "payed_in_full", default: false
    t.boolean "has_card", default: false
    t.boolean "card_given", default: false
    t.boolean "deleted", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "card_ordered"
    t.index ["contract_id"], name: "index_client_bonuses_on_contract_id"
  end

  create_table "client_orders", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "interested_company_id"
    t.integer "user_id"
    t.string "currency"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "order_step"
    t.text "param"
    t.integer "our_ssl_certificate_id"
    t.index ["interested_company_id"], name: "index_client_orders_on_interested_company_id"
    t.index ["our_ssl_certificate_id"], name: "index_client_orders_on_our_ssl_certificate_id"
    t.index ["user_id"], name: "index_client_orders_on_user_id"
  end

  create_table "communication_licenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "companies", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "org_name_full"
    t.string "org_name_short"
    t.string "juridical_address"
    t.string "postal_address"
    t.string "ogrn"
    t.string "inn"
    t.string "kpp"
    t.string "okved"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "rokovod_job_title"
    t.string "rokovod_fio_short"
    t.string "rokovod_fio_full"
    t.string "rukovod_fio_full_rod"
    t.string "osnovanie"
    t.string "general_bank_name"
    t.string "general_bank_account"
    t.string "general_bank_bik"
    t.string "general_bank_correspondent_account"
    t.decimal "nds", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "company_trade_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "company_name"
    t.decimal "price", precision: 15, scale: 2
    t.text "info"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "visible", default: false
  end

  create_table "contact_people", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "title"
    t.string "organization_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "region"
    t.string "postal_code"
    t.string "country"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "first_name_transformed"
    t.string "last_name_transformed"
    t.string "title_transformed"
    t.string "organization_name_transformed"
    t.string "address_line_1_transformed"
    t.string "address_line_2_transformed"
    t.string "city_transformed"
    t.string "region_transformed"
    t.integer "country_id"
  end

  create_table "contract_containers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "dt_from"
    t.date "dt_to"
    t.string "period_type"
    t.decimal "period_count", precision: 10
    t.integer "contract_id"
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.decimal "price", precision: 10, scale: 2
    t.float "vat"
    t.string "currency"
    t.integer "nomenclature_id"
    t.index ["nomenclature_id"], name: "index_contract_containers_on_nomenclature_id"
  end

  create_table "contract_exceptions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "contract_id"
    t.string "exception_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contract_id"], name: "index_contract_exceptions_on_contract_id"
    t.index ["exception_type"], name: "index_contract_exceptions_on_exception_type"
  end

  create_table "contract_histories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_id"
    t.text "content"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "contract_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_id"
    t.integer "nomenclature_id"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.integer "quantity"
    t.decimal "vat", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "param"
    t.integer "crm_service_item_id"
    t.boolean "frequencies"
    t.boolean "external"
    t.text "decision"
    t.boolean "prolongation"
    t.string "prolonged_license_number"
    t.date "prolonged_license_validity_date"
    t.integer "comodo_order_number"
    t.string "currency", default: "RUB"
    t.text "param_backup"
    t.datetime "valid_from", precision: nil
    t.datetime "valid_to", precision: nil
    t.boolean "is_billed"
    t.boolean "is_paid"
    t.boolean "is_act_made"
    t.boolean "is_work_completed"
    t.integer "agreement_id"
    t.string "service_type_for_license"
    t.integer "contract_container_id"
    t.integer "resourceable_id"
    t.string "resourceable_type"
    t.integer "lead_item_id"
    t.index ["contract_id"], name: "contract_id_index"
    t.index ["lead_item_id"], name: "index_contract_items_on_lead_item_id"
    t.index ["nomenclature_id"], name: "nomenclature_id_index"
  end

  create_table "contract_items_act_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.integer "act_row_id"
    t.decimal "sum", precision: 10, scale: 2
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["act_row_id"], name: "index_contract_items_act_rows_on_act_row_id"
    t.index ["contract_item_id"], name: "index_contract_items_act_rows_on_contract_item_id"
  end

  create_table "contract_items_bill_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.integer "bill_row_id"
    t.decimal "sum", precision: 10, scale: 2
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["bill_row_id"], name: "index_contract_items_bill_rows_on_bill_row_id"
    t.index ["contract_item_id"], name: "index_contract_items_bill_rows_on_contract_item_id"
  end

  create_table "contract_items_bills", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.integer "bill_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "agreement_id"
    t.decimal "sum", precision: 10, scale: 2
  end

  create_table "contract_items_ripe_resources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.integer "ripe_resource_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "contract_options", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "contract_id"
    t.boolean "edo", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contract_id"], name: "index_contract_options_on_contract_id"
  end

  create_table "contract_sources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "isvisibleforclients"
    t.boolean "isdeleted"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "contract_state_histories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_id"
    t.integer "responsible_id"
    t.integer "contract_state_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "contract_states", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "color"
  end

  create_table "contractors", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "partner_order_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "contracts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contractor_id"
    t.integer "contractsource_id"
    t.integer "payer_business_entity_id"
    t.integer "payee_business_entity_id"
    t.integer "contract_state_id"
    t.text "comment"
    t.text "param"
    t.integer "owner_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "language", limit: 2
    t.string "otrs_ticket"
    t.integer "crm_client"
    t.integer "crm_order"
    t.integer "consignee_business_entity_id"
    t.string "currency", default: "RUB"
    t.integer "interested_company_id"
    t.integer "agreement_id"
    t.string "service_group"
    t.string "doc_path"
    t.index ["owner_id"], name: "ndx_contract_owner"
    t.index ["payee_business_entity_id"], name: "ndx_contract_payee_be"
    t.index ["payer_business_entity_id"], name: "ndx_contract_pay_be"
  end

  create_table "corrections", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "number"
    t.integer "agreement_id"
    t.date "dt"
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "countries", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "isocode"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "euro_union"
    t.string "currency"
    t.integer "phone_code"
    t.decimal "vat", precision: 10, scale: 2
    t.boolean "vat_for_eu"
    t.string "vat_code"
    t.string "oksm"
    t.string "slug"
  end

  create_table "country_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "country_id"
    t.string "locale"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["country_id"], name: "index_country_translations_on_country_id"
  end

  create_table "coupon_assignments", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.integer "coupon_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "coupon_type_nomenclatures", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "coupon_type_id"
    t.integer "nomenclature_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "coupon_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "kind"
    t.text "description", size: :medium
    t.integer "discount_value"
    t.string "currency"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_coupon_types_on_code"
  end

  create_table "coupons", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "token"
    t.datetime "expires_at", precision: nil
    t.integer "coupon_type_id"
    t.text "userids", size: :medium
    t.string "email"
    t.datetime "activated_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "product_min_usage_days"
    t.integer "product_max_usage_days"
    t.boolean "is_disposable", default: true
    t.integer "max_usage_count", default: 1
    t.decimal "usage_price", precision: 10, scale: 2
    t.decimal "discount_value", precision: 10, scale: 2
    t.string "currency"
    t.boolean "is_custom", default: false
    t.integer "business_entity_id"
    t.text "nomencl_ids", size: :medium
    t.text "country_codes", size: :medium
    t.datetime "new_price_activation_date", precision: nil
    t.boolean "check_subscription", default: false
  end

  create_table "currencies", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "currency_on"
    t.string "base_currency"
    t.string "counter_currency"
    t.decimal "exchange_rate", precision: 16, scale: 10
    t.string "source"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["base_currency", "counter_currency", "source"], name: "index_combined_3"
    t.index ["currency_on"], name: "index_currencies_on_currency_on"
  end

  create_table "dc_racks", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "delayed_jobs", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "demands", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "package_id"
    t.integer "contract_item_id"
    t.string "incoming_number"
    t.boolean "considered", default: false
    t.string "consideration_license_type"
    t.string "consideration_license_number"
    t.datetime "consideration_date", precision: nil
    t.boolean "number_type_relation", default: false
    t.boolean "rejected", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "license_id"
    t.index ["package_id"], name: "index_demands_on_package_id"
  end

  create_table "diadoc_entries", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "message_id"
    t.string "entry_id"
    t.integer "documentable_id"
    t.string "documentable_type"
    t.string "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["documentable_id"], name: "index_diadoc_entries_on_documentable_id"
    t.index ["documentable_type"], name: "index_diadoc_entries_on_documentable_type"
    t.index ["entry_id"], name: "index_diadoc_entries_on_entry_id"
    t.index ["message_id"], name: "index_diadoc_entries_on_message_id"
  end

  create_table "disk_image_source_users", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "disk_image_source_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["disk_image_source_id"], name: "index_disk_image_source_users_on_disk_image_source_id"
    t.index ["user_id"], name: "index_disk_image_source_users_on_user_id"
  end

  create_table "disk_image_sources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "file_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "login"
    t.string "password"
    t.string "os_type"
    t.boolean "check_smi"
    t.string "os"
    t.string "zfs_template"
    t.integer "server_storage_template_id"
    t.boolean "private", default: false
    t.index ["server_storage_template_id"], name: "index_disk_image_sources_on_server_storage_template_id"
  end

  create_table "dns_ns_groups", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "primary_ns_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "dns_ns_servers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "dns_ns_group_id"
    t.string "fqdn"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "ttl"
  end

  create_table "dns_records", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "dns_zone_id"
    t.string "local_part"
    t.integer "ttl"
    t.string "rr"
    t.string "data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["dns_zone_id"], name: "index_dns_records_on_dns_zone_id"
  end

  create_table "dns_zone_ns_statuses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "dns_zone_id", null: false
    t.integer "dns_ns_server_id", null: false
    t.string "status", default: "new", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "dns_zones", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "fqdn", null: false
    t.integer "ttl", null: false
    t.integer "dns_ns_group_id", null: false
    t.string "soa_hostmaster", null: false
    t.bigint "soa_serial", null: false
    t.integer "soa_refresh", null: false
    t.integer "soa_retry", null: false
    t.integer "soa_expire", null: false
    t.integer "soa_minimum", null: false
    t.string "status", default: "new", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["fqdn"], name: "index_dns_zones_on_fqdn"
  end

  create_table "document_licence_packages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "document_packages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "pkg_type"
    t.string "pkg_sort"
    t.integer "number"
    t.date "dt_registration"
    t.integer "business_entity_sender_id"
    t.string "org_sender"
    t.integer "business_entity_receiver_id"
    t.string "org_receiver"
    t.integer "crm_yur_fiz_id"
    t.integer "crm_order_id"
    t.integer "contract_id"
    t.integer "transport_company_id"
    t.string "transp_number"
    t.string "ish_komu"
    t.string "ish_kuda"
    t.date "ish_poluceno_dt"
    t.string "ish_poluceno_who"
    t.string "ish_who_pay"
    t.decimal "ish_pay_cost", precision: 10, scale: 2, default: "0.0"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "insured_letter_list_id"
    t.boolean "not_sent", default: false
    t.boolean "sent_confirmed", default: false
    t.index ["business_entity_receiver_id"], name: "index_document_packages_on_business_entity_receiver_id"
    t.index ["business_entity_sender_id"], name: "index_document_packages_on_business_entity_sender_id"
  end

  create_table "document_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "documents", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "document_type_id"
    t.integer "act_id"
    t.integer "my_act_id"
    t.integer "agreement_id"
    t.integer "my_agreement_id"
    t.integer "bill_id"
    t.integer "my_bill_id"
    t.integer "invoice_id"
    t.integer "my_invoice_id"
    t.string "seria"
    t.string "number"
    t.date "dt"
    t.integer "count_pages"
    t.integer "count_docs"
    t.string "status"
    t.text "comment"
    t.text "param"
    t.integer "document_package_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "domains_customers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "company_name"
    t.string "initials"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone_country_code"
    t.string "phone_area_code"
    t.string "phone_subscriber_number"
    t.string "street"
    t.string "house_number"
    t.string "house_suffix"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country_code"
    t.string "email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "edo_operators", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "inn"
    t.string "ogrn"
    t.string "address"
    t.string "status"
    t.boolean "active"
    t.date "valid_to"
    t.string "fns_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "egrul_entities", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name_short"
    t.string "inn"
    t.string "ogrn"
    t.string "mail_to"
    t.string "mail_address"
    t.string "zip"
    t.string "region"
    t.string "street"
    t.string "house"
    t.string "building"
    t.string "dir_last_name"
    t.string "dir_middle_name"
    t.string "dir_first_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "closed", default: false
    t.index ["inn"], name: "index_egrul_entities_on_inn"
    t.index ["ogrn"], name: "index_egrul_entities_on_ogrn"
  end

  create_table "elapsing_licenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "license_number", default: 0, null: false
    t.text "org_name", null: false
    t.text "org_addr", null: false
    t.text "key_word"
    t.text "url"
    t.text "license_type", null: false
    t.date "date_from"
    t.date "date_to"
    t.text "territory", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "lead_id"
    t.integer "parent_id"
    t.integer "child_id"
    t.date "check_date"
    t.boolean "existed", default: true
    t.string "inn", limit: 12
    t.integer "owner_id"
    t.integer "letter"
    t.date "date_reg"
    t.index ["active"], name: "index_elapsing_licenses_on_active"
    t.index ["date_to"], name: "index_elapsing_licenses_on_date_to"
    t.index ["license_number"], name: "index_elapsing_licenses_on_license_number"
    t.index ["owner_id"], name: "index_elapsing_licenses_on_owner_id"
    t.index ["parent_id"], name: "index_elapsing_licenses_on_parent_id"
  end

  create_table "event_booking_applications", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "event_id"
    t.string "applicant_name"
    t.string "applicant_email"
    t.string "applicant_phone"
    t.string "applicant_comment"
    t.datetime "meeting_start_at", precision: nil
    t.datetime "meeting_end_at", precision: nil
    t.string "token"
    t.index ["token"], name: "index_event_booking_applications_on_token"
  end

  create_table "events", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "start_local", precision: nil
    t.string "start_timezone"
    t.datetime "end_local", precision: nil
    t.string "end_timezone"
    t.string "logo_url"
    t.text "description"
    t.decimal "venue_lat", precision: 9, scale: 7
    t.decimal "venue_lng", precision: 10, scale: 7
    t.string "venue_address"
    t.string "venue_city"
    t.string "venue_region"
    t.string "venue_country"
    t.string "external_id"
    t.text "external_url"
    t.string "external_series_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "venue_building_image_url"
    t.text "slide_text"
    t.string "banner_url"
    t.string "slider_logo_url"
    t.integer "parent_id"
  end

  create_table "expense_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "expenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "buyer_business_entity_id"
    t.integer "contract_id"
    t.integer "supplier_business_entity_id"
    t.integer "expense_type_id"
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.date "dt"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "budget_version_id"
    t.integer "contract_item_id"
    t.integer "cfr_id"
    t.integer "year"
    t.integer "month"
    t.string "ditribution_strategy"
    t.string "budget_name"
  end

  create_table "extra_services", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.string "type"
    t.datetime "valid_from", precision: nil
    t.datetime "valid_to", precision: nil
    t.text "param", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contract_item_id"], name: "index_extra_services_on_contract_item_id"
    t.index ["type"], name: "index_extra_services_on_type"
  end

  create_table "faq_pdf_requests", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.string "contact_name"
    t.boolean "got_subscribed"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "feedbacks", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "fio"
    t.string "phone"
    t.string "email"
    t.text "msg", size: :medium
    t.string "call_from"
    t.string "call_to"
    t.string "call_day"
    t.boolean "is_sync"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "first_name"
    t.string "last_name"
    t.string "company"
  end

  create_table "file_names", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id"
    t.boolean "is_folder"
    t.string "code"
    t.string "name"
    t.string "short_description"
    t.text "long_description"
    t.integer "symlink_id"
    t.integer "importance"
    t.string "hash_md5"
    t.integer "file_size"
    t.string "content_type"
    t.integer "file_type_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "file_servers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "space_for_files"
    t.integer "used_space"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "file_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "extension"
    t.string "name"
    t.string "content_type"
    t.string "iconfile"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "forms", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "gdrp_confirmations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.datetime "gpu_requested_at", precision: nil
    t.datetime "gpu_confirmed_at", precision: nil
    t.text "gpu_confirmed_meta", size: :medium
    t.datetime "ssl_requested_at", precision: nil
    t.datetime "ssl_confirmed_at", precision: nil
    t.text "ssl_confirmed_meta", size: :medium
    t.datetime "other_requested_at", precision: nil
    t.datetime "other_confirmed_at", precision: nil
    t.text "other_confirmed_meta", size: :medium
    t.string "token"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "order_confirmed_at", precision: nil
    t.text "order_confirmed_meta"
    t.datetime "renewal_confirmed_at", precision: nil
    t.text "renewal_confirmed_meta"
    t.datetime "newsletter_confirmed_at", precision: nil
    t.text "newsletter_confirmed_meta"
    t.index ["email"], name: "index_gdrp_confirmations_on_email"
    t.index ["token"], name: "index_gdrp_confirmations_on_token"
  end

  create_table "generated_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "item_type"
    t.integer "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "glossaries", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "term"
    t.string "definition"
    t.string "source_name"
    t.string "source_url"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "histories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contractor_id"
    t.integer "businessentity_id"
    t.integer "person_id"
    t.integer "contract_id"
    t.integer "responsible_id"
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "param"
    t.integer "history_action_id"
    t.integer "lead_id"
    t.integer "license_id"
    t.index ["contract_id", "created_at"], name: "contract_created_ndx"
    t.index ["lead_id", "created_at"], name: "lead_created_ndx"
  end

  create_table "history_actions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "descriotion"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "host_servers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "domain"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "images", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at", precision: nil
  end

  create_table "industries", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "slug"
    t.index ["slug"], name: "index_industries_on_slug"
  end

  create_table "industry_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "industry_id"
    t.string "locale"
    t.string "name"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["industry_id"], name: "index_industry_translations_on_industry_id"
    t.index ["locale"], name: "index_industry_translations_on_locale"
  end

  create_table "insured_letter_lists", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "sended_date"
    t.integer "number"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "internal_event_applications", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "internal_event_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "organization_name"
    t.string "title"
    t.text "question", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "comments", size: :medium
    t.string "token"
    t.text "visits"
    t.index ["internal_event_id"], name: "index_internal_event_applications_on_internal_event_id"
    t.index ["token"], name: "index_internal_event_applications_on_token"
  end

  create_table "internal_event_types", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "internal_events", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "internal_event_type_id"
    t.text "description", size: :medium
    t.integer "interested_company_id"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.string "token"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "event_url"
    t.index ["interested_company_id"], name: "index_internal_events_on_interested_company_id"
    t.index ["internal_event_type_id"], name: "index_internal_events_on_internal_event_type_id"
    t.index ["token"], name: "index_internal_events_on_token"
  end

  create_table "invoice_annexes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "invoice_id"
    t.datetime "diadoc_export_at", precision: nil
    t.string "last_edo_status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["invoice_id"], name: "index_invoice_annexes_on_invoice_id"
  end

  create_table "invoice_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price_with_vat", precision: 15, scale: 2
    t.decimal "vat", precision: 10, scale: 2, default: "0.0"
    t.text "param"
    t.integer "invoice_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "msg"
    t.decimal "vat_in_money", precision: 15, scale: 2
    t.boolean "deleted", default: false
    t.decimal "accounting_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "accounting_price_with_vat", precision: 10, scale: 2, default: "0.0"
    t.string "accounting_currency"
    t.decimal "currency_rate", precision: 10, scale: 4, default: "1.0"
    t.integer "credited_invoice_row_id"
    t.decimal "price_without_vat", precision: 10, scale: 2
    t.string "vat_calculation_type", default: "modern_russian"
    t.integer "act_row_id"
    t.decimal "foreign_vat_in_money", precision: 10, scale: 2
    t.decimal "foreign_vat_rate", precision: 10, scale: 4
    t.index ["act_row_id"], name: "index_invoice_rows_on_act_row_id"
  end

  create_table "invoices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "number"
    t.date "dt"
    t.string "currency", default: "RUB"
    t.string "comment"
    t.integer "act_id"
    t.boolean "is_advance"
    t.text "param"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "template_id"
    t.integer "serial_number"
    t.integer "agreement_id"
    t.integer "signer_id"
    t.text "payment_doc"
    t.boolean "printed", default: false
    t.decimal "accounting_sum", precision: 10, scale: 2, default: "0.0"
    t.decimal "accounting_sum_with_vat", precision: 10, scale: 2, default: "0.0"
    t.string "accounting_currency"
    t.string "token"
    t.string "uuid"
    t.datetime "diadoc_export_at", precision: nil
    t.string "last_edo_status"
    t.decimal "foreign_vat_in_money", precision: 10, scale: 2
    t.decimal "foreign_vat_rate", precision: 10, scale: 4
    t.boolean "is_upd", default: false
    t.boolean "is_bill_set", default: false
    t.string "po"
    t.index ["token"], name: "index_invoices_on_token"
    t.index ["uuid"], name: "index_invoices_on_uuid"
  end

  create_table "ip_blacklists", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "ip"
    t.integer "attempt_counter"
    t.boolean "blocked", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ip"], name: "index_ip_blacklists_on_ip"
  end

  create_table "ip_whitelists", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "ip"
    t.bigint "ip_from"
    t.bigint "ip_to"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "role"
    t.string "tag"
    t.text "description"
    t.datetime "valid_to", precision: nil
    t.integer "user_id"
    t.index ["ip_from"], name: "index_ip_whitelists_on_ip_from"
    t.index ["ip_to"], name: "index_ip_whitelists_on_ip_to"
    t.index ["user_id"], name: "index_ip_whitelists_on_user_id"
  end

  create_table "job_companies", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.integer "business_entity_id"
    t.string "job_title"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["business_entity_id"], name: "index_job_companies_on_business_entity_id"
    t.index ["user_id"], name: "index_job_companies_on_user_id"
  end

  create_table "keyword_translations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "keyword_id"
    t.string "locale"
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["keyword_id"], name: "index_keyword_translations_on_keyword_id"
    t.index ["locale"], name: "index_keyword_translations_on_locale"
  end

  create_table "keywords", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_keywords_on_code"
  end

  create_table "lead_categories", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "lead_category_translations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "lead_category_id"
    t.string "locale"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["lead_category_id"], name: "index_lead_category_translations_on_lead_category_id"
    t.index ["locale"], name: "index_lead_category_translations_on_locale"
  end

  create_table "lead_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "lead_id"
    t.integer "nomenclature_id"
    t.decimal "price", precision: 10, scale: 2
    t.integer "days"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "csr"
    t.integer "ssl_server_software_id"
    t.string "dcv_email"
    t.string "domain_name"
    t.string "country_name"
    t.string "region_name"
    t.string "city_name"
    t.string "organization_name"
    t.string "organizational_unit"
    t.string "zip_code"
    t.string "address_1"
    t.string "address_2"
    t.boolean "with_frequencies"
    t.boolean "deleted", default: false
    t.integer "price_group"
    t.integer "provider_id"
    t.string "vat_number"
    t.string "csr_generation_side"
    t.text "additional_domains"
    t.text "additional_validation_emails"
    t.string "dcv_type"
    t.string "lead_type", default: "Lead"
    t.integer "quantity", default: 1
    t.integer "rfp_domain_quantity"
    t.string "inn"
    t.string "duns"
    t.string "yellow_pages"
    t.string "kvk"
    t.integer "standard_domains_count"
    t.integer "wildcard_domains_count"
    t.text "param"
    t.string "unique_value"
    t.index ["lead_id", "lead_type"], name: "index_lead_items_on_lead_id_and_lead_type"
  end

  create_table "lead_sources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "lead_status_traces", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "lead_id"
    t.string "status"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "leads", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "org_type"
    t.string "company"
    t.string "company_short"
    t.string "inn"
    t.string "kpp"
    t.string "status"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "title"
    t.string "mobile_phone"
    t.string "fax"
    t.string "juridical_address"
    t.string "postal_address"
    t.string "bank_name"
    t.string "bank_rs"
    t.string "bank_bik"
    t.string "bank_ks"
    t.string "head_fio_full"
    t.string "head_fio_rod"
    t.string "head_fio_short"
    t.string "head_job_title"
    t.string "head_osnovanie"
    t.text "description"
    t.boolean "is_converted_deprecated"
    t.string "lead_source", default: "SMB"
    t.text "param"
    t.text "pasport_serija"
    t.text "pasport_nomer"
    t.text "pasport_vydan"
    t.date "pasport_data"
    t.text "pasport_kod"
    t.text "service"
    t.datetime "user_on_site_date", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "owner_id"
    t.integer "created_by_id"
    t.datetime "callback_date", precision: nil
    t.integer "callback_priority"
    t.integer "contract_id"
    t.integer "interested_company_id"
    t.string "name"
    t.string "patronymic_name"
    t.string "head_fio_short_rod"
    t.string "head_job_title_rod"
    t.integer "parent_id"
    t.boolean "duplicated", default: false
    t.string "email2"
    t.string "email3"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_campaign"
    t.string "utm_content"
    t.string "utm_term"
    t.datetime "utm_created_at", precision: nil
    t.string "coupon"
    t.string "language", default: "ru"
    t.string "currency", default: "RUB"
    t.decimal "sum", precision: 10, scale: 2
    t.integer "possibility_of_contract"
    t.string "document_type"
    t.string "document_series"
    t.string "document_number"
    t.date "document_issued_on"
    t.string "document_issuer_name"
    t.string "document_issuer_code"
    t.string "ogrn"
    t.string "order_step"
    t.integer "admin_contact_person_id"
    t.integer "tech_contact_person_id"
    t.string "token"
    t.datetime "last_visit_at", precision: nil
    t.integer "notification_state", default: 0
    t.string "phone2"
    t.string "phone3"
    t.decimal "sell_vat_percent", precision: 10, scale: 2
    t.decimal "sell_vat_rub", precision: 10, scale: 2
    t.decimal "profit_rub", precision: 10, scale: 2
    t.boolean "sold_via_partner"
    t.integer "partner_business_entity_id"
    t.decimal "buy_price", precision: 10, scale: 2
    t.string "buy_price_currency"
    t.integer "score"
    t.integer "brand_weight"
    t.text "score_calculation"
    t.text "distribution_info"
    t.date "first_payment_dt"
    t.date "first_job_finished_dt"
    t.integer "conversion_in_days"
    t.boolean "is_resident_deprecated"
    t.string "remote_ip"
    t.boolean "comodo_subscriber_agreement_confirmed", default: false
    t.integer "country_id"
    t.string "region_name"
    t.string "city_name"
    t.string "organization_name"
    t.string "organizational_unit"
    t.string "zip_code"
    t.string "address_1"
    t.string "address_2"
    t.string "vat_number"
    t.string "payment_type"
    t.string "head_first_name"
    t.string "head_last_name"
    t.string "head_patronymic_name"
    t.string "head_phone"
    t.string "head_email"
    t.string "head_fax"
    t.string "client_id"
    t.string "comodo_login"
    t.string "comodo_pass"
    t.integer "user_id"
    t.string "site"
    t.string "ref_id"
    t.integer "quality_score"
    t.text "quality_score_calculation"
    t.string "double_id"
    t.string "integer"
    t.string "visit_id"
    t.integer "domains_customer_id"
    t.integer "coupon_id"
    t.boolean "product_changed"
    t.integer "auction_id"
    t.string "isp_ip_adderss"
    t.string "isp_server_info"
    t.boolean "skip_vat_validation", default: false
    t.boolean "entrust_non_refundable_confirmed", default: false
    t.index ["contract_id"], name: "index_leads_on_contract_id"
    t.index ["domains_customer_id"], name: "index_leads_on_domains_customer_id"
    t.index ["integer"], name: "index_leads_on_integer"
    t.index ["notification_state"], name: "index_leads_on_notification_state"
    t.index ["parent_id"], name: "index_leads_on_parent_id"
    t.index ["status", "owner_id"], name: "lead_status_owner_ndx"
    t.index ["user_id"], name: "index_leads_on_user_id"
    t.index ["visit_id"], name: "index_leads_on_visit_id"
  end

  create_table "leads_lead_categories", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "lead_id", null: false
    t.integer "lead_category_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["lead_category_id"], name: "index_leads_lead_categories_on_lead_category_id"
    t.index ["lead_id"], name: "index_leads_lead_categories_on_lead_id"
  end

  create_table "license_db_today", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "license_number", default: 0, null: false, unsigned: true
    t.text "org", null: false
    t.text "addr", null: false
    t.text "key_word", size: :tiny
    t.text "url", size: :tiny
    t.text "license_type", null: false
    t.date "date_from", null: false
    t.date "date_to", null: false
    t.text "territory", null: false
    t.column "is_active", "enum('true','false')"
    t.index ["key_word"], name: "idx_key_word", length: 10
    t.index ["license_number"], name: "idx_license_number"
    t.index ["org"], name: "idx_org", length: 10
    t.index ["url"], name: "idx_url", length: 10
  end

  create_table "license_log", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "license_number", default: 0, null: false, unsigned: true
    t.text "org", null: false
    t.text "addr", null: false
    t.text "license_type", null: false
    t.date "date_from", null: false
    t.date "date_to", null: false
    t.text "territory", null: false
    t.text "why_expired"
    t.column "type_modify", "enum('expired','new','continue',' redrafting')"
    t.date "date_modify", null: false
  end

  create_table "license_state_traces", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "license_id"
    t.integer "user_id"
    t.string "state"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "licenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "number"
    t.boolean "is_ready"
    t.date "recieved_date"
    t.integer "contract_id"
    t.integer "validity"
    t.boolean "queued_to_get"
    t.boolean "got_by_himself"
    t.date "transfer_date"
    t.integer "document_package_id"
    t.string "state"
    t.integer "demand_id"
    t.date "valid_from"
    t.date "valid_to"
    t.date "decree_date"
    t.boolean "hidden", default: false
    t.integer "lead_id"
    t.index ["contract_id"], name: "index_licenses_on_contract_id"
    t.index ["lead_id"], name: "index_licenses_on_lead_id"
  end

  create_table "live_demo_objects", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "status"
    t.text "data", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "uploaded_file_file_name"
    t.string "uploaded_file_content_type"
    t.integer "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at", precision: nil
    t.string "user_token"
    t.index ["user_token"], name: "index_live_demo_objects_on_user_token"
  end

  create_table "local_ips", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "host"
    t.string "ip"
    t.boolean "comodo_active"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "lock_ip", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "ip", default: 0, null: false
    t.integer "request_last_hour", default: 0, null: false
    t.integer "request_last_day", default: 0, null: false
    t.index ["ip"], name: "idx_ip"
  end

  create_table "log_request", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.text "request", null: false
    t.datetime "dt", precision: nil, null: false
    t.bigint "ip", default: 0, null: false
  end

  create_table "login_attempts", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "ip"
    t.string "country"
    t.string "result"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.string "email"
  end

  create_table "mail_server_domains", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_mail_server_domains_on_name"
  end

  create_table "mail_server_users", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "mail_server_domain_id"
    t.string "user"
    t.string "password"
    t.integer "quota"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "is_active"
    t.text "cc"
    t.text "forward"
    t.boolean "is_spam_scan_enabled"
    t.boolean "is_virus_scan_enabled"
    t.string "comment"
    t.index ["user"], name: "index_mail_server_users_on_user"
  end

  create_table "main_categories", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "message_relations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "message_id"
    t.integer "messagable_id"
    t.string "messagable_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["message_id"], name: "index_message_relations_on_message_id"
  end

  create_table "messages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "from_address", null: false
    t.string "reply_to_address"
    t.string "subject", null: false
    t.text "body"
    t.text "to_address", null: false
    t.text "cc_address"
    t.text "bcc_address"
    t.text "content"
    t.integer "created_by_user_id"
    t.datetime "sent_at", precision: nil
    t.datetime "received_at", precision: nil
    t.string "access_level", default: "all", null: false
    t.string "code", null: false
    t.string "destanation_type", null: false
    t.string "method_delivery", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "delivery_method"
    t.string "server"
    t.index ["created_at"], name: "index_messages_on_created_at"
  end

  create_table "municipal_formations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "province_id"
    t.string "name"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "news", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "dt"
    t.text "subject"
    t.text "shortcontent"
    t.text "content"
    t.date "dt_visible"
    t.string "type"
    t.integer "company_id"
    t.boolean "is_visible_first"
    t.boolean "is_deleted"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "image_name"
    t.boolean "is_internal"
    t.text "param"
    t.string "language"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "meta_title"
    t.string "preview_name"
    t.boolean "press_release"
    t.string "lead_image"
    t.text "lead_paragraph"
    t.text "extra_headers"
    t.boolean "hidden_on_site"
    t.string "slug"
    t.boolean "hide_tags"
  end

  create_table "news_placements", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "news_id"
    t.string "site_name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "news_subscriptions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "news_id"
    t.integer "user_id"
    t.datetime "dt_read", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["dt_read"], name: "ndx_ns_dt"
    t.index ["news_id"], name: "ndx_ns_news"
    t.index ["user_id"], name: "ndx_ns_user"
  end

  create_table "news_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "news_id"
    t.string "locale"
    t.string "subject"
    t.text "shortcontent"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "meta_keywords"
    t.string "meta_title"
    t.string "meta_description"
    t.text "lead_paragraph"
    t.string "slug"
    t.index ["locale"], name: "index_news_translations_on_locale"
    t.index ["news_id"], name: "index_news_translations_on_news_id"
  end

  create_table "nomenclature_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "short_description"
    t.text "description"
    t.integer "weight", default: 0
  end

  create_table "nomenclature_description_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_description_id"
    t.string "locale"
    t.text "buy"
    t.text "feature"
    t.text "footer"
    t.text "full"
    t.string "meta_description"
    t.string "meta_keywords"
    t.text "promo"
    t.text "purpose"
    t.text "short"
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.index ["locale"], name: "index_nomenclature_description_translations_on_locale"
    t.index ["nomenclature_description_id"], name: "index_ca8e59eb7647190fe2a88dd94627559884369339"
  end

  create_table "nomenclature_descriptions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.text "promo"
    t.text "purpose"
    t.text "feature"
    t.text "short"
    t.text "full"
    t.text "footer"
    t.text "buy"
    t.string "title"
    t.string "meta_keywords"
    t.string "meta_description"
    t.integer "nomenclature_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.string "url"
    t.integer "weight", default: 0
    t.index ["nomenclature_id"], name: "index_nomenclature_descriptions_on_nomenclature_id"
  end

  create_table "nomenclature_relations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.integer "related_nomenclature_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["nomenclature_id"], name: "index_nomenclature_relations_on_nomenclature_id"
    t.index ["related_nomenclature_id"], name: "index_nomenclature_relations_on_related_nomenclature_id"
  end

  create_table "nomenclature_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.string "locale"
    t.string "name"
    t.string "subject"
    t.text "row_template"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["nomenclature_id"], name: "index_dc16f88c189bcbb3979c320a37853bd4397672ce"
  end

  create_table "nomenclatures", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id"
    t.boolean "is_category"
    t.boolean "is_service"
    t.string "code"
    t.string "name"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.string "downpayment"
    t.text "param"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "frequencies"
    t.boolean "external"
    t.string "subject"
    t.string "engineering_part_new_file_name"
    t.datetime "engineering_part_new_updated_at", precision: nil
    t.string "engineering_part_prolonging_file_name"
    t.datetime "engineering_part_prolonging_updated_at", precision: nil
    t.integer "lft"
    t.integer "rgt"
    t.text "row_template"
    t.string "certificate_type"
    t.string "validation_type"
    t.boolean "is_ev"
    t.boolean "is_sgc"
    t.string "issuer_organization_name"
    t.string "brand"
    t.boolean "is_free", default: false
    t.string "supplier_name"
    t.string "supplier_code"
    t.boolean "discontinued", default: false
    t.integer "issue_count"
    t.boolean "negotiated_price"
    t.integer "payment_option_id"
    t.boolean "obsolete", default: false, null: false
    t.decimal "eu_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "us_price", precision: 10, scale: 2, default: "0.0"
    t.boolean "hidden", default: false
    t.boolean "is_email_validated"
    t.string "revenue_group"
    t.boolean "is_countable"
    t.string "period_type"
    t.integer "period_count"
    t.integer "weight", default: 0
    t.integer "extension_id"
    t.string "name_short"
    t.string "domain_name"
    t.boolean "is_prepayment", default: false
    t.integer "server_configuration_id"
    t.integer "max_duration"
    t.string "product_type"
    t.index ["extension_id"], name: "index_nomenclatures_on_extension_id"
    t.index ["server_configuration_id"], name: "index_nomenclatures_on_server_configuration_id"
  end

  create_table "nomenclatures_allowed_countries", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.integer "country_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["country_id"], name: "index_nomenclatures_allowed_countries_on_country_id"
    t.index ["nomenclature_id"], name: "index_nomenclatures_allowed_countries_on_nomenclature_id"
  end

  create_table "nomenclatures_disallowed_countries", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.integer "country_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["country_id"], name: "index_nomenclatures_disallowed_countries_on_country_id"
    t.index ["nomenclature_id"], name: "index_nomenclatures_disallowed_countries_on_nomenclature_id"
  end

  create_table "nomenclatures_nomenclature_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.integer "nomenclature_category_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "normalized_phones", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "phone"
    t.integer "entity_id"
    t.string "entity_type"
    t.integer "business_entity_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.string "field_name"
    t.index ["business_entity_id"], name: "index_normalized_phones_on_business_entity_id"
    t.index ["entity_id"], name: "index_normalized_phones_on_entity_id"
    t.index ["field_name"], name: "index_normalized_phones_on_field_name"
    t.index ["user_id"], name: "index_normalized_phones_on_user_id"
  end

  create_table "notices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.text "message", size: :medium
    t.boolean "read", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ns_to_url", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.string "ns", limit: 100, default: "", null: false
    t.string "url", limit: 100, default: "", null: false
  end

  create_table "openstat_ads", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "openstat_campaigns", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "openstat_services", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "openstat_sources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "id_partner_order", default: 0, null: false
    t.string "fio", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "coupon", limit: 50, default: "", null: false
    t.string "licenses", default: "", null: false
    t.column "uzel_svazi", "enum('true','false')"
    t.datetime "dt", precision: nil, null: false
    t.string "ip", limit: 15, default: "", null: false
  end

  create_table "osc_blacklists", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "domain_name"
    t.boolean "skip_auto_issue", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["domain_name"], name: "index_osc_blacklists_on_domain_name"
  end

  create_table "osc_history_states", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "state_type"
    t.string "state"
    t.datetime "dt", precision: nil
    t.integer "our_ssl_certificate_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "comments"
    t.index ["our_ssl_certificate_id"], name: "index_osc_history_states_on_our_ssl_certificate_id"
    t.index ["state"], name: "index_osc_history_states_on_state"
    t.index ["state_type"], name: "index_osc_history_states_on_state_type"
  end

  create_table "otrs_emails", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "otrs_arctilce_id"
    t.integer "otrs_ticket_id"
    t.string "otrs_subject"
    t.string "otrs_from"
    t.string "otrs_to"
    t.datetime "create_time", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "server"
    t.boolean "processed", default: false
    t.index ["otrs_from"], name: "index_otrs_emails_on_otrs_from"
    t.index ["otrs_to"], name: "index_otrs_emails_on_otrs_to"
    t.index ["server"], name: "index_otrs_emails_on_server"
  end

  create_table "our_certificates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.string "region"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["contract_item_id"], name: "index_our_certificates_on_contract_item_id"
  end

  create_table "our_ssl_certificates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contract_item_id"
    t.integer "nomenclature_id"
    t.text "csr"
    t.string "certificate_zip"
    t.string "country"
    t.string "zip"
    t.string "stateorprovincename"
    t.string "city"
    t.string "street1"
    t.string "street2"
    t.string "common_name"
    t.string "organisation_name"
    t.string "organisation_unit"
    t.integer "server_count", default: 1
    t.integer "domain_count", default: 1
    t.text "additional_domains"
    t.integer "ssl_server_software_id"
    t.integer "duration"
    t.string "issuer_order_number"
    t.string "validation_email"
    t.boolean "email_valid", default: false
    t.boolean "address_valid", default: false
    t.boolean "docs_valid", default: false
    t.decimal "issuer_price_predictand", precision: 10, scale: 2
    t.decimal "issuer_price_fact", precision: 10, scale: 2
    t.string "issuer_price_currency", default: "USD"
    t.boolean "charged_by_issuer", default: false
    t.decimal "our_sell_price", precision: 10, scale: 2
    t.string "our_sell_currency", default: "RUB"
    t.boolean "payed_by_customer"
    t.decimal "sell_vat_percent", precision: 10, scale: 2, default: "0.0"
    t.decimal "sell_vat_rub", precision: 10, scale: 2
    t.decimal "profit_rub", precision: 10, scale: 2
    t.date "pay_due_date"
    t.string "issuer_order_state"
    t.date "valid_from"
    t.date "valid_to"
    t.boolean "sold_via_partner", default: false
    t.integer "partner_business_entity_id"
    t.string "certificate_state"
    t.boolean "deleted", default: false
    t.string "serial_number"
    t.string "sk_order_number"
    t.date "end_date"
    t.boolean "current"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.datetime "issuer_order_date", precision: nil
    t.string "state"
    t.integer "admin_contact_person_id"
    t.integer "tech_contact_person_id"
    t.integer "issuer_business_entity_id"
    t.string "issuer_order_state_additional"
    t.string "issuer_order_state_minor_code"
    t.string "issuer_order_state_minor_name"
    t.datetime "approver_notified_date", precision: nil
    t.datetime "approver_confirm_date", precision: nil
    t.text "description"
    t.datetime "issued_dt", precision: nil
    t.datetime "sent_cert_dt", precision: nil
    t.string "issuer_contract_number"
    t.integer "prolongation_lead_id"
    t.string "organisation_name_transformed"
    t.string "organisation_unit_transformed"
    t.string "stateorprovincename_transformed"
    t.string "city_transformed"
    t.string "street1_transformed"
    t.string "street2_transformed"
    t.string "organisation_phone"
    t.string "organisation_fax"
    t.text "additional_validation_emails"
    t.integer "provider_id"
    t.string "provider_order_number"
    t.string "updated_by"
    t.string "company_number"
    t.string "dcv_method"
    t.integer "callback_contact_person_id"
    t.integer "prolonged_id"
    t.string "prolongation_status_from"
    t.string "prolongation_status_to"
    t.string "non_prolongarion_reason_code"
    t.text "non_prolongarion_reason_desc"
    t.string "prolongation_status_user"
    t.string "issuer_contract_id"
    t.string "lead_id"
    t.string "certificate_type"
    t.string "generalized_scope"
    t.boolean "internal", default: false
    t.string "duns"
    t.string "yellow_pages"
    t.text "comments"
    t.string "annulled_reason_code"
    t.text "annulled_reason_desc"
    t.boolean "autorevoke_under_validation", default: true, null: false
    t.integer "user_id"
    t.string "delivery_email"
    t.string "token"
    t.integer "replaced_from_id"
    t.boolean "manual_prolongation_link", default: false
    t.string "file_name"
    t.text "file_content"
    t.boolean "service"
    t.string "pending_state"
    t.integer "ev_upgraded_id"
    t.text "notes"
    t.datetime "cancel_request_dt", precision: nil
    t.string "original_order_number"
    t.string "unique_value"
    t.decimal "buy_accounting_price", precision: 10, scale: 2
    t.decimal "sell_accounting_price", precision: 10, scale: 2
    t.date "subscription_valid_from"
    t.date "subscription_valid_to"
    t.integer "subscription_duration"
    t.string "case_number"
    t.decimal "issuer_price_eur", precision: 10, scale: 2
    t.date "original_valid_from"
    t.index ["contract_item_id"], name: "contract_item_id_index"
    t.index ["nomenclature_id"], name: "nomenclature_id_index"
    t.index ["prolonged_id"], name: "index_our_ssl_certificates_on_prolonged_id"
    t.index ["replaced_from_id"], name: "index_our_ssl_certificates_on_replaced_from_id"
    t.index ["token"], name: "index_our_ssl_certificates_on_token"
    t.index ["user_id"], name: "index_our_ssl_certificates_on_user_id"
  end

  create_table "packages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "bring_date", precision: nil
    t.boolean "submitted", default: false
    t.datetime "int_number_assign_date", precision: nil
    t.boolean "int_number_assign", default: false
    t.string "state", default: "new"
    t.string "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "contract_id"
    t.string "int_number"
    t.integer "person_id"
    t.date "collected_date"
    t.date "send_date"
    t.boolean "closed"
    t.string "outgoing_number"
    t.date "outgoing_number_date"
    t.date "send_to_signature_date"
  end

  create_table "page_nomenclatures", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "page_id"
    t.integer "nomenclature_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["nomenclature_id"], name: "index_page_nomenclatures_on_nomenclature_id"
    t.index ["page_id"], name: "index_page_nomenclatures_on_page_id"
  end

  create_table "page_relations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "page_id"
    t.integer "related_page_id"
    t.index ["page_id"], name: "index_page_relations_on_page_id"
    t.index ["related_page_id"], name: "index_page_relations_on_related_page_id"
  end

  create_table "page_translations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "page_id"
    t.string "locale"
    t.string "title"
    t.text "meta_keywords"
    t.text "meta_description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_page_translations_on_locale"
    t.index ["page_id"], name: "index_page_translations_on_page_id"
  end

  create_table "pages", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "slug", null: false
    t.string "title"
    t.text "meta_keywords"
    t.text "meta_description"
    t.boolean "index", default: true
    t.boolean "sitemap", default: true
    t.boolean "renew", default: true
    t.string "path"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "extra_headers"
    t.boolean "hide_tags"
    t.string "entity_type"
    t.string "entity_image"
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "parameters", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "k"
    t.text "val"
    t.string "object_name"
    t.integer "object_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "partner_subscriptions", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.string "subscribe_token"
    t.string "unsubscribe_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "subscription_category_id"
    t.string "host"
    t.string "first_name"
    t.string "last_name"
    t.string "confirmed_host"
    t.datetime "unsubscribed_at", precision: nil
    t.string "unsubscribed_host"
    t.index ["subscription_category_id"], name: "index_partner_subscriptions_on_subscription_category_id"
  end

  create_table "partnerships", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "agreement_id"
    t.integer "price_category"
    t.date "valid_from"
    t.date "valid_to"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "payment_conditions"
    t.index ["agreement_id"], name: "index_partnerships_on_agreement_id"
  end

  create_table "payment_options", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "people", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "contractor_id"
    t.integer "business_entity_id"
    t.integer "grade_id"
    t.string "fio"
    t.string "fio_short"
    t.string "fio_rod"
    t.string "phone"
    t.string "email"
    t.string "job_title"
    t.string "osnovanie"
    t.boolean "is_protected"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "crm_person"
    t.text "param"
    t.string "email2"
    t.string "email3"
    t.string "phone2"
    t.string "phone3"
    t.string "job_title_genetive"
    t.string "fio_short_genetive"
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic_name"
    t.string "fax"
    t.string "token"
    t.integer "user_id"
    t.boolean "primary"
    t.integer "lead_id"
    t.string "comment"
    t.boolean "skip_bill_notification"
    t.string "timezone"
    t.index ["business_entity_id"], name: "index_people_on_business_entity_id"
    t.index ["lead_id"], name: "index_people_on_lead_id"
    t.index ["token"], name: "index_people_on_token"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "permissions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "role_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "person_accounts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.integer "global_user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "person_grades", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "is_protected"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "plans", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "item_code"
    t.decimal "number", precision: 10, scale: 2, default: "0.0"
    t.integer "duration"
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "power_of_attorneys", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "number"
    t.date "date_from"
    t.date "date_to"
    t.integer "person_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["person_id"], name: "index_power_of_attorneys_on_person_id"
  end

  create_table "power_stats", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_id"
    t.integer "instant"
    t.integer "average"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_id"], name: "index_power_stats_on_server_id"
  end

  create_table "power_statuses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "server_id"
    t.boolean "power_on"
    t.datetime "dt", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["dt"], name: "index_power_statuses_on_dt"
    t.index ["server_id"], name: "index_power_statuses_on_server_id"
  end

  create_table "prices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.decimal "price", precision: 10, scale: 2
    t.string "currency"
    t.integer "seller_business_entity_id"
    t.integer "sort"
    t.integer "site_id"
    t.integer "partner_business_entity_id"
    t.string "period_type"
    t.integer "period_count"
    t.integer "quantity_from"
    t.integer "quantity_to"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "providerable_id"
    t.string "providerable_type"
    t.boolean "pack", default: false
    t.datetime "valid_from", precision: nil
    t.datetime "valid_to", precision: nil
    t.string "kind"
    t.decimal "old_promo_price", precision: 10, scale: 2
    t.decimal "provider_price", precision: 10, scale: 2
    t.index ["nomenclature_id"], name: "index_prices_on_nomenclature_id"
    t.index ["partner_business_entity_id"], name: "index_prices_on_partner_business_entity_id"
    t.index ["providerable_id"], name: "index_prices_on_providerable_id"
    t.index ["seller_business_entity_id"], name: "index_prices_on_seller_business_entity_id"
    t.index ["sort"], name: "index_prices_on_sort"
  end

  create_table "print_package_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "print_package_id"
    t.integer "entity_id"
    t.string "entity_type"
    t.integer "owner_id"
    t.integer "quantity"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "edo", default: false
    t.index ["entity_type", "entity_id"], name: "index_print_package_rows_on_entity_type_and_entity_id"
    t.index ["print_package_id"], name: "index_print_package_rows_on_print_package_id"
  end

  create_table "print_packages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "package_type"
    t.datetime "printed_at", precision: nil
    t.integer "printed_by_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "pdf_path"
    t.string "call_method", default: "cook_pdf"
    t.integer "business_entity_id"
    t.string "envelope_path"
    t.boolean "frozen_docs", default: true
  end

  create_table "products", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "price"
    t.integer "price_with_radio"
    t.boolean "important"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.decimal "price_1", precision: 10, scale: 2
    t.decimal "price_2", precision: 10, scale: 2
    t.decimal "price_3", precision: 10, scale: 2
    t.decimal "price_4", precision: 10, scale: 2
    t.decimal "price_5", precision: 10, scale: 2
    t.decimal "price_with_radio_1", precision: 10, scale: 2
    t.decimal "price_with_radio_2", precision: 10, scale: 2
    t.decimal "price_with_radio_3", precision: 10, scale: 2
    t.decimal "price_with_radio_4", precision: 10, scale: 2
    t.decimal "price_with_radio_5", precision: 10, scale: 2
    t.integer "our_business_entity_id"
    t.integer "nomenclature_id"
  end

  create_table "projects", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "parent_id"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "promotion_nomenclatures", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "promotion_id"
    t.integer "nomenclature_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["nomenclature_id"], name: "index_promotion_nomenclatures_on_nomenclature_id"
    t.index ["promotion_id"], name: "index_promotion_nomenclatures_on_promotion_id"
  end

  create_table "promotions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "teaser_text"
    t.text "rules"
    t.date "start_at"
    t.date "end_at"
    t.string "code"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "meta_title"
    t.boolean "is_approved"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "provider_act_documents", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "provider_act_id"
    t.boolean "is_draft"
    t.boolean "has_original"
    t.integer "draft_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at", precision: nil
    t.string "status"
    t.index ["draft_id"], name: "index_provider_act_documents_on_draft_id"
    t.index ["provider_act_id"], name: "index_provider_act_documents_on_provider_act_id"
    t.index ["status"], name: "index_provider_act_documents_on_status"
  end

  create_table "provider_acts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "our_business_entity_id"
    t.integer "supplier_business_entity_id"
    t.decimal "sum_with_vat", precision: 15, scale: 2
    t.decimal "sum_without_vat", precision: 15, scale: 2
    t.float "vat"
    t.string "currency"
    t.date "dt"
    t.string "number"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "invoice_number"
    t.integer "provider_agreement_id"
    t.string "document_type"
    t.date "invoice_dt"
    t.integer "agreement_id"
    t.boolean "is_matched"
    t.integer "package_number"
    t.string "payment_type"
    t.integer "created_by"
    t.boolean "checked"
    t.index ["agreement_id"], name: "index_provider_acts_on_agreement_id"
    t.index ["created_by"], name: "index_provider_acts_on_created_by"
    t.index ["our_business_entity_id"], name: "index_provider_acts_on_our_business_entity_id"
    t.index ["provider_agreement_id"], name: "index_provider_acts_on_provider_agreement_id"
    t.index ["supplier_business_entity_id"], name: "index_provider_acts_on_supplier_business_entity_id"
  end

  create_table "provider_agreement_documents", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "provider_agreement_id"
    t.integer "draft_id"
    t.boolean "has_original"
    t.boolean "is_draft"
    t.string "document_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at", precision: nil
    t.index ["draft_id"], name: "index_provider_agreement_documents_on_draft_id"
    t.index ["provider_agreement_id"], name: "index_provider_agreement_documents_on_provider_agreement_id"
  end

  create_table "provider_agreements", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "our_business_entity_id"
    t.integer "supplier_business_entity_id"
    t.date "dt"
    t.string "number"
    t.string "currency"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["our_business_entity_id"], name: "index_provider_agreements_on_our_business_entity_id"
    t.index ["supplier_business_entity_id"], name: "index_provider_agreements_on_supplier_business_entity_id"
  end

  create_table "provider_bill_documents", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "draft_id"
    t.boolean "has_original"
    t.boolean "is_draft"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at", precision: nil
    t.integer "provider_bill_id"
    t.string "status"
    t.index ["draft_id"], name: "index_provider_bill_documents_on_draft_id"
    t.index ["provider_bill_id"], name: "index_provider_bill_documents_on_provider_bill_id"
    t.index ["status"], name: "index_provider_bill_documents_on_status"
  end

  create_table "provider_bill_provider_acts", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "provider_bill_id"
    t.integer "provider_agreement_id"
    t.integer "provider_act_id"
    t.decimal "sum", precision: 10, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["provider_act_id"], name: "index_provider_bill_provider_acts_on_provider_act_id"
    t.index ["provider_agreement_id"], name: "index_provider_bill_provider_acts_on_provider_agreement_id"
    t.index ["provider_bill_id"], name: "index_provider_bill_provider_acts_on_provider_bill_id"
  end

  create_table "provider_bills", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "our_business_entity_id"
    t.integer "supplier_business_entity_id"
    t.decimal "sum_with_vat", precision: 15, scale: 2
    t.decimal "sum_without_vat", precision: 15, scale: 2
    t.string "currency"
    t.date "dt"
    t.string "number"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "provider_agreement_id"
    t.string "document_type"
    t.index ["our_business_entity_id"], name: "index_provider_bills_on_our_business_entity_id"
    t.index ["provider_agreement_id"], name: "index_provider_bills_on_provider_agreement_id"
    t.index ["supplier_business_entity_id"], name: "index_provider_bills_on_supplier_business_entity_id"
  end

  create_table "provider_messages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "our_ssl_certificate_id"
    t.integer "external_id"
    t.string "from"
    t.string "to"
    t.text "message"
    t.datetime "creation_time", precision: nil
    t.boolean "expose"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["our_ssl_certificate_id"], name: "index_provider_messages_on_our_ssl_certificate_id"
  end

  create_table "provinces", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "push_subscriptions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "endpoint"
    t.string "p256dh"
    t.string "auth"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_push_subscriptions_on_user_id"
  end

  create_table "rack_feeds", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "dc_rack_id"
    t.integer "max_amps"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["dc_rack_id"], name: "index_rack_feeds_on_dc_rack_id"
  end

  create_table "real_estates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "area", precision: 10, scale: 2, default: "0.0"
    t.decimal "rent_const_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "rent_variable_price", precision: 10, scale: 2, default: "0.0"
    t.string "currency", default: "RUB"
    t.string "agreement_number"
    t.date "agreement_date"
    t.date "rent_start"
    t.date "rent_end"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "receipt_requests", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "receipt_id"
    t.time "dt"
    t.string "request_type"
    t.text "request_headers", size: :medium
    t.text "request_body", size: :medium
    t.string "response_code"
    t.text "response_body", size: :medium
    t.text "response_headers", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["receipt_id"], name: "index_receipt_requests_on_receipt_id"
  end

  create_table "receipts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "external_id"
    t.integer "document_number"
    t.integer "session_number"
    t.integer "number"
    t.string "fiscal_sign"
    t.string "device_number"
    t.string "reg_number"
    t.string "inn"
    t.string "receipt_type"
    t.string "ofd"
    t.string "url"
    t.string "qr_code_url"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "dt", precision: nil
    t.text "receipt_json", size: :medium
    t.integer "transaction_id"
    t.string "invoice_id"
    t.string "status"
    t.integer "acc_payment_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "attempts_count", default: 0
    t.integer "business_entity_id"
    t.index ["acc_payment_id"], name: "index_receipts_on_acc_payment_id"
    t.index ["business_entity_id"], name: "index_receipts_on_business_entity_id"
  end

  create_table "refund_comments", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content", size: :medium
    t.datetime "date", precision: nil
    t.integer "refund_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "comment_type"
  end

  create_table "refund_sources", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "refund_id", null: false
    t.integer "contract_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "acc_payments_bill_id"
    t.index ["acc_payments_bill_id"], name: "index_refund_sources_on_acc_payments_bill_id"
  end

  create_table "refunds", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "otrs_ticket"
    t.string "amount_type"
    t.text "comment", size: :medium
    t.string "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "deadline", precision: nil
    t.string "how_it_was_refunded"
    t.string "reference"
    t.decimal "payment_amount", precision: 10, scale: 2
    t.decimal "refund_amount", precision: 10, scale: 2
    t.string "title"
    t.integer "acc_payments_bill_id"
    t.string "currency"
    t.string "dispute"
    t.index ["acc_payments_bill_id"], name: "index_refunds_on_acc_payments_bill_id"
  end

  create_table "requests", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "package_id"
    t.string "license_type"
    t.string "int_number"
    t.boolean "considered", default: false
    t.string "consideration_license_type"
    t.string "consideration_license_number"
    t.datetime "consideration_date", precision: nil
    t.boolean "number_type_relation", default: false
    t.boolean "rejected", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "contract_item_id"
  end

  create_table "resumes", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "resume"
    t.string "attach_file_name"
    t.string "attach_content_type"
    t.integer "attach_file_size"
    t.datetime "attach_updated_at", precision: nil
    t.string "decision"
    t.datetime "appointment", precision: nil
    t.integer "user_id"
    t.integer "vacancy_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "reviews", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "company_name"
    t.string "snippet"
    t.text "content"
    t.string "name"
    t.string "job_title"
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "ripe_resources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "resource_type"
    t.date "assigned_date"
    t.string "ripe_person"
    t.string "as_number"
    t.string "ip_from"
    t.string "ip_to"
    t.string "company"
    t.string "ripe_ticket"
    t.date "document_date"
    t.string "document_status"
    t.string "md5"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "description"
    t.date "end_date"
    t.date "start_date"
    t.boolean "current_flag", default: false, null: false
    t.integer "interested_company_id"
    t.bigint "ip_from_int"
    t.bigint "ip_to_int"
    t.boolean "is_free", default: true
    t.boolean "is_domestic", default: false
  end

  create_table "ripe_resources_bills", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ripe_resource_id"
    t.integer "bill_id"
    t.integer "year"
    t.integer "quarter"
    t.string "payed_for"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "bill_row_id"
    t.integer "contract_items_bill_id"
  end

  create_table "roles", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "rolename"
    t.string "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "russian_city_inflections", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "genitive_case"
    t.string "prepositional_case"
    t.integer "status"
    t.integer "rating"
  end

  create_table "schema_info", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "version"
  end

  create_table "search_indices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "k"
    t.string "val"
    t.string "object_name"
    t.integer "object_id"
    t.date "expiration_date"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "sel_events", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "server_id"
    t.datetime "dt", precision: nil
    t.string "source"
    t.string "msg"
    t.datetime "notified_dt", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_id"], name: "index_sel_events_on_server_id"
  end

  create_table "sending_costs", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "standard_cost"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "server_accounts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.datetime "balance_time", precision: nil
    t.integer "contract_id"
    t.integer "agreement_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "max_concurrent_runs", default: 5
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.index ["agreement_id"], name: "index_server_accounts_on_agreement_id"
    t.index ["contract_id"], name: "index_server_accounts_on_contract_id"
  end

  create_table "server_activities", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_id"
    t.string "initiator"
    t.integer "user_id"
    t.integer "session_id"
    t.string "event"
    t.datetime "dt", precision: nil
    t.string "notes"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_id"], name: "index_server_activities_on_server_id"
    t.index ["session_id"], name: "index_server_activities_on_session_id"
    t.index ["user_id"], name: "index_server_activities_on_user_id"
  end

  create_table "server_assignments", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.string "period_type"
    t.integer "period_count"
    t.string "os_type"
    t.integer "disk_image_source_id"
    t.integer "start_options_id"
    t.integer "priority"
    t.integer "user_id"
    t.string "token"
    t.integer "contract_item_id"
    t.string "status"
    t.integer "server_id"
    t.string "password"
    t.datetime "start_at", precision: nil
    t.datetime "end_at", precision: nil
    t.datetime "break_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contract_item_id"], name: "index_server_assignments_on_contract_item_id"
    t.index ["disk_image_source_id"], name: "index_server_assignments_on_disk_image_source_id"
    t.index ["nomenclature_id"], name: "index_server_assignments_on_nomenclature_id"
    t.index ["server_id"], name: "index_server_assignments_on_server_id"
    t.index ["start_options_id"], name: "index_server_assignments_on_start_options_id"
    t.index ["token"], name: "index_server_assignments_on_token"
    t.index ["user_id"], name: "index_server_assignments_on_user_id"
  end

  create_table "server_assignmetn_sessions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_assignment_id"
    t.datetime "start_at", precision: nil
    t.datetime "end_at", precision: nil
    t.string "session_type"
    t.integer "duration"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_assignment_id"], name: "index_server_assignmetn_sessions_on_server_assignment_id"
  end

  create_table "server_configuration_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_configuration_id"
    t.string "locale"
    t.string "name"
    t.text "description"
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "best_for"
    t.index ["locale"], name: "index_server_configuration_translations_on_locale"
    t.index ["server_configuration_id"], name: "index_8b4e5f49e7f1f8d03ad5ba2b66b6fc547422aff4"
  end

  create_table "server_configurations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "config_short"
    t.string "gpu_config"
    t.text "config_full"
    t.string "gpu_ram"
    t.integer "gpu_ram_value"
    t.string "performance"
    t.integer "performance_value"
    t.integer "min_startup_time", default: 5
    t.string "type_gpu_cards"
    t.string "storage_type"
    t.integer "disk_size"
    t.integer "number_of_gpu_cards"
    t.integer "server_ram"
    t.integer "gpu_ram_size"
    t.decimal "cpu_frequency", precision: 10, scale: 2
    t.integer "number_of_cores"
    t.integer "number_of_cpu"
    t.string "cpu_brand"
    t.boolean "recommended", default: false
    t.integer "gpu_speed"
    t.string "best_for"
    t.string "meta_title"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "entity_image"
    t.string "storage_size"
    t.string "storage_type2"
    t.string "storage_size2"
    t.integer "related_configuration_1_id"
    t.integer "related_configuration_2_id"
    t.integer "related_configuration_3_id"
    t.boolean "new", default: false
    t.integer "weight", default: 0
    t.boolean "nvlink", default: false
  end

  create_table "server_contract_items", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "server_id"
    t.integer "contract_item_id"
    t.integer "user_id"
    t.boolean "actual"
    t.datetime "start_at", precision: nil
    t.datetime "end_at", precision: nil
    t.datetime "break_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "config_name"
    t.text "ipxe_config", size: :medium
    t.text "mac_config", size: :medium
    t.integer "disk_image_source_id"
    t.datetime "password_changed_at", precision: nil
    t.string "set_password"
    t.string "type"
    t.integer "priority", default: 0
    t.boolean "suspend_allowed"
    t.string "suspend_image_name"
    t.string "token"
    t.datetime "os_up", precision: nil
    t.boolean "keep_running"
    t.datetime "suspended_at", precision: nil
    t.integer "progress"
    t.text "comments", size: :medium
    t.boolean "skip_cleaning"
    t.boolean "cuda9"
    t.boolean "cuda10"
    t.string "period_type"
    t.integer "period_count"
    t.integer "nomenclature_id"
    t.integer "ssh_key_id"
    t.string "server_alias"
    t.text "description", size: :medium
    t.boolean "cuda11"
    t.boolean "auto_suspend", default: true
    t.boolean "cuda11_1"
    t.boolean "skip_postclean"
    t.boolean "cuda11_8"
    t.boolean "cuda12_1"
    t.index ["contract_item_id"], name: "index_server_contract_items_on_contract_item_id"
    t.index ["disk_image_source_id"], name: "index_server_contract_items_on_disk_image_source_id"
    t.index ["nomenclature_id"], name: "index_server_contract_items_on_nomenclature_id"
    t.index ["server_id"], name: "index_server_contract_items_on_server_id"
    t.index ["ssh_key_id"], name: "index_server_contract_items_on_ssh_key_id"
    t.index ["user_id"], name: "index_server_contract_items_on_user_id"
  end

  create_table "server_corpus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "server_corrections", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "billing_session_id"
    t.integer "created_by_id"
    t.string "correction_type"
    t.datetime "approved_at", precision: nil
    t.integer "approved_by_id"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "declined_at", precision: nil
    t.index ["approved_by_id"], name: "index_server_corrections_on_approved_by_id"
    t.index ["billing_session_id"], name: "index_server_corrections_on_billing_session_id"
    t.index ["created_by_id"], name: "index_server_corrections_on_created_by_id"
  end

  create_table "server_directions", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "server_contract_item_id"
    t.string "direction"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_contract_item_id"], name: "index_server_directions_on_server_contract_item_id"
  end

  create_table "server_disk_image_sources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_id"
    t.integer "disk_image_source_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["disk_image_source_id"], name: "index_server_disk_image_sources_on_disk_image_source_id"
    t.index ["server_id"], name: "index_server_disk_image_sources_on_server_id"
  end

  create_table "server_log_entries", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_order_id"
    t.integer "server_id"
    t.integer "user_id"
    t.string "entry_type"
    t.string "message"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_id"], name: "index_server_log_entries_on_server_id"
    t.index ["server_order_id"], name: "index_server_log_entries_on_server_order_id"
    t.index ["user_id"], name: "index_server_log_entries_on_user_id"
  end

  create_table "server_order_items", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_order_id"
    t.integer "nomenclature_id"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.integer "quantity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "server_storage_template_id"
    t.integer "server_configuration_id"
    t.index ["nomenclature_id"], name: "index_server_order_items_on_nomenclature_id"
    t.index ["server_configuration_id"], name: "index_server_order_items_on_server_configuration_id"
    t.index ["server_order_id"], name: "index_server_order_items_on_server_order_id"
    t.index ["server_storage_template_id"], name: "index_server_order_items_on_server_storage_template_id"
  end

  create_table "server_orders", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_account_id"
    t.integer "server_id"
    t.string "token"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "status"
    t.datetime "last_calc_time", precision: nil
    t.datetime "break_at", precision: nil
    t.datetime "user_break_at", precision: nil
    t.boolean "archived", default: false
    t.string "set_password"
    t.boolean "skip_cleaning"
    t.boolean "cuda9"
    t.boolean "cuda10"
    t.integer "ssh_key_id"
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.index ["server_account_id"], name: "index_server_orders_on_server_account_id"
    t.index ["ssh_key_id"], name: "index_server_orders_on_ssh_key_id"
    t.index ["status"], name: "index_server_orders_on_status"
    t.index ["token"], name: "index_server_orders_on_token"
  end

  create_table "server_parts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "server_server_parts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "server_id"
    t.integer "server_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "server_corpus_id"
  end

  create_table "server_sessions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.datetime "start_dt", precision: nil
    t.datetime "end_dt", precision: nil
    t.integer "duration"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "server_contract_item_id"
    t.datetime "actual_up", precision: nil
    t.integer "server_id"
    t.integer "disk_image_source_id"
    t.integer "contract_item_id"
    t.string "image_name"
    t.string "status"
    t.integer "server_storage_image_id"
    t.integer "server_order_id"
    t.datetime "os_up", precision: nil
    t.string "set_password"
    t.integer "ssh_key_id"
    t.index ["contract_item_id"], name: "index_server_sessions_on_contract_item_id"
    t.index ["disk_image_source_id"], name: "index_server_sessions_on_disk_image_source_id"
    t.index ["server_contract_item_id"], name: "index_server_sessions_on_server_contract_item_id"
    t.index ["server_id"], name: "index_server_sessions_on_server_id"
    t.index ["server_order_id"], name: "index_server_sessions_on_server_order_id"
    t.index ["server_storage_image_id"], name: "index_server_sessions_on_server_storage_image_id"
    t.index ["status"], name: "index_server_sessions_on_status"
  end

  create_table "server_storage_images", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "server_storage_id"
    t.integer "server_storage_template_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.index ["server_storage_id"], name: "index_server_storage_images_on_server_storage_id"
    t.index ["server_storage_template_id"], name: "index_server_storage_images_on_server_storage_template_id"
  end

  create_table "server_storage_template_servers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_storage_template_id"
    t.integer "server_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_id"], name: "index_server_storage_template_servers_on_server_id"
    t.index ["server_storage_template_id"], name: "server_storage_servers_ids"
  end

  create_table "server_storage_template_storages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "server_storage_template_id"
    t.integer "server_storage_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_storage_id"], name: "index_server_storage_template_storages_on_server_storage_id"
    t.index ["server_storage_template_id"], name: "server_storage_templates_ids"
  end

  create_table "server_storage_templates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "file_name"
    t.string "login"
    t.string "password"
    t.string "os_type"
    t.string "os"
    t.string "zfs_template"
    t.integer "server_storage_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "server_account_id"
    t.index ["server_account_id"], name: "index_server_storage_templates_on_server_account_id"
    t.index ["server_storage_id"], name: "index_server_storage_templates_on_server_storage_id"
  end

  create_table "server_storages", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "queue"
    t.string "ip"
    t.string "storage_type"
    t.string "inventory"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "servers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.integer "nomenclature_id"
    t.string "status"
    t.boolean "available"
    t.text "comments", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "mac_address"
    t.string "ipmi_login"
    t.string "ipmi_pass"
    t.string "ipmi_ip"
    t.string "image_name"
    t.datetime "last_os_up", precision: nil
    t.string "queue"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.date "install_date"
    t.integer "processors"
    t.integer "cores"
    t.integer "authcredential_id"
    t.integer "extent_id"
    t.string "iscsi_target_auth_secret"
    t.string "iscsi_target_auth_user"
    t.datetime "clean_at", precision: nil
    t.string "apc_ip"
    t.integer "apc_port"
    t.integer "server_configuration_id"
    t.integer "server_storage_id"
    t.boolean "hidden", default: false
    t.boolean "maintenance", default: false
    t.index ["nomenclature_id"], name: "index_servers_on_nomenclature_id"
    t.index ["server_configuration_id"], name: "index_servers_on_server_configuration_id"
    t.index ["server_storage_id"], name: "index_servers_on_server_storage_id"
  end

  create_table "service_attendants", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "service_id"
    t.integer "attendant_service_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "services", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id"
    t.boolean "is_category"
    t.text "name"
    t.string "name_short"
    t.string "meta_keywords"
    t.string "meta_description"
    t.string "meta_title"
    t.text "content"
    t.integer "popular"
    t.decimal "price", precision: 10
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "lft"
    t.integer "rgt"
  end

  create_table "services_businesses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "service_id"
    t.integer "business_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "sessions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "session_id", default: "", null: false
    t.text "data", size: :medium
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "site_entrances", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "openstat_service_id"
    t.integer "openstat_campaign_id"
    t.integer "openstat_ad_id"
    t.integer "openstat_source_id"
    t.integer "adv_media_id"
    t.integer "adv_content_id"
    t.integer "adv_campagin_id"
    t.integer "adv_sitetarget_id"
    t.text "keyword"
    t.text "user_phrase"
    t.string "ip"
    t.integer "host_server_id"
    t.string "host_referrer"
    t.text "uri"
    t.text "referrer"
    t.integer "user_agent_id"
    t.integer "visitor_code_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "sitealizer", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "path"
    t.string "ip"
    t.string "referer"
    t.string "language"
    t.string "user_agent"
    t.datetime "created_at", precision: nil
    t.date "created_on"
  end

  create_table "sites", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "property_id"
    t.string "alias"
    t.string "public_name"
    t.string "chat_version"
  end

  create_table "sites_no_hosters", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.string "url", limit: 100, default: "", null: false
    t.string "comment", limit: 100, default: "", null: false
  end

  create_table "software_license_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "software_license_id"
    t.string "locale"
    t.string "name"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_software_license_translations_on_locale"
    t.index ["software_license_id"], name: "index_software_license_translations_on_software_license_id"
  end

  create_table "software_licenses", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "license_type"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "slug"
    t.index ["slug"], name: "index_software_licenses_on_slug"
  end

  create_table "solution_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "slug"
    t.index ["slug"], name: "index_solution_categories_on_slug"
  end

  create_table "solution_category_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "solution_category_id"
    t.string "locale"
    t.string "name"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_solution_category_translations_on_locale"
    t.index ["solution_category_id"], name: "index_solution_category_translations_on_solution_category_id"
  end

  create_table "solution_industries", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "solution_id"
    t.integer "industry_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["industry_id"], name: "index_solution_industries_on_industry_id"
    t.index ["solution_id"], name: "index_solution_industries_on_solution_id"
  end

  create_table "solution_solution_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "solution_id"
    t.integer "solution_category_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["solution_category_id"], name: "index_solution_solution_categories_on_solution_category_id"
  end

  create_table "solution_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "solution_id"
    t.string "locale"
    t.string "name"
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_solution_translations_on_locale"
    t.index ["solution_id"], name: "index_solution_translations_on_solution_id"
  end

  create_table "solutions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "logo"
    t.integer "software_license_id"
    t.text "description", size: :medium
    t.integer "score"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at", precision: nil
    t.string "slug"
    t.string "version"
    t.boolean "hidden"
    t.index ["slug"], name: "index_solutions_on_slug"
    t.index ["software_license_id"], name: "index_solutions_on_software_license_id"
  end

  create_table "spam_protections", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.boolean "whitelist"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_spam_protections_on_email"
  end

  create_table "ssh_keys", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "public_key"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_ssh_keys_on_user_id"
  end

  create_table "ssl_certificate_provider_balances", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ssl_certificate_provider_id"
    t.date "dt"
    t.decimal "balance", precision: 10, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ssl_certificate_provider_id"], name: "index_provider_balance_provider_id"
  end

  create_table "ssl_certificate_provider_nomenclatures", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ssl_certificate_provider_id"
    t.integer "nomenclature_id"
    t.string "nomenclature_code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ssl_certificate_provider_id"], name: "nomeclature_provider__id"
  end

  create_table "ssl_certificate_provider_ssl_server_softwares", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ssl_certificate_provider_id"
    t.integer "ssl_server_software_id"
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ssl_certificate_provider_id"], name: "cproviderid"
    t.index ["ssl_server_software_id"], name: "cserverid"
  end

  create_table "ssl_certificate_providers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "login"
    t.string "pass"
    t.string "api_url"
    t.integer "business_entity_id"
    t.string "partner_code"
    t.string "code"
    t.boolean "current_flag", default: true, null: false
    t.index ["business_entity_id"], name: "index_ssl_certificate_providers_on_business_entity_id"
  end

  create_table "ssl_comodo_products", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "nomenclature_id"
  end

  create_table "ssl_domain_prices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "quantity_from"
    t.decimal "price", precision: 10, scale: 2
    t.string "currency", default: "RUB"
    t.boolean "buy", default: false
    t.integer "price_group", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "ssl_year_price_id"
    t.integer "quantity_to"
    t.boolean "pack"
    t.boolean "is_wildcard", default: false
  end

  create_table "ssl_issuer_act_rows", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ssl_issuer_act_id"
    t.integer "our_ssl_certificate_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.decimal "price", precision: 10, scale: 2
    t.integer "contract_item_id"
    t.index ["contract_item_id"], name: "index_ssl_issuer_act_rows_on_contract_item_id"
  end

  create_table "ssl_issuer_acts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "number"
    t.date "act_date"
    t.integer "seller_business_entity_id"
    t.integer "buyer_business_entity_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "provider_id"
    t.date "ssl_certificate_valid_to"
    t.string "agreement_number"
    t.string "reseller_agreement_number"
    t.date "agreement_date"
    t.string "invoice_number"
    t.date "invoice_date"
    t.decimal "invoice_sum", precision: 10, scale: 2
    t.string "currency"
    t.decimal "rows_total_price", precision: 10, scale: 2
  end

  create_table "ssl_server_prices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.decimal "price", precision: 10, scale: 2
    t.string "currency", default: "RUB"
    t.boolean "buy", default: false
    t.integer "price_group", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "ssl_server_software_translations", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "ssl_server_software_id"
    t.string "locale"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_ssl_server_software_translations_on_locale"
    t.index ["ssl_server_software_id"], name: "index_6164aa03d56d39ad3e193f77e3d3a1e6170baae7"
  end

  create_table "ssl_server_softwares", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "issuer"
    t.string "short_name"
    t.integer "ssl_certificate_provider_id"
  end

  create_table "ssl_year_prices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "nomenclature_id"
    t.integer "year"
    t.decimal "price", precision: 10, scale: 2
    t.string "currency", default: "RUB"
    t.boolean "buy", default: false
    t.integer "price_group", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "ssl_certificate_provider_id"
  end

  create_table "stat_domains", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.string "ns_server", limit: 100, default: "", null: false
    t.integer "count_domains", default: 0, null: false
    t.date "dt", null: false
  end

  create_table "statistics", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "uuid"
    t.string "ip"
    t.string "country"
    t.string "region"
    t.string "action_code"
    t.string "brand"
    t.string "product"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "vat", precision: 7, scale: 4
    t.integer "price_group"
    t.string "currency", default: "RUB"
    t.date "order_date"
    t.boolean "payed", default: false
    t.boolean "old_client", default: false
    t.decimal "buy_price", precision: 10, scale: 2
    t.string "buy_currency"
    t.integer "ssl_duration"
    t.boolean "comodo_to_thawte", default: false
    t.integer "lead_id"
    t.integer "contract_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "lang"
    t.string "site"
    t.datetime "utm_created_at", precision: nil
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_campaign"
    t.string "utm_content"
    t.string "utm_term"
    t.string "referrer", limit: 1024
  end

  create_table "stop_words", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "word"
    t.string "word_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["word"], name: "index_stop_words_on_word"
    t.index ["word_type"], name: "index_stop_words_on_word_type"
  end

  create_table "subscribe_emails", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.integer "bounce_count"
    t.string "confirmation_code"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "permanent_fail", default: false
  end

  create_table "subscribe_lists", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "business_entity_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "param"
  end

  create_table "subscribe_release_visits", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "ip"
    t.string "user_agent"
    t.string "url"
    t.boolean "bot", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "site_id"
    t.integer "subscribe_releases_email_id"
    t.index ["site_id"], name: "index_subscribe_release_visits_on_site_id"
    t.index ["subscribe_releases_email_id"], name: "index_subscribe_release_visits_on_subscribe_releases_email_id"
  end

  create_table "subscribe_releases", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "subscribe_list_id"
    t.string "name"
    t.string "subject"
    t.string "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "param"
    t.string "template"
    t.integer "internal_event_id"
    t.index ["internal_event_id"], name: "index_subscribe_releases_on_internal_event_id"
  end

  create_table "subscribe_releases_attachments", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "subscribe_release_id"
    t.string "content_type"
    t.string "file_name"
    t.integer "template_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "subscribe_releases_emails", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "subscribe_email_id"
    t.integer "subscribe_release_id"
    t.integer "subscribe_list_id"
    t.datetime "dt_sent", precision: nil
    t.datetime "dt_intrest", precision: nil
    t.datetime "dt_unsubscribe", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "temporary_fail", default: false
    t.string "token"
    t.string "title"
    t.string "entity_type"
    t.integer "entity_id"
    t.integer "lead_id"
    t.index ["entity_id"], name: "index_subscribe_releases_emails_on_entity_id"
    t.index ["lead_id"], name: "index_subscribe_releases_emails_on_lead_id"
    t.index ["token"], name: "index_subscribe_releases_emails_on_token"
  end

  create_table "subscribers", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.string "domain"
    t.string "verify_token"
    t.string "confirmed", default: "0"
    t.string "unsubscribe_token"
    t.string "locale"
    t.datetime "last_sent", precision: nil
    t.string "host"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "subscription_categories", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "display_name"
    t.string "language"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_subscription_categories_on_code"
  end

  create_table "subscription_category_translations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "subscription_category_id"
    t.string "locale"
    t.string "display_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_subscription_category_translations_on_locale"
    t.index ["subscription_category_id"], name: "index_cd15581b49fcb5f34511cc791a0d8f1390c5920b"
  end

  create_table "tag_translations", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "tag_id"
    t.string "locale"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "description"
    t.index ["locale"], name: "index_tag_translations_on_locale"
    t.index ["tag_id"], name: "index_tag_translations_on_tag_id"
  end

  create_table "taggings", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", collation: "utf8mb3_bin"
    t.integer "taggings_count", default: 0
    t.text "extra_headers"
    t.text "description"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "task_members", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "memberable_id"
    t.string "memberable_type"
    t.string "role"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "task_relations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "task_id"
    t.integer "taskable_id"
    t.integer "taskable_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_id"], name: "index_task_relations_on_task_id"
    t.index ["taskable_id"], name: "index_task_relations_on_taskable_id"
    t.index ["taskable_type"], name: "index_task_relations_on_taskable_type"
  end

  create_table "tasks", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "template_categories", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "category_type"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "template_translations", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "template_id"
    t.string "locale"
    t.string "name"
    t.text "main_text"
    t.text "html_text"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["template_id"], name: "index_template_translations_on_template_id"
  end

  create_table "templates", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "business_entity_id"
    t.string "template_type"
    t.string "code"
    t.string "name"
    t.integer "version"
    t.boolean "is_production"
    t.integer "author_id"
    t.text "comment"
    t.string "format"
    t.text "header_text"
    t.text "main_text", size: :long
    t.text "footer_text"
    t.text "param"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "rtf_file_name"
    t.datetime "rtf_updated_at", precision: nil
    t.text "html_text"
    t.integer "template_category_id"
  end

  create_table "time_resources", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_type_id"
    t.datetime "start_dt", precision: nil
    t.datetime "end_dt", precision: nil
    t.integer "duration"
    t.string "desc"
    t.integer "project_id"
    t.integer "task_id"
    t.integer "contract_id"
    t.integer "approved_by_id"
    t.integer "estimate_duration"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "is_deleted"
  end

  create_table "tiny_prints", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_file_size"
    t.string "image_content_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "tiny_videos", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "original_file_name"
    t.string "original_file_size"
    t.string "original_content_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "translation_files", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "status"
    t.integer "count_words"
    t.string "task_reference"
    t.integer "project"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "file_sent", default: false
    t.integer "translator_id"
    t.date "date_sending"
    t.string "token"
    t.datetime "token_generated_at", precision: nil
    t.string "files_for_proofread"
    t.string "files_with_keys"
    t.string "files_with_proofreads"
  end

  create_table "translation_lang_docs", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "language"
    t.string "otrs_reference"
    t.integer "status"
    t.integer "translation_file_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "published_article"
    t.boolean "file_sent", default: false
    t.integer "translator_id"
    t.date "date_sending"
    t.string "token"
    t.datetime "token_generated_at", precision: nil
  end

  create_table "translations", id: :integer, charset: "utf8mb3", collation: "utf8mb3_bin", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value", size: :medium
    t.text "interpolations", size: :medium
    t.boolean "is_proc", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale", "key"], name: "index_translations_on_locale_and_key", unique: true
  end

  create_table "translators", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "translation_company"
    t.string "contact_name"
    t.string "email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "transport_companies", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "cnt"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "ups", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "ip"
    t.string "ups_type"
    t.string "rack"
    t.string "feed"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ups_powers", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "ups_id"
    t.time "time"
    t.decimal "consumption", precision: 8, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "user_agents", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "user_contact_items", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "title"
    t.integer "user_contact_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_contact_id"], name: "index_user_contact_items_on_user_contact_id"
  end

  create_table "user_contacts", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "org_name"
    t.string "name_short"
    t.string "vat_number"
    t.integer "country_id"
    t.string "postcode"
    t.string "region"
    t.string "address"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "city"
    t.string "postal_address"
    t.string "kpp"
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "user_profiles", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "windows_license_accepted", precision: nil
    t.datetime "nvidia_license_accepted", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "vps", default: false
    t.boolean "ssl", default: false
    t.boolean "servers", default: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "user_server_accounts", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.integer "server_account_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["server_account_id"], name: "index_user_server_accounts_on_server_account_id"
    t.index ["user_id"], name: "index_user_server_accounts_on_user_id"
  end

  create_table "user_ui_setups", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "description"
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "crypted_password", limit: 40
    t.string "salt", limit: 40
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "remember_token"
    t.datetime "remember_token_expires_at", precision: nil
    t.string "activation_code", limit: 40
    t.datetime "activated_at", precision: nil
    t.string "password_reset_code", limit: 40
    t.boolean "enabled", default: true
    t.string "time_zone"
    t.string "language", limit: 2, default: "en"
    t.integer "rows_per_page", default: 10, unsigned: true
    t.string "fio"
    t.string "phone", limit: 20
    t.string "unsudo_code"
    t.text "comment"
    t.boolean "sms_enabled", default: false
    t.integer "contract_id"
    t.string "job_title"
    t.integer "person_id"
    t.string "company"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.boolean "insider", default: false
    t.string "jabber"
    t.string "inn"
    t.string "local_phone"
    t.string "mobile_phone"
    t.integer "otrs_owner_id"
    t.string "otrs_default_queue"
    t.integer "business_entity_id"
    t.integer "real_estate_id", default: 1
    t.boolean "is_uses_real_estate_space", default: true
    t.boolean "is_uses_smb", default: true
    t.integer "cfr_id"
    t.string "authentication_token"
    t.string "megaplan_login"
    t.string "megaplan_pass_md5"
    t.string "call_context"
    t.string "comodo_login"
    t.string "comodo_pass"
    t.boolean "production"
    t.datetime "password_reset_code_expires_at", precision: nil
    t.string "public_token"
    t.boolean "password_set", default: false
    t.string "token"
    t.boolean "otp_enabled", default: false
    t.boolean "otp_in_process", default: false
    t.string "otp_secret"
    t.integer "otp_last_at"
    t.string "otp_restore_secret"
    t.string "otp_disable_secret"
    t.string "secondary_local_phone"
    t.index ["insider"], name: "index_users_on_insider"
    t.index ["otp_disable_secret"], name: "index_users_on_otp_disable_secret", unique: true
    t.index ["otp_restore_secret"], name: "index_users_on_otp_restore_secret", unique: true
    t.index ["otp_secret"], name: "index_users_on_otp_secret"
    t.index ["public_token"], name: "index_users_on_public_token"
    t.index ["token"], name: "index_users_on_token"
  end

  create_table "vacancies", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "job_position"
    t.text "requirements"
    t.text "responsibility"
    t.text "conditions"
    t.text "contacts"
    t.integer "business_entity_id"
    t.text "state"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "valvat_responses", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "country_code"
    t.string "vat_number"
    t.date "request_date"
    t.string "name"
    t.string "company_type"
    t.string "address"
    t.string "request_identifier"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["vat_number"], name: "index_valvat_responses_on_vat_number"
  end

  create_table "versions", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at", precision: nil
    t.text "object_changes"
    t.string "locale"
    t.datetime "updated_at", precision: nil
    t.index ["created_at"], name: "index_versions_on_created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["whodunnit", "created_at"], name: "index_whodunnit_created_at"
  end

  create_table "visit_logs", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.date "dt"
    t.string "ip"
    t.integer "host_server_id"
    t.string "host_referrer"
    t.string "uri"
    t.text "referrer"
    t.integer "user_agent_id"
    t.integer "visitor_code_id"
    t.integer "site_entrance_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "visitor_codes", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "md5code"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "vpn_ips", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "ip"
    t.integer "ip_int"
    t.boolean "available"
    t.integer "ripe_resource_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ripe_resource_id"], name: "index_vpn_ips_on_ripe_resource_id"
  end

  create_table "vpn_users", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vpn_ip_id"
    t.datetime "start_at", precision: nil
    t.datetime "end_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "active", default: true
    t.index ["active"], name: "index_vpn_users_on_active"
    t.index ["user_id"], name: "index_vpn_users_on_user_id"
    t.index ["vpn_ip_id"], name: "index_vpn_users_on_vpn_ip_id"
  end

  create_table "write_offs", id: :integer, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "number", null: false
    t.integer "agreement_id"
    t.date "dt"
    t.decimal "sum", precision: 10, scale: 2, default: "0.0"
    t.text "description", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["agreement_id"], name: "index_write_offs_on_agreement_id"
  end

  create_table "wrong_classified_objects", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.text "classification_data", size: :medium
    t.string "image_attachment_file_name"
    t.string "image_attachment_content_type"
    t.integer "image_attachment_file_size"
    t.datetime "image_attachment_updated_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end
