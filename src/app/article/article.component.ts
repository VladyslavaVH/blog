import { Component, OnInit } from '@angular/core';
import { ArticleService } from '../services/article.service';
import { ActivatedRoute } from '@angular/router';
import { Article } from '../entities/article.entities';
import { Router } from '@angular/router';

@Component({
  selector: 'app-article',
  templateUrl: './article.component.html',
  styleUrls: ['./article.component.css'],
  providers: [ArticleService]
})
export class ArticleComponent implements OnInit {

  id: number | undefined;
  article: Article | undefined;

  constructor(private articleService: ArticleService, private activateRoute: ActivatedRoute, private router: Router) {
    this.id = this.activateRoute.snapshot.params['id'];
   }

  ngOnInit(): void {
    this.articleService.getArticleById(this.id).subscribe((data:any) => {this.article=data; console.log(this.article);});
  }

  goToSearch(tagName: string | undefined) {
    this.router.navigate([`search/tag/${tagName}`]);
  }

  deleteArticle(id: number | undefined) {
    this.articleService.deleteArticle(id).subscribe((res:any) => console.warn(res));
    this.router.navigate([""]);
  }

  updateArticle(id: number | undefined) {
    this.router.navigate([`update/${id}`]);
  }

}
