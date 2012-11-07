;;; gary/key-chords.el -- Two key combinations mapped to commands

(key-chord-mode 1)

;; Window switching.
(key-chord-define-global "wu" 'windmove-up)
(key-chord-define-global "wl" 'windmove-left)
(key-chord-define-global "wf" 'windmove-down)
(key-chord-define-global "wr" 'windmove-right)

(provide 'gary/key-chords)
;;; gary/key-chords.el ends here
