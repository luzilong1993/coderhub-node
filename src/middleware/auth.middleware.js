const errorTypes = require('../constants/error-types');
const service = require('../service/user.service');
const md5Password = require('../utils/password-handle');

const verifyLogin = async (ctx, next) => {

    // 1.先获取用户名和密码
    const { name, password } = ctx.request.body;

    // 2.判断不能为空
    if (!name || !password) {
        // 传递错误信息
        const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRE);
        return ctx.app.emit('error', error, ctx);
    }

    // 判断用户是否存在
    const result = await service.getUserByName(name);
    const user = result[0];
    if (!user) {
        const error = new Error(errorTypes.USER_DOES_NOT_EXISTS);
        return ctx.app.emit('error', error, ctx);
    }

    // 判断密码是否和数据库中一致
    if (md5Password(password) !== user.password) {
        const error = new Error(errorTypes.PASSWORD_IS_INCORRENT);
        return ctx.app.emit('error', error, ctx);
    }

    await next();
}

module.exports = {
    verifyLogin
}