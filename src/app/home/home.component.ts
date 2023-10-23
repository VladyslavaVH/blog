import { Component, OnInit } from '@angular/core';
import { Article } from '../entities/article.entities';
import { ArticleService } from '../services/article.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  providers: [ArticleService]
})
export class HomeComponent implements OnInit {

  articles: Article[] = [];

  constructor(private articleService: ArticleService, private router: Router) { }

  ngOnInit(): void {  
    this.articleService.getAllArticles().subscribe((data: any) => { this.articles=data; });
  }

  goToCreate() {
    this.router.navigate(["create"]);
  }
}
