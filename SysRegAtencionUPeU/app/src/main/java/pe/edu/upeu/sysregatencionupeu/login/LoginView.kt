package pe.edu.upeu.sysregatencionupeu.login

/**
 * Created by Student on 10/09/2019.
 */
interface LoginView {
    fun showProgresbar()
    fun hideProgresbar()
    fun setUsernameError()
    fun setPasswordError()
    fun redirectHomeActivity()
    fun validateCredential()
}