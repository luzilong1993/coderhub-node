const fileService = require('../service/file.service');
const userService = require('../service/user.service');
const { APP_HOST, APP_PORT } = require('../app/config');

class saveAvatarInfo {
    async saveAvatarInfo(ctx, next) {

        const { mimetype, filename, size } = ctx.req.file;
        const { id } = ctx.user;

        const result = await fileService.createAvatar(mimetype, filename, size, id);

        // 将图片地址保存到users表中
        const avatarUrl = `${APP_HOST}:${APP_PORT}/users/${id}/avatar`;

        await userService.updateAvatartUrlById(avatarUrl, id);
        ctx.body = "用户上传头像成功";
    }

    async savePictureInfo(ctx, next) {
        const files = ctx.req.files;
        const { momentId } = ctx.query;
        const { id } = ctx.user;

        for (let file of files) {
            const { mimetype, filename, size } = file;
            await fileService.createPicture(mimetype, filename, size, id, momentId)
        }


        ctx.body = "动态上传完成";
    }
}

module.exports = new saveAvatarInfo();