;; Tabu Search Classes
;; ---------------------------------------
;; - it is possible to define your own moves and initial solution heuristic.
(in-package :open-vrp.algo)

(defclass tabu-search (algo)
  ((name :initform "Tabu Search")
   (desc :initform "A local search that escapes local optima by means of declaring certain moves tabu.")
   (move-type :accessor ts-move-type :initarg :move-type :initform 'TS-best-insertion-move)
   (init-heur :accessor ts-init-heur :initarg :init-heur :initform 'greedy-best-insertion)
   (iterations :initform 20)
   (aspirationp :accessor ts-aspirationp :initarg :aspirationp :initform T)
   (elite-listp :accessor ts-elite-listp :initarg :elite-listp :initform T)
   (tabu-list :accessor ts-tabu-list :initarg :tabu-list :initform nil)
   (tabu-tenure :accessor ts-tenure :initarg :tabu-tenure :initform 15)
   (tabu-parameter-f :accessor ts-parameter-f :initarg :tabu-parameter-f :initform #'ts-pars-n)
   (candidate-list :accessor ts-candidate-list :initarg :candidate-list :initform nil)
   (stopping-condition :accessor ts-stopping-condition :initarg :stopping-condition :initform #'stopping-conditionp)))

;; ----------------------------

;; Tabu search move types
;; ---------------------------

;; Given a node and a vehicle, TS-best-insertion inserts it in the best possible position
(defstruct (TS-best-insertion-move (:include insertion-move)))
