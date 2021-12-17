const errorTypes = require('../constants/error-types');
const service = require('../service/user.service');

const md5Password = require('../utils/password-handle');

const verifyUser = async (ctx, next) => {
    // 1.先获取用户名和密码
    const { name, password } = ctx.request.body;

    // 2.判断不能为空
    if (!name || !password) {
        // 发射错误信息
        const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRE);
        return ctx.app.emit('error', error, ctx);
    }

    // 3.判断本次注册的用户名没有被注册过
    const result = await service.getUserByName(name);
    if (result.length) {
        const error = new Error(errorTypes.USER_ALREADY_EXISTS);
        return ctx.app.emit('error', error, ctx);
    }

    await next();
}

const handlePassword = async (ctx,next) => {
    const { password } = ctx.request.body;
    // 对密码进行加密
    ctx.request.body.password = md5Password(password);
    await next();
}

module.exports = {
    verifyUser,
    handlePassword
}