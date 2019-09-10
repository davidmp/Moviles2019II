package pe.edu.upeu.sysregatencionupeu.login

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import pe.edu.upeu.sysregatencionupeu.R
import kotlinx.android.synthetic.main.activity_login.*
import pe.edu.upeu.sysregatencionupeu.MainActivity

class LoginActivity : AppCompatActivity(),LoginView {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
    }



    override fun showProgresbar(){ progress.visibility=View.VISIBLE}
    override fun hideProgresbar(){progress.visibility=View.GONE}
    override fun setUsernameError(){username.error="El campo usuario esta vacio"}
    override fun setPasswordError(){password.error="El campo password esta vacio"}
    override fun redirectHomeActivity(){startActivity(Intent(this,MainActivity::class.java))}
    override fun validateCredential(){txtMsg.text="Los credenciales no son validos... intenete nuevamente!"
    txtMsg.visibility=View.VISIBLE
    }
}
