const app = require('./app');

const { APP_PORT } = require('./app/config');

app.listen(APP_PORT, () => {
    console.log(`项目启动成功,端口为${APP_PORT}`);
})