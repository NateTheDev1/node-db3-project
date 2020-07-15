const db = require("../data/schemesconfig");

function find() {
  return db("schemes");
}

module.exports = {
  find,
};
