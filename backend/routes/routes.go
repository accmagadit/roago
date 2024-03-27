package routes

import (
	"net/http"
	"roago/controller"

	"github.com/labstack/echo/v4"
)

func Init() *echo.Echo {
	e := echo.New()

	e.GET("/",func(c echo.Context) error {
		return c.String(http.StatusOK, "Selamat Datang")
	})

	e.GET("/users",controller.DataUsers)
	e.POST("/users", controller.SaveController)
	e.PUT("/users", controller.UpdateController)
	e.POST("/login", controller.LoginController)
	return e
}