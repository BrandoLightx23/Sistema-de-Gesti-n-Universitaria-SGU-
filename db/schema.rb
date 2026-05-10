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

ActiveRecord::Schema[8.1].define(version: 2026_05_10_002748) do
  create_table "administrativos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["usuario_id"], name: "index_administrativos_on_usuario_id"
  end

  create_table "calificaciones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "docente_id", null: false
    t.bigint "estudiante_id", null: false
    t.bigint "materia_id", null: false
    t.datetime "updated_at", null: false
    t.decimal "valor_nota", precision: 10
    t.index ["docente_id"], name: "index_calificaciones_on_docente_id"
    t.index ["estudiante_id"], name: "index_calificaciones_on_estudiante_id"
    t.index ["materia_id"], name: "index_calificaciones_on_materia_id"
  end

  create_table "docentes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "departamento"
    t.string "numero_empleado"
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["numero_empleado"], name: "index_docentes_on_numero_empleado", unique: true
    t.index ["usuario_id"], name: "index_docentes_on_usuario_id"
  end

  create_table "estudiantes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "matricula"
    t.integer "semestre_actual"
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["matricula"], name: "index_estudiantes_on_matricula", unique: true
    t.index ["usuario_id"], name: "index_estudiantes_on_usuario_id"
  end

  create_table "imparticiones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "docente_id", null: false
    t.bigint "materia_id", null: false
    t.string "nrc_grupo"
    t.string "periodo"
    t.datetime "updated_at", null: false
    t.index ["docente_id"], name: "index_imparticiones_on_docente_id"
    t.index ["materia_id"], name: "index_imparticiones_on_materia_id"
  end

  create_table "inscripciones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "calificacion"
    t.datetime "created_at", null: false
    t.bigint "estudiante_id", null: false
    t.bigint "materia_id", null: false
    t.string "periodo"
    t.datetime "updated_at", null: false
    t.index ["estudiante_id"], name: "index_inscripciones_on_estudiante_id"
    t.index ["materia_id"], name: "index_inscripciones_on_materia_id"
  end

  create_table "materias", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "administrativo_id", null: false
    t.datetime "created_at", null: false
    t.integer "creditos"
    t.string "nombre_materia"
    t.datetime "updated_at", null: false
    t.index ["administrativo_id"], name: "index_materias_on_administrativo_id"
  end

  create_table "usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "correo"
    t.datetime "created_at", null: false
    t.string "nombre"
    t.string "password_digest"
    t.string "tipo_usuario"
    t.datetime "updated_at", null: false
    t.index ["correo"], name: "index_usuarios_on_correo", unique: true
  end

  add_foreign_key "administrativos", "usuarios"
  add_foreign_key "calificaciones", "docentes"
  add_foreign_key "calificaciones", "estudiantes"
  add_foreign_key "calificaciones", "materias"
  add_foreign_key "docentes", "usuarios"
  add_foreign_key "estudiantes", "usuarios"
  add_foreign_key "imparticiones", "docentes"
  add_foreign_key "imparticiones", "materias"
  add_foreign_key "inscripciones", "estudiantes"
  add_foreign_key "inscripciones", "materias"
  add_foreign_key "materias", "administrativos"
end
