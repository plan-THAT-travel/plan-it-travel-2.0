const path = require('path');
const pool = require(path.join(__dirname, './../db/postgresModel'));
const loginController = {};


loginController.createUser = async (req, res, next) => {
    try {
        // Deconstruct username and password
        const { firstName, lastName, username, password } = req.body;
        // Check if either username or password fields are empty, if so throw an error 
        if (username === '' || password === '') {
            return next({
                log: 'userController.createUser: Missing username or password',
                status: 400,
                message: { err: 'Mandatory field is missing' }
            });
        };
        // Create a new user in our database
        const createUserQuery = 'INSERT INTO users (firstname, lastname, username, password) VALUES (firstName, lastName, username, password);'

        const poolResponse = await pool.query(createUserQuery);

        res.locals.newUser = poolResponse;

        next();
    }
    catch(err) {
        console.log(err);
        next(err);
    };
};


loginController.getUser = (req, res, next) => {

    next();
};



module.exports = loginController;