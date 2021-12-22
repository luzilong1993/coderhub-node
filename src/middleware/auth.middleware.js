const jwt = require('jsonwebtoken');

const errorTypes = require('../constants/error-types');
const service = require('../service/user.service');
const md5Password = require('../utils/password-handle');
const { PUBLIC_KEY } = require('../app/config')

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

    ctx.user = user;

    await next();
}

const verifyAuth = async (ctx, next) => {
    console.log('验证授权的middleware~');

    const authorization = ctx.headers.authorization;
    if (!authorization) {
        const error = new Error(errorTypes.UNAUTHORIZATION);
        return ctx.app.emit('error', error, ctx)
    }

    const token = authorization.replace('Bearer ', '');

    try {
        const result = jwt.verify(token, PUBLIC_KEY, {
            algorithms: ['RS256']
        })
        console.log(result);
        ctx.user = result;
        await next();
    } catch (e) {
        const error = new Error(errorTypes.UNAUTHORIZATION);
        return ctx.app.emit('error', error, ctx)
    }


}

module.exports = {
    verifyLogin,
    verifyAuth
}