# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "BrowseNodes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "searchIndex", limit: 65535
    t.text    "BrowseNode",  limit: 65535
    t.text    "Description", limit: 65535
    t.boolean "active",                    default: true
  end

  create_table "COMMENT", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "asin",             limit: 10,    null: false
    t.datetime "registerDateTime"
    t.string   "content",          limit: 60
    t.text     "ipAddr",           limit: 65535
  end

  create_table "EXCLUSION", primary_key: "word", id: :string, limit: 50, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "active", default: true
  end

  create_table "FILTER_AUTHOR", primary_key: "AUTHOR", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "ACTIVE", default: true, null: false
  end

  create_table "FILTER_BROWSENODEID", primary_key: "BROWSENODEID", id: :string, limit: 20, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "DESCRIPTION", limit: 45
    t.boolean "ACTIVE",                 default: true, null: false
  end

  create_table "FILTER_LABEL", primary_key: "LABEL", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "ACTIVE", default: true, null: false
  end

  create_table "FILTER_PUBLISHER", primary_key: "PUBLISHER", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "ACTIVE", default: true, null: false
  end

  create_table "Kindle", primary_key: "asin", id: :string, limit: 10, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "author",          limit: 65535
    t.text    "binding",         limit: 65535
    t.text    "format",          limit: 65535
    t.boolean "isAdultProduct"
    t.text    "label",           limit: 65535
    t.text    "manufacturer",    limit: 65535
    t.text    "productGroup",    limit: 65535
    t.text    "productTypeName", limit: 65535
    t.string  "publicationDate", limit: 10
    t.text    "publisher",       limit: 65535
    t.string  "releaseDate",     limit: 10
    t.string  "title",           limit: 200
    t.text    "content",         limit: 65535
    t.text    "detailPageURL",   limit: 65535
    t.text    "largeImage",      limit: 65535
    t.text    "mediumImage",     limit: 65535
    t.index ["asin"], name: "asin", unique: true, using: :btree
    t.index ["releaseDate", "title"], name: "title", using: :btree
    t.index ["releaseDate"], name: "releaseDate", using: :btree
  end

  create_table "KindleDelete", primary_key: "asin", id: :string, limit: 10, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 200
  end

  create_table "KindleMyInfo", primary_key: "asin", id: :string, limit: 10, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "tileTitle",     limit: 200
    t.string  "simpleTitle",   limit: 200
    t.boolean "isBulkBuying"
    t.boolean "isLimitedFree"
    t.string  "Label",         limit: 200
    t.boolean "isNovel"
    t.boolean "isMagazine"
    t.boolean "isAdult"
    t.index ["asin"], name: "asin_UNIQUE", unique: true, using: :btree
    t.index ["isLimitedFree"], name: "isLimitedFree", using: :btree
  end

  create_table "KindleRegist", primary_key: "asin", id: :string, limit: 10, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "insertTime"
    t.datetime "updateTime"
    t.boolean  "tweetFlg",   default: false
    t.boolean  "tweetFlg2",  default: false
    t.datetime "deleteTime"
    t.index ["asin"], name: "asin", unique: true, using: :btree
    t.index ["deleteTime"], name: "deleteTime", using: :btree
    t.index ["insertTime"], name: "insertTime", using: :btree
  end

  create_table "NOIMAGE", primary_key: "asin", id: :string, limit: 10, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.index ["asin"], name: "asin", unique: true, using: :btree
  end

  create_table "PowerPubdates", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "searchIndex",  limit: 65535
    t.text    "powerPubdate", limit: 65535
    t.boolean "active",                     default: true
  end

  create_table "RequestLog", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "dateTime"
    t.text     "request",  limit: 65535
  end

  create_table "SCHEDULER", primary_key: "jobName", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "jobClass",    limit: 65535
    t.text    "jobSchedule", limit: 65535
    t.boolean "active",                    default: true
    t.index ["jobName"], name: "jobName", unique: true, using: :btree
  end

  create_table "SortValues", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "searchIndex", limit: 65535
    t.text    "sortValue",   limit: 65535
    t.boolean "active",                    default: true
  end

  create_table "TWEETTOP3", primary_key: "description", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "url",        limit: 65535
    t.integer "tweetCount",               default: 0
    t.index ["description"], name: "description", unique: true, using: :btree
  end

  create_table "tag", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 50, null: false
    t.index ["name"], name: "namde_UNIQUE", unique: true, using: :btree
  end

  create_table "tagmap", primary_key: ["asin", "tag_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "asin",   limit: 10, null: false
    t.integer "tag_id",            null: false
    t.index ["tag_id"], name: "tag_id", using: :btree
  end

end
