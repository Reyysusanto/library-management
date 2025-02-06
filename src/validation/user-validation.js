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

const getUserValidation = Joi.string().max(100).required()

const updateUserValidation = Joi.object({
    nim: Joi.string().min(9).max(9).required(),
    password: Joi.string().max(100).optional(),
    name: Joi.string().max(50).optional(),
    email: Joi.string().email().required(),
})

export { registerUserValidation, loginUserValidation, getUserValidation, updateUserValidation }