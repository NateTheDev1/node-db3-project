const db = require("../data/schemesconfig");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("schemes as s")
    .select("s.scheme_name", "st.step_number", "st.instructions")
    .join("steps as st", "s.id", "=", "st.scheme_id")
    .where("st.scheme_id", "=", id)
    .orderBy("st.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then((id) => {
      return db.select("*").from("schemes").where({ id }).first();
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then((updated) => {
      return db("schemes").where({ id }).first();
    });
}

function remove(id) {
  return db("schemes").del().where({ id });
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};
