import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	
	connect() {
		if (this.element.getAttribute("data-is-signed-in") === "true") {
			const adminElements = document.querySelectorAll('[data-admin]')
			adminElements.forEach(element => {
				element.classList.add("hidden")
			})
			
			const adminLinks = document.querySelectorAll('[admin-link]')
			adminLinks.forEach(element => {
				element.onclick = (event) => {
					event.preventDefault()
				}
			})
		}
	}
}