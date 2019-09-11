package pe.edu.upeu.sysregatencionupeu.comon

import android.content.Context
import pe.edu.upeu.dblibrary.AssetsSQLite


/**
 * Created by Software Student on 11/09/2019.
 */
class ConexionDB(context: Context) : AssetsSQLite(context, DATABASE_NAME){
companion object {
    const val DATABASE_NAME="dbxxx.db"
}
}