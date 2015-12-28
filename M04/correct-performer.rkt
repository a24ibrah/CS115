;; Fall 2015 update

(define-struct mp3info (performer title length genre))
;; An Mp3Info is a (make-mp3info Str Str Nat Sym)
;; Requires:
;; performer is the name of performer of the song,
;; title is the name of song,
;; length is the length of the song in seconds,
;; genre is the genre (type or category) of the song.

;; Template:
;; my-mp3info-fun: Mp3Info → Any
;; (define (my-mp3info-fun info)
;; . . . (mp3info-performer info). . .
;; . . . (mp3info-title info). . .
;; . . . (mp3info-length info). . .
;; . . . (mp3info-genre info). . . )

;; (correct-performer oldinfo newname) produces a new Mp3Info
;; formed from oldinfo, correcting performer to newname.
;; correct-performer: Mp3Info Str → Mp3Info

;; example:
(check-expect (correct-performer
(make-mp3info "LaLaLa Singer" "Bite This" 80 'Punk)
"Anonymous Doner Kebab")
(make-mp3info "Anonymous Doner Kebab" "Bite This" 80 'Punk))

;; Implementation:
(define (correct-performer oldinfo newname)        
  (make-mp3info newname
  (mp3info-title oldinfo)
  (mp3info-length oldinfo)
  (mp3info-genre oldinfo)))