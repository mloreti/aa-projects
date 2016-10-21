class Router {
  constructor (node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener("hashchange", this.render.bind(this));
  }

  activeRoute() {
    return this.routes[window.location.hash.slice(1)];
  }

  render() {
    let component = this.activeRoute();
    this.node.innerHTML = "";
    if (component != undefined) {
      this.node.appendChild(component.render());
    }
  }
}

module.exports = Router;
