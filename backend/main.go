package main

import (
	"roago/db"
	"roago/routes"
)

func main(){
	
	db.Init()

	e:=routes.Init()

	e.Logger.Fatal(e.Start(":1234"))
}