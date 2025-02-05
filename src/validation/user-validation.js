import Joi from "joi"

const registerUserValidation = Joi.object({
    nim: Joi.string().min(9).max(9).required(),
    name: Joi.string().max(60).required(),
    email: Joi.string().email().required(),
    password: Joi.string().max(50).required()
})

const loginUserValidation = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().max(50).required()
})

export { registerUserValidation, loginUserValidation }