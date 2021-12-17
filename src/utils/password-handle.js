const crypto = require('crypto');  //node自带加密库

const md5Password = (password) => {
    const md5 = crypto.createHash('md5');
    const result = md5.update(password + '').digest('hex');
    return result;
}

module.exports = md5Password;
