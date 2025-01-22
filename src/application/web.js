import express from "express"
import { errorMiddleware } from "../middleware/error-middleware"

export const web = express()

web.use(express.json())
web.use(errorMiddleware)