import { Controller } from "@hotwired/stimulus"
import Masonry from "masonry-layout"

export default class extends Controller {
  connect() {
    Promise.all(Array.from(document.images)
      .filter(img => !img.complete)
      .map(img => new Promise(resolve => { img.onload = img.onerror = resolve; })))
      .then(() => {
        var elem = document.querySelector('.grid');
        var msnry = new Masonry( elem, {
          // options
          itemSelector: '.grid-item',
          percentPosition: true
        });
        msnry.layout();
      });
  }

}