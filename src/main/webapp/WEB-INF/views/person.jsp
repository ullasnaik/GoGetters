<!DOCTYPE html>
<html data-ng-app="formSubmit">
<head>
<meta charset="ISO-8859-1">
<title>AngularJS Post Form Spring MVC example</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('formSubmit', []);
	
	app.controller('FormSubmitController',[ '$person', '$http', function($person, $http) {
			
		$person.list = [];
			$person.headerText = 'AngularJS Post Form Spring MVC example: Submit below form';
			$person.submit = function() {
				
				var formData = {
						"id" : $person.id,
						"name" : $person.name,
						"country" : $person.country	
				};
				
				var response = $http.post('PostFormData', formData);
				response.success(function(data, status, headers, config) {
					$person.list.push(data);
				});
				response.error(function(data, status, headers, config) {
					alert( "Exception details: " + JSON.stringify({data: data}));
				});
				
				//Empty list data after process
				$person.list = [];
				
			};
		}]);
</script>
</head>
<body>
	<form data-ng-submit="submit()" data-ng-controller="FormSubmitController">
		<h3>{{headerText}}</h3>
		<p>id: <input type="text" data-ng-model="id"></p>
		<p>name: <input type="text" data-ng-model="name"></p>
		<p>country: <input type="text" data-ng-model="country"></p>
		<input type="submit" id="submit" value="Submit" /><br>	
		
		<h4>You submitted below data through post:</h4>
		 <pre>Form data ={{list}}</pre>
	</form>
</body>
</html>