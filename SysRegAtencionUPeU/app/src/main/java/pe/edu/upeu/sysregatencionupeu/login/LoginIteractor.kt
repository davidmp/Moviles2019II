package pe.edu.upeu.sysregatencionupeu.login

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
}