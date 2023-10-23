import { Input, Component, OnInit} from '@angular/core';
import { Article } from '../entities/article.entities';
import { Router } from '@angular/router';


@Component({
  selector: 'app-articleList',
  templateUrl: './articleList.component.html',
  styleUrls: ['./articleList.component.css']
})
export class ArticleListComponent implements OnInit {

  @Input() articleList: Article[] = [];

  constructor(private router: Router) { }

  ngOnInit(): void {  
  }

  goToArtile(id: number | undefined) {
    this.router.navigate([`article/${id}`]);
  }

  goToSearch(tagName: string | undefined) {
    this.router.navigate([`search/tag/${tagName}`]);
  }

}
