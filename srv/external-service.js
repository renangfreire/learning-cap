const cds = require("@sap/cds");

module.exports = function(){
    const { catFact } = this.entities;

    this.on("READ", catFact, async (req) => {
        const catFactApi = await cds.connect.to("CatFactAPI");
        return catFactApi.tx(req).run(req.query)
    })
}