import { Component, OnInit } from '@angular/core';
import { Article } from '../entities/article.entities';
import { ArticleService } from '../services/article.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-theme',
  templateUrl: './theme.component.html',
  styleUrls: ['./theme.component.css'],
  providers: [ArticleService]
})
export class ThemeComponent implements OnInit {

  themeName: string = '';
  articles: Article[] = [];

  constructor(private articleService: ArticleService, private activateRoute: ActivatedRoute, private router: Router) {
    this.themeName = this.activateRoute.snapshot.params['themeName'];
  }
  
  ngOnInit(): void {
    this.articleService.getArticlesByTheme(this.themeName).subscribe((data:any) => {
      if (data.length == 0) {
        this.router.navigate(['not-found']);
        console.log(data);        
      }
      else {
        this.articles=data;
        console.log(data);
      }
    })
  }

}
