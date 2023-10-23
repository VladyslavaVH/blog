import { Author } from "./author.entities";
import { Theme } from "./theme.entities";
import { Tag } from "./tag.entities";

export class Article {
    id: number | undefined;
    name: string | undefined;
    date: number | undefined;
    authorFK: number | undefined;
    author: Author | undefined;
    themeFK: number | undefined;
    theme: Theme | undefined;
    imgUrl: string | undefined;
    text: string | undefined;  
    tags: Tag[] | undefined;
}