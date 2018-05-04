class loginComponent{
    constructor(){
        this.user = 0;
        this.pwd = 0;
    }
    inscriptionTemplate(){
        $("#centralApp").load("src/login/inscription.html");
    }
    connexionTemplate(){
        $("#centralApp").load("src/login/connexion.html");
    }
    checkLogin(id){
        if($('#'+id+'').val()!=""){
            if(id=="login_user"){
                this.user=1;
            }else if(id=="login_pwd"){
                this.pwd=1;
            }
        }else{
            if(id=="login_user"){
                this.user=0;
            }else if(id=="login_pwd"){
                this.pwd=0;
            }
        }
        if(this.user==1 && this.pwd==1){
            $('#btn_login').removeClass("disabled");
            if($('#share')){
                $('#btn_login').attr('onClick', 'loginComponent.inscription()');
            }else{
                $('#btn_login').attr('onClick', 'loginComponent.connexion()');
            }
        }
        if(this.user==0 || this.pwd==0){
            $('#btn_login').addClass("disabled");
            $('#btn_login').removeAttr('onclick');
        }
    }
    inscription(){
        var us = $('#login_user').val();
        var pw = $('#login_pwd').val();
        var sh = $('#login_share').val();
        //loginService.inscription(us, pw, sh);
        var usId = db.addUser(us, pw, sh);
        stor.setItem("user",JSON.stringify([usId,us,pw]));
        this.connect(us,pw);
    }
    connexion(){
        var us = $("#login_user").val();
        var pw = $("#login_pwd").val();
        this.connect(us,pw);
    }
    connect(user,pwd){
        var userId = db.checkUser(user, pwd);
        if(userId != false){
            toggleDisplay("navbar-menu");
            stor.setItem("user",JSON.stringify([userId,user,pwd]));
            mediatekComponent.template();
        }
    }
    retrieveUser(){
        if(stor.getItem("user")){
            var userData = stor.getItem("user");
            this.connect(userData[1], userData[2])
        }else{
            this.connexionTemplate();
        }
    }
    disconnexion(){
        stor.removeItem("user");
        return true;
    }
}