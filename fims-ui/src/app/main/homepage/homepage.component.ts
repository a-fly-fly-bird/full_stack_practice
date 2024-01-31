import { Component, OnInit, computed, effect, signal } from '@angular/core';

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.scss']
})
export class HomepageComponent implements OnInit{

  public count = signal(0);
  // computed signal is not WritableSignal
  public computedCount = computed(() => this.count() ** 2);

  constructor(){
    effect(() => {
      console.log(`The current effect count is: ${this.count()}`);
    });
  }

  ngOnInit(): void {
    console.log('The count is: ' + this.count());
    console.log('The computedCount is: ' + this.computedCount());
    this.count.set(3);
    console.log('The count is: ' + this.count());
    console.log('The computedCount is: ' + this.computedCount());
    this.count.update(value => value + 3);
    console.log('The count is: ' + this.count());
    console.log('The computedCount is: ' + this.computedCount());
  }
}
