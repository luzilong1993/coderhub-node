const jwt = require('jsonwebtoken');
const { PRIVATE_KEY } = require('../app/config')

class AuthController {
    async login(ctx, next) {

        console.log(ctx.user);
        const { id, name } = ctx.user;

        const token = jwt.sign({ id, name }, PRIVATE_KEY, {
            expiresIn: 60 * 60 * 24,
            algorithm: 'RS256'
        })
        ctx.body = {
            id,
            name,
            token
        }

        await next();
    }

    async success(ctx,next) {
        ctx.body = '用户授权成功',

        await next();
    }
}

module.exports = new AuthController();