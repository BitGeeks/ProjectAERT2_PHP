const HttpsProxyAgent = require('https-proxy-agent');

const proxyConfig = [
  {
    context: '/maxminesapi',
    pathRewrite: { '^/maxminesapi': '' },
    target: 'https://maxmines.com',
    changeOrigin: true,
    secure: false
  }
];

function setupForCorporateProxy(proxyConfig) {
  if (!Array.isArray(proxyConfig)) {
    proxyConfig = [proxyConfig];
  }

  const proxyServer = process.env.http_proxy || process.env.HTTP_PROXY;
  let agent = null;

  if (proxyServer) {
    console.log(`Đang sử dụng proxy: ${proxyServer}`);
    agent = new HttpsProxyAgent(proxyServer);
    proxyConfig.forEach(entry => { entry.agent = agent; });
  }

  return proxyConfig;
}

module.exports = setupForCorporateProxy(proxyConfig);