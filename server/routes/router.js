const express = require('express')
const router = express.Router()

const login = require('../controller/login')
const register = require('../controller/register')
const locations = require('../controller/locations')
const getUserTags = require('../controller/getUserTags')
const getAllTags = require('../controller/getAllTags')
const getUserPrefs = require('../controller/getUserPrefs')
const postDetails = require('../controller/postDetails')
const getConversationList = require('../controller/getConversationList')
const createPost = require('../controller/createPost')
const viewPost = require('../controller/viewPost')

router.post('/newpost', createPost)
router.post('/login', login)
router.post('/register', register)
router.get('/viewpost', viewPost)
router.get('/get-all-locations', locations)
router.get('/get-user-tags', getUserTags)
// router.get('/get-all-tags', getAllTags)
router.get('/get-user-prefs', getUserPrefs)
router.get('/get-post-details', postDetails)
router.get('/get-convo', getConversationList)

module.exports = router