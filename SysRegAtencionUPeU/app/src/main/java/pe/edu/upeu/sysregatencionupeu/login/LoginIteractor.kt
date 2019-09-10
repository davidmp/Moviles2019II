package pe.edu.upeu.sysregatencionupeu.login

import pe.edu.upeu.sysregatencionupeu.utils.postDelayed

/**
 * Created by Student on 10/09/2019.
 */
class LoginIteractor {
    interface OnLoginFineshedListener{
        fun onUserError()
        fun onPasswordError()
        fun onSuccess()
        fun onCredentialError()
    }

    fun login(username:String, pasword:String,listener: OnLoginFineshedListener){
        postDelayed(200){
            when{
                username.isEmpty()->listener.onUserError()
                pasword.isEmpty()->listener.onPasswordError()
                else->validateCredential(username,pasword,listener)
            }
        }
    }

    fun validateCredential(username:String, pasword:String, listener: OnLoginFineshedListener){
        listener.onSuccess()
    }

}