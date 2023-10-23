import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Article } from '../entities/article.entities';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css'],
  providers: [ArticleService]
})
export class CreateComponent implements OnInit {
  article: Article | undefined;
  @ViewChild('name') name: ElementRef | undefined;
  @ViewChild('nickName') nickName: ElementRef | undefined;
  @ViewChild('theme') theme: ElementRef | undefined;
  @ViewChild('imgUrl') imgUrl: ElementRef | undefined;
  @ViewChild('tags') tags: ElementRef | undefined;
  @ViewChild('text') text: ElementRef | undefined;

  constructor(private service: ArticleService) {
  }

  ngOnInit(): void {
  }

  onSubmit() {
    let formData = new FormData();
    formData.append("name", this.name?.nativeElement.value);
    formData.append("nickName", this.nickName?.nativeElement.value);
    formData.append("theme", this.theme?.nativeElement.value);
    formData.append("imgUrl", this.imgUrl?.nativeElement.value);
    formData.append("tags", this.tags?.nativeElement.value);
    formData.append("text", this.text?.nativeElement.value);
    
    //console.log(formData);
    this.service.postCreateArticle(formData)
    .subscribe((res:any) => console.warn(res));
  }

}
