import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['select', 'frame'];

  connect() {
    console.log('FPL controller connected');
    this.selectTarget.value =
      this.selectTarget.options[this.selectTarget.options.length - 1].value;
  }

  selectGameweek() {
    const selectedGameweek = this.selectTarget.value;
    this.frameTarget.src = `/fpl-bet/gameweek/${selectedGameweek}`;
  }
}
