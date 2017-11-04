class Clock {
  constructor() {
    let currentDate = new Date();
    this.hour = currentDate.getHours();
    this.minute = currentDate.getMinutes();
    this.second = currentDate.getSeconds();
    setInterval(this._tick, 1000);
  }

  printTime() {
    console.log(`${this.hour}:${this.minute}:${this.second}`);
  }

  _tick() {
    this.second++;
    if (this.second === 60) {
      this.second = 0;
      this.minute++;
    }

    if (this.minute === 60) {
      this.minute = 0;
      this.hour++;
    }

    if (this.hour === 24) {
      this.hour = 0;
    }
  }
}

const clock = new Clock();
