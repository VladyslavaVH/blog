import { Injectable, } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { Article } from "../entities/article.entities";

@Injectable(
    {
        providedIn: 'root'
})
export class ArticleService {
    private BASE_URI: string = 'https://localhost:44382/api/blog/';
    public imgUrl: string | ArrayBuffer | null | undefined;

    constructor(private http: HttpClient){}

    getAllArticles() {
        return this.http.get(this.BASE_URI);
    }

    getArticlesByName(name:string) {
        return this.http.get(this.BASE_URI + `articles/${name}`);
    }

    getArticlesByTheme(theme:string) {
        return this.http.get(this.BASE_URI + `theme/${theme}`);
    }

    getArticlesByTag(tag:string) {
        return this.http.get(this.BASE_URI + `tag/${tag}`);
    }

    getArticleById(id:number|undefined) {
        return this.http.get(this.BASE_URI + id);
    }

    postCreateArticle(data: any) {
        return this.http.post(this.BASE_URI, data);
    }

    deleteArticle(id: number | undefined) {
        return this.http.delete(this.BASE_URI + id);
    }

    updateArticle(id: number | undefined, article: Article) {
        return this.http.put(this.BASE_URI + id, article);
    }
}