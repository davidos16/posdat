import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "active" ]
    toggle(event) {
    let formData = new FormData()
    formData.append("widget[active]", this.activeTarget.checked);
    
    fetch(this.data.get("update-url"), {
      body: formData,
      method: 'PATCH',
      credentials: "include",
      dataType: "script",
    }).then(function(response) {
    if (response.status != 204) {
        event.target.checked = !event.target.checked 
    }
    })
    

    }
    
}