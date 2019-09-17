package pe.edu.upeu.sysregatencionupeu.login

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import pe.edu.upeu.sysregatencionupeu.R
import kotlinx.android.synthetic.main.activity_login.*
import kotlinx.android.synthetic.main.nav_header_main.*
import pe.edu.upeu.sysregatencionupeu.MainActivity

class LoginActivity : AppCompatActivity(),LoginView {

    private val presenter= LoginPresenter(this, LoginIteractor())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
        btnLogin.setOnClickListener { validateCredentials() }
    }

    fun validateCredentials(){
        presenter.validateCredentials(username.text.toString(),password.text.toString(),this)
        txtMsg.visibility=View.GONE
    }

    override fun onDestroy() {
        presenter.onDestroy()
        super.onDestroy()
    }

    override fun showProgresbar(){ progress.visibility=View.VISIBLE}
    override fun hideProgresbar(){progress.visibility=View.GONE}
    override fun setUsernameError(){username.error="El campo usuario esta vacio"}
    override fun setPasswordError(){password.error="El campo password esta vacio"}
    override fun redirectHomeActivity(){startActivity(Intent(this,MainActivity::class.java))}
    override fun validateCredential(){
        txtMsg.text="Los credenciales no son validos... intenete nuevamente!"
        txtMsg.visibility=View.VISIBLE
        hideProgresbar()
    }
    override fun setValidateCredentialPassw(){
        txtMsg.text="Password Incorrecto ... intente nuevamente!"
        txtMsg.visibility=View.VISIBLE
        hideProgresbar()
    }
}
