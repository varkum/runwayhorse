import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	
	setCursor(event) {
		const inputElement = event.target
		const inputLength = inputElement.value.length
		
		inputElement.setSelectionRange(inputLength, inputLength)
	}
	
	submit(event) {
		const form = event.target.form
		form.requestSubmit()
	}
}