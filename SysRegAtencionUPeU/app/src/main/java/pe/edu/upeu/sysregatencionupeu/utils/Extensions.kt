package pe.edu.upeu.sysregatencionupeu.utils

import android.os.Handler


/**
 * Created by Student on 10/09/2019.
 */
fun postDelayed(delayMillis:Long, task:()->Unit){
    Handler().postDelayed(task,delayMillis)
}