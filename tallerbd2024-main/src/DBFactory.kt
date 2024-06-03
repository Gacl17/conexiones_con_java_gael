import properties.PropertiesUtil

class DBFactory {
    fun getDBAdapter(dbType: DBType): IDBAdapter {
        return if (dbType == DBType.MySql) {
            MySqlDBAdapter()
        } else if (dbType == DBType.Oracle) {
            OracleDBAdapter()
        } else {
            throw IllegalArgumentException("No soportado")
        }
    }

    val defaultDBAdapter: IDBAdapter?
        get() {
            try {
                val property = PropertiesUtil.loadProperty(_DB_FACTORY_PROPERTY_URL)
                val defaultDBClass = property.getProperty(_DEFAULT_DB_CLASS_PROP)
                return Class.forName(defaultDBClass).getConstructor().newInstance() as IDBAdapter
            } catch (e: Exception) {
                e.printStackTrace()
                return null
            }
        }


    companion object {
        private const val _DB_FACTORY_PROPERTY_URL = "properties/DBFactory"
        private const val _DEFAULT_DB_CLASS_PROP = "defaultDBClass"
    }
}


