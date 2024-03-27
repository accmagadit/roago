package models

import (
	"database/sql"
	"errors"
	"net/http"
	"roago/db"
)

type Users struct {
	Id       int    `json:id`
	Username string `json:username`
	Password string `json:password`
	Name     string `json:name`
	Age      int    `json:age`
	Gender   string `json:gender`
}

func DataUsers() (Response, error) {
	var obj Users
	var arrobj []Users
	var res Response

	con := db.CreateCon()

	sqlStatement := "SELECT * from users"

	rows , err := con.Query(sqlStatement)

	defer rows.Close()

	if err  != nil{
		return res, err
	}

	for rows.Next(){
		err = rows.Scan(
			&obj.Id, 
			&obj.Username,
			&obj.Password,
			&obj.Name,
			&obj.Age,
			&obj.Gender,
		)

		if err != nil{
			return res, err
		}

		arrobj = append(arrobj, obj)
	}

	res.Status = http.StatusOK
	res.Message = "sukses"
	res.Data = arrobj

	return res,nil
}

func SaveUsers(username string, password string, name string, gender string, age int)(Response, error){
	var res Response

	con := db.CreateCon()

	sqlStatement := "insert into users (username, password, name, age, gender) values (?,?,?,?,?)"
	//sqlStatement := "INSERT INTO users (username, password, name, age, gender) VALUES (?, ?, ?, ?, ?)"
	//result, err := con.Exec(sqlStatement, username, password, name, age, gender)

	stmt, err := con.Prepare(sqlStatement)

	if err != nil{
		return res, err
	}

	result, err := stmt.Exec(username, password, name, age, gender)

	if err != nil{
		return res, err
	}

	getIdLast, err := result.LastInsertId()

	res.Status = http.StatusAccepted
	res.Message = "Sukses"
	res.Data = map[string]int64{
		"getIdLast" : getIdLast,
	}

	return res,nil
}

func UpdateUser(username string, name string, gender string, age int)(Response, error){
	var res Response

	con := db.CreateCon()

	sqlStatement := "update users set name=?, age=?, gender=? where username=?"

	stmt, err := con.Prepare(sqlStatement)
	if err != nil{
		return res, err
	}

	result, err := stmt.Exec(name, age, gender, username)
	if err != nil{
		return res, err
	}

	rowsAffected, err := result.RowsAffected()
	if err != nil{
		return res, err
	}

	if rowsAffected == 0{
		return res, errors.New("user not found")
	}
	res.Status = http.StatusOK
	res.Message = "update successful"
	return res, nil

}

func AuthenticateUser(username string, password string) (bool, error) {
    con := db.CreateCon()

    // Query database untuk memeriksa apakah username dan password benar
    row := con.QueryRow("SELECT username FROM users WHERE username = ? AND password = ?", username, password)

    var foundUsername string
    if err := row.Scan(&foundUsername); err != nil {
        if err == sql.ErrNoRows {
            return false, errors.New("Username and password not found")
        }
        return false, err
    }

    return true, nil
}