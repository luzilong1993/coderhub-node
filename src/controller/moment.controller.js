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

    async update(ctx, next) {
        const { momentId } = ctx.params;
        const { content } = ctx.request.body;

        const result = await momentService.update(content, momentId);

        ctx.body = result;
    }

    async remove(ctx, next) {
        const { momentId } = ctx.params;
        const result = await momentService.remove(momentId);

        ctx.body = result;
    }

    async addLabels(ctx, next) {
        // 获取动态标签和ID
        const { labels } = ctx;
        const { momentId } = ctx.params;

        // 2.添加所有的标签
        for (let label of labels) {
            // 判断标签是否和动态已经有关系了
            const isExists = await momentService.hasLabel(momentId, label.id);

            if (!isExists) {
                await momentService.addLabel(momentId, label.id)
            }
        }

        console.log(labels);
        ctx.body = '添加标签';
    }
}

module.exports = new MomentController();