const momentService = require('../service/moment.service');

class MomentController {
    async create(ctx, next) {
        const userId = ctx.user.id;
        const content = ctx.request.body.content;


        const result = momentService.create(userId, content);
        ctx.body = result;
    }

    async list(ctx, next) {
        const { offset, size } = ctx.query;

        const result = await momentService.getMomentList(offset, size)

        ctx.body = result;
    }

    async detail(ctx, next) {

        const momentId = ctx.params.momentId;

        const result = await momentService.getMomentById(momentId)

        ctx.body = result;

    }
}

module.exports = new MomentController();