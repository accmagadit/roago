package db

import (
	"database/sql"
	"roago/config"
	_"github.com/go-sql-driver/mysql"
)

var db *sql.DB
var err error

func Init(){
	config := config.GetConfig()

	connectionString := config.DB_USERNAME+":"+config.DB_PASSWORD+"@tcp("+config.DB_HOST+":"+config.DB_PORT+")/"+config.DB_NAME

	db, err = sql.Open("mysql",connectionString)

	if err != nil{
		panic("conection eror tuh")
	}

	err := db.Ping()

	if err !=nil{
		panic("dsn error")
	}
}

func CreateCon() *sql.DB {
	return db
}