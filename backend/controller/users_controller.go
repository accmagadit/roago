package controller

import (
	"net/http"
	"roago/models"
	"strconv"

	"github.com/labstack/echo/v4"
)

func DataUsers(c echo.Context) error {
	result, err := models.DataUsers()

	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
	}

	return c.JSON(http.StatusOK, result)
}

func SaveController(c echo.Context) error {
	username := c.FormValue("username")
	password := c.FormValue("password")
	name := c.FormValue("name")
	gender := c.FormValue("gender")
	ageStr :=  c.FormValue("age")

	age, err := strconv.Atoi(ageStr)

	result,err := models.SaveUsers(username, password, name, gender, age)

	if err != nil{
		return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
	}

	return c.JSON(http.StatusOK, result)
}

func UpdateController(c echo.Context) error {
    username := c.FormValue("username")
    name := c.FormValue("name")
    gender := c.FormValue("gender")
    ageStr := c.FormValue("age")

    age, err := strconv.Atoi(ageStr)

    if err != nil {
        return c.JSON(http.StatusBadRequest, map[string]string{"message": "Invalid age value"})
    }

    result, err := models.UpdateUser(username, name, gender, age)

    if err != nil {
        return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
    }

    return c.JSON(result.Status, result)
}

func LoginController(c echo.Context) error {
    username := c.FormValue("username")
    password := c.FormValue("password")

    authenticated, err := models.AuthenticateUser(username, password)
    if err != nil {
        return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
    }

    if authenticated {
        // Autentikasi berhasil, Anda dapat mengarahkan ke halaman selanjutnya atau mengembalikan respons sukses.
        return c.JSON(http.StatusOK, map[string]string{"message": "Login berhasil"})
    } else {
        // Autentikasi gagal
        return c.JSON(http.StatusUnauthorized, map[string]string{"message": "Login gagal"})
    }
}