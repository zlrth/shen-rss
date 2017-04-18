(defcc <element>
  <stag> <content> <etag> := (@s <stag> <content> <etag>);)

(compile <element> (explode "<bad>content<bad>"))

(defcc <content>
  <string-chars> := <string-chars>;)

(defcc <stag>
  <startchar> <string-chars> <endchar> := (@s  <startchar> <string-chars> <endchar>);) \\ i'm dumb

(defcc <etag>
  <startchar> <string-chars> <endchar> := (@s  <startchar> <string-chars> <endchar>);)

(defcc <string-char>
  Char := Char where (not (element? Char ["c#34;" "\" "<" ">"]));)

(defcc <string-chars>
  <string-char> <string-chars>              := (@s <string-char> <string-chars>);
  <e>                                       := "";)

(compile <content> (explode "string"))

(defcc <startchar>
  "<" := "<";)

(defcc <endchar>
  ">" := ">";)

(compile <pair> (explode "c#34;somethingc#34;:34"))
