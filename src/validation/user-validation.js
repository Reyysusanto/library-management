import Joi from "joi"

const registerUserValidation = Joi.object({
    nim: Joi.string().min(9).max(9).required(),
    password: Joi.string().max(50).required(),
    name: Joi.string().max(60).required()
})

export { registerUserValidation }