const connection = require('../app/database');

class LabelService {

    async create(name) {
        try {
            const statement = `INSERT INTO label (name) VALUES (?);`;
            const [result] = await connection.execute(statement, [name]);
            return result;
        } catch (e) {
            console.log(e);
        }
    }

    async getLabelByName(name) {
        try {
            const statement = `SELECT * FROM label WHERE name = ?;`;
            const [result] = await connection.execute(statement, [name]);
            return result[0];
        } catch (e) {
            console.log(e);
        }
    }

    async getLabels(limit, offset) {
        try {
            const statement = `SELECT * FROM label LIMIT ? ,?;`;
            const [result] = await connection.execute(statement, [offset, limit]);
            return result;
        } catch (e) {
            console.log(e);
        }
    }

}

module.exports = new LabelService();