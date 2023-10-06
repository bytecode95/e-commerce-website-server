const multer = require('multer');
const path = require('path')


//  Upload Image Controller

const imgconfig = multer.diskStorage({
    destination: (req, file, callback) => {
        callback(null,'uploads')
    },
    filename: (req, file, callback) => {
        callback(null, `image-${Date.now()}.${file.originalname}`)
    }
})

//imge filter
const upload = multer({
    storage:imgconfig,
    limits: { fileSize: '1000000' },
    fileFilter:(req, file, callback)=>{
        const fileTypes = /jpeg|jpg|png|gif/
        const mimeType = fileTypes.test(file.mimetype)  
        const extname = fileTypes.test(path.extname(file.originalname))
        if(mimeType && extname) {
            return callback(null, true)
        }
        callback('Give proper files formate to upload')
    
    }
}).single('image')


module.exports = {upload}