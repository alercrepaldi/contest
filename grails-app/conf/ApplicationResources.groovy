modules = {
    application {
        resource url:'js/application.js'
    }
	
	bootstrap {
		resource url:'bootstrap/css/bootstrap.css'
		resource url:'boostrap/img/glyphicons-halflings.png'
		resource url:'boostrap/img/glyphicons-halflings-white.png'
		resource url:'bootstrap.js'
	}

    bootstrapDatepicker {
        resource url:'js/bootstrap-datepicker.js'
    }
	
	/*'bootstrap' {
		resource url:'less/bootstrap.less',attrs:[rel: "stylesheet/less", type:'css'], bundle:'bundle_bootstrap'
	}*/
	
	'less-compiler' {
		resource url:'js/less-1.3.3.min.js'
	} 
}