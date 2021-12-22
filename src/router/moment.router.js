const Router = require('koa-router');

const momentRouter = new Router({ prefix: '/moment' });

const {
    create,
    list,
    detail,
    update
} = require('../controller/moment.controller')

const {
    verifyAuth,
    verifyPermission
} = require('../middleware/auth.middleware');

momentRouter.post('/', verifyAuth, create);

momentRouter.get('/', list);

momentRouter.get('/:momentId', detail);

momentRouter.patch('/:momentId', verifyAuth, verifyPermission, update)

module.exports = momentRouter;