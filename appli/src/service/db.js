class dbService{
    //connexion to database

    //###############################
    // USER
    //###############################
    getUser(id){
        //postDB("user/Get", { "use_id" : id });
        return { "name" : "steven", "img" : '', "share" : false };
    }
    addUser(user,pwd,share){
        //return postDB("user/Add", { "prm_name" : user, "prm_pwd" : pwd, "prm_share" : share });
        return 1;
    }
    removeUser(){
        return postDB("user/Remove", { "use_id" : id });
    }
    checkUser(user,pwd){
        //return postDB("user/Check", { "prm_user" : user, "prm_pwd" : pwd });
        if(user=="steven" && pwd=="steven"){
            return 1;
        }else{
            return false;
        }
    }
    setUserImg(id,img){
        return postDB("user/SetImg", { "use_id" : id, "prm_img" : img });
    }
    setUserName(id, name){
        return postDB("user/SetName", { "use_id" : id, "prm_name" : name });
    }
    setUserPwd(id,new_pwd,old_pwd){
        return postDB("user/SetUserPwd", { "use_id" : id, "prm_old" : old_pwd, "prm_new" : new_pwd });
    }
}