# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form", (ev,data)-> #nos imprime en consola que sucede
	console.log data
	$(this).find("textarea").val("") #este script reinicia el textarea de comentarios
	$("#comments-box").append("<li> #{data.body} - #{data.user.email} </li>") #este scipt carga los comentarios dentro del id commentsbox
$(document).on "ajax:error", "form#comments-form", (ev,data)-> #nos imprime en consola si hay erores
	console.log data