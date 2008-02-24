private var context = {
	start : "sign-up",
	
	"sign-up" : {
		ref : "signUp",
		forwards : {
			sucess  : "sign-up-success",
			failure : "sign-up-failure"
		}
	},
	
	"sign-up-success" : {
		chain : ["addToDB", "clean", "render"]
	},
	
	"sign-up-failure" : {
		ref : "failure"
	}
};