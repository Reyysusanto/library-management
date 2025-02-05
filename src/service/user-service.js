import { request } from "http";
import { prismaClient } from "../application/database.js"
import { ResponseError } from "../error/response-error.js"
import { registerUserValidation } from "../validation/user-validation.js"
import bcrypt from "bcrypt";

const register = async (request) => {
    const user = validate(registerUserValidation, request)

    const countUser = await prismaClient.mahasiswa.count({
        where: {
            nim: user.nim
        }
    })
    
    if(countUser !== 1) {
        throw new ResponseError(400, "Akun sudah terdaftar")
    }

    user.password = await bcrypt.hash(user.password, 10)

    return prismaClient.mahasiswa.create({
        data: user,
        select: {
            nim: true,
            nama: true
        }
    })
}

const login = async (request) => {
    const user = validate(loginUserValidation, request)

    const userData = await prismaClient.mahasiswa.findUnique({
        where: {
            email: user.email
        }
    })

    if(!userData) {
        throw new ResponseError(400, "Email atau password salah")
    }

    const isPasswordMatch = await bcrypt.compare(user.password, userData.password)

    if(!isPasswordMatch) {
        throw new ResponseError(400, "Email atau password salah")
    }

    return {
        nim: userData.nim,
        nama: userData.nama
    }
}

export default { register, login }