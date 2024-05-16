import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "link", "copyBtn" ]
	
	copy() {
		navigator.clipboard.writeText(this.linkTarget.textContent)
			.then(() => {
				this.copyBtnTarget.textContent = "Copied!"
				setTimeout(() => this.copyBtnTarget.textContent = "Copy", 2000)
			})
	}
}
