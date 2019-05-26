# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_526_183_709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'ip_addresses', force: :cascade do |t|
    t.string 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'posts', id: :serial, force: :cascade do |t|
    t.string 'title', null: false
    t.text 'body', null: false
    t.integer 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'ip_address_id'
    t.index ['author_id'], name: 'index_posts_on_author_id'
    t.index ['ip_address_id'], name: 'index_posts_on_ip_address_id'
  end

  create_table 'ratings', id: :serial, force: :cascade do |t|
    t.integer 'value', null: false
    t.integer 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_ratings_on_post_id'
  end

  create_table 'users', id: :serial, force: :cascade do |t|
    t.string 'login', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'posts', 'users', column: 'author_id'
  add_foreign_key 'ratings', 'posts'

  create_view 'top_rating_posts', materialized: true, sql_definition: <<-SQL
      SELECT posts.id AS post_id,
      avg(ratings.value) AS average_rating,
      posts.title,
      posts.body
     FROM (posts
       JOIN ratings ON ((posts.id = ratings.post_id)))
    GROUP BY posts.id
    ORDER BY (avg(ratings.value)) DESC;
  SQL
  add_index 'top_rating_posts', ['average_rating'], name: 'index_top_rating_posts_on_average_rating'
  add_index 'top_rating_posts', ['post_id'], name: 'index_top_rating_posts_on_post_id', unique: true

  create_view 'not_unique_ip_addresses', materialized: true, sql_definition: <<-SQL
      SELECT ip_addresses.id,
      ip_addresses.value AS ip_address,
      array_agg(DISTINCT users.login) AS array_of_authors
     FROM ((posts
       JOIN ip_addresses ON ((ip_addresses.id = posts.ip_address_id)))
       JOIN users ON ((users.id = posts.author_id)))
    GROUP BY ip_addresses.id
   HAVING (count(DISTINCT posts.author_id) > 1);
  SQL
  add_index 'not_unique_ip_addresses', ['id'], name: 'index_not_unique_ip_addresses_on_id', unique: true
end
