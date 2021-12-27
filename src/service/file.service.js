const connection = require('../app/database');

class FileService {
    async createAvatar(mimetype, filename, size, userId) {
        try {
            const statement = `INSERT INTO avatar (mimetype,filename,size,user_id) VALUES (?,?,?,?)`;
            const [result] = await connection.execute(statement, [mimetype, filename, size, userId]);
            return result;
        } catch (e) {
            console.log(e);
        }
    }

    async getAvatarByUserId(userId) {
        try {
            const statement = `SELECT * FROM avatar WHERE user_id = ?`;
            const [result] = await connection.execute(statement, [userId]);
            return result[0];
        } catch (e) {
            console.log(e);
        }
    }

    async createPicture(mimetype, filename, size, userId, momentId) {
        try {
            const statement = `INSERT INTO file (mimetype,filename,size,user_id,moment_id) VALUES (?,?,?,?,?)`;
            const [result] = await connection.execute(statement, [mimetype, filename, size, userId, momentId]);
            return result;
        } catch (e) {
            console.log(e);
        }
    }
    async getFileByFileName(filename) {
        try {
            const statement = `SELECT * FROM file WHERE filename = ?`;
            const [result] = await connection.execute(statement, [filename]);
            return result[0];
        } catch (e) {
            console.log(e);
        }
    }
}

module.exports = new FileService()