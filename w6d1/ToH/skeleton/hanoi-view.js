class View {
  constructor (game, rootEl) {
    this.game = game
    this.rootEl = rootEl
    this.first = null
    this.setupTowers()
    this.clickTower()
  }

  setupTowers () {
    const display = this.game.towers
    display.forEach((tow, idx) => {
      let tower = $("<ul class='tower'>")
      tower.data("index", idx)
      tow.forEach((disc) => {
        let discs = $("<li class='disc'>");
        discs.addClass(`disc-${disc}`)
        discs.text(disc).data('size',disc);
        tower.append(discs)
      })
      this.rootEl.append(tower)
    })
  }

  render () {
    this.rootEl.children().remove();
    this.setupTowers();
  }

  move (tower) {
    if (this.first === null) {
      this.first = tower
    } else {
      this.game.move(this.first, tower)
      this.render()
    }
  }

  clickTower () {
    this.rootEl.on('click', 'ul', (e) => {
      this.move($(e.target).data('index'))
    })
  }

}

module.exports = View;
