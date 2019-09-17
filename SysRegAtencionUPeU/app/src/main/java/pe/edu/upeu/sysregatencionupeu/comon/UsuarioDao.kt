package pe.edu.upeu.sysregatencionupeu.comon

import android.content.Context
import android.database.Cursor
import android.database.sqlite.SQLiteDatabase

/**
 * Created by Student on 17/09/2019.
 */
class UsuarioDao (context:Context){

    private val sqLiteDatabase:SQLiteDatabase?

    init {
        val appSqlite=ConexionDB(context)
        sqLiteDatabase=appSqlite.writableDatabase
    }

    fun close(){
        sqLiteDatabase?.close()
    }

    fun loginData(usuario:String, clave:String):Cursor?{
        return sqLiteDatabase?.rawQuery("select * from usuario where usuario='"+usuario+"' and clave='"+clave+"'",
                null)
    }

    fun loginDataUser(usuario:String):Cursor?{
        return sqLiteDatabase?.rawQuery("select * from usuario where usuario='"+usuario+"'",null)
    }




}