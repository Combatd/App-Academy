const MovingObject = require('./moving_object.js'); 
const Util = require('./util.js'); 

const DEFAULTS = { 
  COLOR: 'red', 
  RADIUS: 2
}; 

function Bullet(options) { 
  MovingObject.call(this, { 
    color: DEFAULTS.COLOR, 
    radius: DEFAULTS.RADIUS, 
    pos: options.pos, 
    vel: options.vel,
    game: options.game
  }); 
}

Bullet.SPEED = 1;

Util.inherits(Bullet, MovingObject);

Bullet.prototype.isWrappable = false; 

module.exports = Bullet; 
