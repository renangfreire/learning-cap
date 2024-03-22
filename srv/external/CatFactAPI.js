const cds = require("@sap/cds");

// BLOG USADO PARA FAZER ISSO
// https://community.sap.com/t5/technology-blogs-by-sap/consuming-a-rest-service-with-the-sap-cloud-application-programming-model/ba-p/13482126


class CatFactAPI extends cds.RemoteService{
    async init(){
        this.before("READ", "*", async (req, res) => {
            // req.query vem com um padrão, como a rota já está 100% correta ao apagar ela funciona! 
            req.query = ''
        })
        this.on("READ", "*", async (req, next) => {
            const response = await next(req);

            return {
                fact: response.fact,
                length: response.length
            }
        })

        super.init();
    }
}

module.exports = CatFactAPI;