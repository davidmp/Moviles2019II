package pe.edu.upeu.sysregatencionupeu.login

import android.content.Context

/**
 * Created by Student on 10/09/2019.
 */
class LoginPresenter(var loginView: LoginView?,val loginIteractor: LoginIteractor):
        LoginIteractor.OnLoginFineshedListener {

    fun validateCredentials(username:String, password:String,context:Context){
        loginView?.showProgresbar()
        loginIteractor.login(username,password,this,context)
    }

    fun onDestroy(){
        loginView=null
    }
    override fun onUserError(){loginView?.apply { setUsernameError()
                                                  hideProgresbar()}}
    override fun onPasswordError(){loginView?.apply { setPasswordError()
                                                    hideProgresbar()}}
    override fun onSuccess(){loginView?.apply{redirectHomeActivity()}}
    override fun onCredentialError(){loginView?.apply{validateCredential()}}
    override fun onCredentialErrorPassw(){loginView?.apply{setValidateCredentialPassw()}}
}