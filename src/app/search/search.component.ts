import { Component, OnInit } from '@angular/core';
import { Article } from '../entities/article.entities';
import { ArticleService } from '../services/article.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css'],
  providers: [ArticleService]
})
export class SearchComponent implements OnInit {

  articleName: string = "";
  tagName: string = "";
  articles: Article[] = [];

  constructor(private articleService: ArticleService, private activateRoute: ActivatedRoute) {
    this.articleName = this.activateRoute.snapshot.params['articleName'];
    this.tagName = this.activateRoute.snapshot.params['tagName'];
  }

  ngOnInit(): void {
    if (this.articleName != undefined) {
      this.articleService.getArticlesByName(this.articleName).subscribe((data:any) => this.articles=data);
    }
    else {
      this.articleService.getArticlesByTag(this.tagName).subscribe((data:any) => this.articles=data);
    }
  }

}
