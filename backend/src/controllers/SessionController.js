//index, show, store, update, destroy
const User = require('../models/User');

module.exports = {

    //PEGA TODOS OS RESTAURANTES
    async index(req,res){
        const names = await User.find();
        return res.json(names);
    },

    //CRIA UM NOVO RESTAURANTE
    async store(req, res){
        const { name, email, password, CNPJ } = req.body;
        // email = req.body.email ou o de cima

        let user = await User.findOne({ CNPJ });

        if (!user){
            user = await User.create({name, email, password, CNPJ });
        }
        else{
            return res.status(400).json({ error: 'Usuário já existe!'});
        }

        return res.json(user);
    }
};