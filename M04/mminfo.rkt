(define-struct mp3info (performer title length genre))
;; An Mp3Info is a (make-mp3info Str Str Nat Sym)
;; requires:
;; performer is the name of performer of the song,
;; title is the name of song,
;; length is the length of the song in seconds,
;; genre is the genre (type or category) of the song.

(define-struct movieinfo (director title duration genre))
;; A MovieInfo is a (make-movieinfo Str Str Nat Sym)
;; requires:
;; director is the name of movie director,
;; title is the name of movie,
;; duration is a the length of the movie in minutes
;; genre is the genre (type) of the movie.

;; A MmInfo is one of (new type definition):
;; * an Mp3Info or
;; * a MovieInfo.

;; my-mminfo-fun: Mminfo → Any
;;(define (my-mminfo-fun info)
;;(cond
;;[(mp3info? info)
;; . . . (mp3info-performer info) . . .
;; . . . (mp3info-title info) . . .
;; . . . (mp3info-length info) . . .
;; . . . (mp3info-genreinfo). . .]
;;[(movieinfo? info)
;; . . . (movieinfo-director info) . . .
;; . . . (movieinfo-title info) . . .
;; . . . (movieinfo-duration info) . . .
;; . . . (movieinfo-genre info) . . . ]))

;; (mminfo-artist info) produces performer/director name from info
;; mminfo-artist: MmInfo → Str
;; Examples:
(check-expect (mminfo-artist
(make-mp3info "Beck" "Tropicalia" 185 'Alternative)) "Beck")
(check-expect (mminfo-artist
(make-movieinfo "Orson Welles" "Citizen Kane" 119 'Drama)) "Orson Welles")

(define (mminfo-artist info)
  (cond
    [(mp3info? info) (mp3info-performer info)]
    [(movieinfo? info) (movieinfo-director info)]))




