import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ArticleService } from '../services/article.service';
import { Article } from '../entities/article.entities';

@Component({
  selector: 'app-update',
  templateUrl: './update.component.html',
  styleUrls: ['./update.component.css']
})

export class UpdateComponent implements OnInit {
  id: number | undefined;
  article: Article | undefined;
  @ViewChild('name') name: ElementRef | undefined;
  @ViewChild('imgUrl') imgUrl: ElementRef | undefined;
  @ViewChild('text') text: ElementRef | undefined;
  // selectedTag = "";

  constructor(private articleService: ArticleService, private activateRoute: ActivatedRoute, private router: Router) { 
    this.id = this.activateRoute.snapshot.params['id'];
  }

  ngOnInit(): void {
    this.articleService.getArticleById(this.id).subscribe((data:any) => this.article = data);
  }

  onSubmit() {
    let updatedArticle = new Article();
    updatedArticle.id = this.article?.id;
    updatedArticle.name = this.name?.nativeElement.value;
    updatedArticle.date = this.article?.date;
    updatedArticle.authorFK = this.article?.authorFK;
    updatedArticle.author = this.article?.author;
    updatedArticle.themeFK = this.article?.themeFK;
    updatedArticle.theme = this.article?.theme;
    updatedArticle.tags = this.article?.tags;
    updatedArticle.imgUrl = this.imgUrl?.nativeElement.value;
    updatedArticle.text = this.text?.nativeElement.value;

    this.articleService.updateArticle(this.id, updatedArticle).subscribe((res:any) => console.warn(res));

    //this.router.navigate([`article/{this.id}`]);
  }

}
