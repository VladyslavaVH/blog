import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Blog';

  searchText = "";

  constructor(private router: Router) {
  }

  goSearchComponent() {
    this.router.navigate([`search/${this.searchText}`]);
  }
}
