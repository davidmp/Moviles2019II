package pe.edu.upeu.calculadoraupeu

import android.os.Bundle
import android.os.PersistableBundle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText

/**
 * Created by Software Student on 21/08/2019.
 */
class MainKActivity :AppCompatActivity(),View.OnClickListener {
    internal var valorA = ""

    internal var operador = ' '
    lateinit var txtResultado:EditText
    internal var resultado:Float?=0f

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        txtResultado=findViewById(R.id.editText)
        val btnBorrar = findViewById<View>(R.id.button) as Button
        val btn1 = findViewById<View>(R.id.button18) as Button
        val btn2 = findViewById<View>(R.id.button19) as Button
        val btn3 = findViewById<View>(R.id.button20) as Button
        val btn4 = findViewById<View>(R.id.button14) as Button
        val btn5 = findViewById<View>(R.id.button15) as Button
        val btn6 = findViewById<View>(R.id.button16) as Button
        val btn7 = findViewById<View>(R.id.button2) as Button
        val btn8 = findViewById<View>(R.id.button3) as Button
        val btn9 = findViewById<View>(R.id.button4) as Button

        val btn0 = findViewById<View>(R.id.button22) as Button
        val btnPunto = findViewById<View>(R.id.button23) as Button
        val btnSuma = findViewById<View>(R.id.button25) as Button
        val btnResta = findViewById<View>(R.id.button21) as Button
        val btnDivision = findViewById<View>(R.id.button5) as Button

        val btnMultiplicacion = findViewById<View>(R.id.button17) as Button
        val btnIgual = findViewById<View>(R.id.button24) as Button
        txtResultado.setText("")
        btnBorrar!!.setOnClickListener(this)
        btn1!!.setOnClickListener(this)
        btn2!!.setOnClickListener(this)
        btn3!!.setOnClickListener(this)
        btn4!!.setOnClickListener(this)
        btn5!!.setOnClickListener(this)
        btn6!!.setOnClickListener(this)
        btn7!!.setOnClickListener(this)
        btn8!!.setOnClickListener(this)
        btn9!!.setOnClickListener(this)
        btn0!!.setOnClickListener(this)
        btnPunto!!.setOnClickListener(this)
        btnSuma!!.setOnClickListener(this)
        btnResta!!.setOnClickListener(this)
        btnDivision!!.setOnClickListener(this)
        btnMultiplicacion!!.setOnClickListener(this)
        btnIgual!!.setOnClickListener(this)

    }

    override fun onClick(v:View){
        when(v?.id){
            R.id.button18->{ txtResultado.setText(txtResultado.text.toString()+"1") }
            R.id.button19->{ txtResultado.setText(txtResultado.text.toString()+"2") }
            R.id.button20->{ txtResultado.setText(txtResultado.text.toString()+"3") }
            R.id.button14->{ txtResultado.setText(txtResultado.text.toString()+"4") }
            R.id.button15->{ txtResultado.setText(txtResultado.text.toString()+"5") }
            R.id.button16->{ txtResultado.setText(txtResultado.text.toString()+"6") }
            R.id.button2->{ txtResultado.setText(txtResultado.text.toString()+"7") }
            R.id.button3->{ txtResultado.setText(txtResultado.text.toString()+"8") }
            R.id.button4->{ txtResultado.setText(txtResultado.text.toString()+"9") }
            R.id.button22->{ txtResultado.setText(txtResultado.text.toString()+"0") }
            R.id.button->{
                if(txtResultado.text.toString().length<=1 ){
                txtResultado.setText("")
                valorA=""
                resultado=0f
                operador=' '}else{
                    val temp=txtResultado.text.toString().substring(0,txtResultado.text.toString().length-1)
                    txtResultado.setText(temp)
                }

            }
            R.id.button23->{ if(txtResultado.text.toString().contains(".")==true){
                    txtResultado.setText(txtResultado.text.toString()+"")
                    }else{
                    txtResultado.setText(txtResultado.text.toString()+".")
                }
            }
            R.id.button25->{
                valorA=txtResultado.text.toString()
                txtResultado.setText("")
                operador = '+'
            }
            R.id.button21->{
                valorA=txtResultado.text.toString()
                txtResultado.setText("")
                operador = '-'
            }
            R.id.button17->{
                valorA=txtResultado.text.toString()
                txtResultado.setText("")
                operador = '*'
            }
            R.id.button5->{
                valorA=txtResultado.text.toString()
                txtResultado.setText("")
                operador = '/'
            }
            R.id.button24->{
                when(operador){
                    '+'->{resultado=valorA?.toFloat()!!+txtResultado.text.toString().toFloat()}
                    '-'->{resultado=valorA?.toFloat()!!-txtResultado.text.toString().toFloat()}
                    '/'->{resultado=valorA?.toFloat()!!/txtResultado.text.toString().toFloat()}
                    '*'->resultado=valorA?.toFloat()!!*txtResultado.text.toString().toFloat()}
                }
                txtResultado.setText(resultado.toString())
            }
        }

        Log.v("VER", "Si Ingresa")
    }

}