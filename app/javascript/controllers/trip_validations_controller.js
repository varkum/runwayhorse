import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "msg", "start", "end" ]
	
	setDate() {
		this.endTarget.value = this.startTarget.value
	}
	
	validateDates() {
		const startDate = new Date(this.startTarget.value)
		const endDate = new Date(this.endTarget.value)
		const threeMonthsLater = new Date(startDate.setMonth(startDate.getMonth() + 3))
		
		if (endDate > threeMonthsLater) {
			this.msgTarget.style.display = "block"
		} else {
			this.msgTarget.style.display = "none"
		}
	}
}