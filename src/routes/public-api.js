import express from "express"

const publicRouter = new express.Router()
publicRouter.post('/api/users/register', userController.register)
publicRouter.post('/api/users/login', userController.login)

export { publicRouter }