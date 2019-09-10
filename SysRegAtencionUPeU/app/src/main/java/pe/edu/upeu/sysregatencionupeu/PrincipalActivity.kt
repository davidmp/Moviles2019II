package pe.edu.upeu.sysregatencionupeu

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageButton
import pe.edu.upeu.sysregatencionupeu.login.LoginActivity

class PrincipalActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_principal)

        val ImgBtn01:ImageButton=findViewById<ImageButton>(R.id.imageButton)
        val ImgBtn02:ImageButton=findViewById<ImageButton>(R.id.imageButton)
        val ImgBtn03:ImageButton=findViewById<ImageButton>(R.id.imageButton)

        ImgBtn01.setOnClickListener{
            v ->  intent= Intent(this,MainActivity::class.java)
            startActivity(intent)
        }
        
        ImgBtn02.setOnClickListener{view -> intent= Intent(this, LoginActivity::class.java)
        startActivity(intent)
        }


    }
}
