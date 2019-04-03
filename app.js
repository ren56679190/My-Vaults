// const path = require('path');
const express = require('express');
const template = require('express-art-template');
const artTemplate = require('art-template');
const bodyParser = require('body-parser');
const db = require(__dirname + '/db');
const session = require('express-session')
const moment = require('moment');
const app = express();
// ---------------------------------------------------------------------
app.use(session({
    secret: '4ey32erfyf3fgpg',
    resave: false,
    saveUninitialized: false
}));
// app.get('/sets',(req,res)=>{
//     req.session.isLogin = true;
//     req.session.userInfo = { user_id: 10001, user_name: "zs" };
//     res.send('ok');
//     console.log(req.session)
// });
// ---------------------------------------------------------------------
app.engine('html', template);
//处理静态资源
app.use('/assets/', express.static(__dirname + '/assets'));
//格式化时间第二种方式,注册过滤器
artTemplate.defaults.imports.mytime = function (value) {
    return moment(value).format('YYYY-MM-DD HH:mm:ss')
}
// 监视请求
app.get('/message.html', (req, res) => {
    let flag = req.session.isLogin ? true : false;
    let fileName = __dirname + '/message.html';
    // res.sendFile(fileName);
    //判断用户是否登录
    res.render(fileName,{
        isLogin : flag
    });
});
app.get('/getMsg', (req, res) => {
    let fileName = __dirname + '/li.html';
    db.msql('select * from msg', null, (err, result) => {
        // console.log(result)
        if (err) throw err;
        // 格式化时间第一种方式
        // for(var i in result){
        //     result[i].m_time = moment(result[i].m_time).format('YYYY-MM-DD HH:mm:ss')
        // }
        res.render(fileName, {
            arr: result
        });
    });
});

app.use(bodyParser.urlencoded({extended : false}));
// 监视login
app.post('/login',(req,res)=>{
    let user = req.body.u_name;
    let pwd = req.body.u_pwd;
    // console.log(req.body)
    // console.log(user,pwd)
    let sql = 'select * from user where u_name=? and u_pwd=?'
    db.msql(sql,[user,pwd],(err,result)=>{
        if(err) throw err;
        req.session.isLogin = true;
        req.session.userInfo = result[0];
        // console.log(result.length + '')
        res.send(result.length + '')
    });
});

// 监视/addMsg
app.post('/addMsg',(req,res) => {
    req.body.m_name = req.session.userInfo.u_name;
    // console.log(req.body.m_name)
    // -----------------------------------
    //获取时间
    // var myDate = new Date();
    // req.body.m_time = myDate.toLocaleString(); //获取日期与时间
    // console.log(myDate);
    // console.log(year + '' + month + '' + day + '' + hour + '' + minute + '' + second);
    // -----------------------------------
    // req.body.m_time = '2019.3.31 13:00:00';
    req.body.m_time = moment().format('YYYY-MM-DD HH:mm:ss'); //获取日期与时间
    let sql = 'insert into msg set ?';
    db.msql(sql,req.body,(err,result) => {
        if(err) throw err;
        // console.log(result)
        // console.log(req.body)
        res.send(req.body)
    })
});
// 监视/addUser
app.post('/addUser',(req,res) => {
    let user1 = req.body.u_name1;
    let pwd1 = req.body.u_pwd1;
    // console.log(user1,pwd1)
    let sql = 'insert into user set u_name = ? , u_pwd = ?';
    db.msql(sql,[user1,pwd1],(err,result) => {
        if(err) throw err;
        // console.log(result);
        res.send(result.affectedRows + '')
        // res.send('111')
    });
    // console.log(111)
});
// 监视退出按钮
app.post('/quitUser',(req,res)=> {
    req.session.isLogin = false;
    res.send('退出成功');
    // console.log(req.session.isLogin)
})
app.listen(3000, console.log('3000端口开启成功'));