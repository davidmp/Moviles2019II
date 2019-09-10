package pe.edu.upeu.sysregatencionupeu.login

/**
 * Created by Student on 10/09/2019.
 */
class LoginPresenter(var loginView: LoginView,val loginIteractor: LoginIteractor):
        LoginIteractor.OnLoginFineshedListener {

    override fun onUserError(){loginView?.apply { setUsernameError()
                                                  hideProgresbar()}}
    override fun onPasswordError(){loginView?.apply { setPasswordError()
                                                    hideProgresbar()}}
    override fun onSuccess(){loginView?.apply{redirectHomeActivity()}}
    override fun onCredentialError(){loginView?.apply{validateCredential()}}
}