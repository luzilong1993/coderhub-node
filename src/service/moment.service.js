const connection = require('../app/database');

class MomentService {
    async create(userId, content) {
        const statement = `INSERT INTO moment (content,user_id) VALUES (?,?);`;
        const [result] = await connection.execute(statement, [content, userId]);
        return result;
    }

    async getMomentList(offset, size) {

        const statement = `
        SELECT
          m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
            JSON_OBJECT('id',u.id,'name',u.name) author,
            (SELECT COUNT(*) FROM comment c WHERE c.moment_id = m.id) commentCount
            FROM moment m
            LEFT JOIN users u ON m.user_id = u.id
            LIMIT ?, ?;`;
        const [result] = await connection.execute(statement, [offset, size]);
        return result;
    }

    async getMomentById(id) {
        const statement = `SELECT
        m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
        JSON_OBJECT('id',u.id,'name',u.name) author,
          JSON_ARRAYAGG(
           JSON_OBJECT('id',c.id,'content',c.content,'commentId',c.comment_id,'createTime',c.createAt,
              'user',JSON_OBJECT('id',cu.id,'name',cu.name))
          ) comments
        FROM moment m
        LEFT JOIN users u ON m.user_id = u.id
          LEFT JOIN comment c ON c.moment_id = m.id
          LEFT JOIN users cu ON c.user_id = cu.id
        WHERE m.id = ?;`;
        const [result] = await connection.execute(statement, [id]);
        return result[0];
    }

    async update(content, momentId) {
        const statement = `UPDATE moment SET content = ? WHERE id = ?;`;

        const [result] = await connection.execute(statement, [content, momentId]);

        return result;
    }

    async remove(momentId) {
        const statement = `DELETE FROM moment WHERE id = ?;`;
        const [result] = await connection.execute(statement, [momentId]);

        return result;
    }
}

module.exports = new MomentService();