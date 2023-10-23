import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule }   from '@angular/forms';

import { AppComponent } from './app.component';
import { ArticleListComponent } from './articleList/articleList.component';
import { HomeComponent } from './home/home.component';

import {Routes, RouterModule} from '@angular/router';
import { SearchComponent } from './search/search.component';
import { ThemeComponent } from './theme/theme.component';
import { ArticleComponent } from './article/article.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { CreateComponent } from './create/create.component';
import { UpdateComponent } from './update/update.component';

const appRoutes: Routes =[//
  { path: '', component: HomeComponent},
  { path: 'search/:articleName', component: SearchComponent},
  { path: 'search/tag/:tagName', component: SearchComponent},
  { path: 'theme/:themeName', component: ThemeComponent},
  { path: 'article/:id', component: ArticleComponent},
  { path: 'not-found', component: NotFoundComponent},
  { path: 'create', component: CreateComponent},
  { path: 'update/:id', component: UpdateComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    ArticleListComponent,
    HomeComponent,
    SearchComponent,
    ThemeComponent,
    ArticleComponent,
    NotFoundComponent,
    CreateComponent,
    UpdateComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(appRoutes, {onSameUrlNavigation: 'reload'})//
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
