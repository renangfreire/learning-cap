const cds = require('@sap/cds');

module.exports = function(){
    const { Products, Orders, Customers } = this.entities;

    this.on("logProducts", (req, res) => {
        const { productID } = req.data

        return `user searched is ${productID}`;
    })
    this.on("logProductAction", (req, res) => {
        const { productID } = req.data

        return `user searched is ${productID}`;
    })
}