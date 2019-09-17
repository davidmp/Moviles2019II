package pe.edu.upeu.sysregatencionupeu.login

import android.content.Context
import android.database.Cursor
import android.util.Log
import pe.edu.upeu.sysregatencionupeu.comon.UsuarioDao
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
        fun onCredentialErrorPassw()
    }

    fun login(username:String, pasword:String,listener: OnLoginFineshedListener, context: Context){
        postDelayed(200){
            when{
                username.isEmpty()->listener.onUserError()
                pasword.isEmpty()->listener.onPasswordError()
                else->when(validateCredential(username,pasword,listener,context)){
                    1->listener.onSuccess()
                    2->listener.onCredentialErrorPassw()
                    0->listener.onCredentialError()
                }
            }
        }
    }

    fun validateCredential(username:String, pasword:String, listener: OnLoginFineshedListener, context: Context):Int{
        var dao=UsuarioDao(context)
        var curs:Cursor?=null
        var estado:Int=0
        curs=dao.loginData(username,pasword)
        dao=UsuarioDao(context)
        var cursx=dao.loginDataUser(username)
        if(curs!!.moveToFirst()){
            Log.v("ErrorX","Si existe")
            estado=1
        }else if(cursx!!.moveToFirst()){
            estado=2
            Log.v("ErrorX","Si existe usuario")
        }else{
            Log.v("ErrorX","No existe")
            estado=0
        }
        return estado
    }

}