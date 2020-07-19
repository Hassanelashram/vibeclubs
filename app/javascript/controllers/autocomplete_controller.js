import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "suggestions" ]

  fetchCities() {
    let input = this.inputTarget
    let ul = this.suggestionsTarget
    //let ul = document.getElementById('suggestions')
    fetch(`/autocomplete?city=${input.value}`)
    .then(response => response.json())
    .then((data) => {
      ul.innerHTML = ""
      data.cities.forEach((city) => {
        let li = `<a href="/clubs?city=${city.name}">
                    <li>${city.name}<li> </a>`
        ul.insertAdjacentHTML('beforeend', li)
      })
    })
  }

}
