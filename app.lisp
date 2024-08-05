(uiop:define-package #:grow-website/app
  (:use #:cl #:reblocks-file-server)
  (:import-from #:reblocks/widget
                #:widget
                #:update
                #:render
                #:defwidget)
  (:import-from #:reblocks)
  (:import-from #:reblocks/server)
  (:import-from #:reblocks/app
                #:defapp)
  (:import-from #:reblocks/session
                #:init)
  (:import-from #:reblocks-ui
                #:ui-widget)
  (:import-from #:reblocks/dependencies
                #:get-dependencies))
(in-package #:grow-website/app)

			   
(defwidget page ()
  ())


(defapp app
  :prefix "/")  


(defparameter *swiper* (make-instance 'page))
									
(defmethod reblocks/page:init-page ((app app) url-path expire-at)
	(declare (ignorable app url-path expire-at))
		*swiper*)


(defmethod render ((page page))
  (reblocks/html:with-html
    (:div :class "swiper slider"
	  (:div :class "slider-ui"
		(:div :class "container header-wrapper"
		      (:div :class "top-line"
			    (:div :class "row"
				  (:div :class "col col--center"
					(:a :href "#"
					    :class "logo"
					    (:img :src "img/logo.svg"
						  :alt "Grow")))
				  (:div :class "col col--center col--right col--lead"
					(:nav :class "main-menu"
					      (:ul
					       (:li
						(:a :href "#" "Main"))
					       (:li :class "active"
						(:span "Info"))
					       (:li
						(:a :href "#" "Contact"))))
					(:a :href "#" :class "button button--top" "Plant now"))
				  (:div :class "col col--center"
					(:button :class "submenu anim-menu-btn"
						 (:i :class "anim-menu-btn__icon anim-menu-btn__icon--close")))))
		      (:div :class "header-content"
			    (:div :class "header-content__slide active"
				  (:h1 :class "letters" "Grow")
				  (:div :class "header-content__info"
					(:p "As an enviromental charity, we're on a mission to make it simple for everyone to help the enviroment by planting each one tree!")
					(:br)
					(:button :class "button button--main" "Plant a tree now")))
			    
			    (:div :class "header-content__slide"
				  (:h1 :class "letters" "Live")
				  (:div :class "header-content__info"
					(:p "As an enviromental charity, we're on a mission to make it simple for everyone to help the enviroment by planting each one tree!")
					(:br)
					(:button :class "button button--main" "Plant a tree now")))
			    
			    (:div :class "header-content__slide"
				  (:h1 :class "letters" "Wood")
				  (:div :class "header-content__info"
					(:p "As an enviromental charity, we're on a mission to make it simple for everyone to help the enviroment by planting each one tree!")
					(:br)
					(:button :class "button button--main" "Plant a tree now")))))
		(:div :class "header-bottom"))
	  
	  (:div :class "swiper-wrapper"
		(:div :class "swiper-slide slider__item"
		      (:div :class "slider__layer"
			    :data-swiper-parallax "35%"
			    :style "background-image: url(img/slides/slide-1-layer-back.jpg);")
		      (:div :class "slider__layer"
			    :data-swiper-parallax "25%"
			    :style "background-image: url(img/slides/slide-1-layer-middle.png);")
		      (:div :class "slider__layer"
			    :data-swiper-parallax "14%"
			    :style "background-image: url(img/slides/slide-1-layer-front.png);"))
		
		(:div :class "swiper-slide slider__item"
		      (:div :class "slider__layer"
			    :data-swiper-parallax "35%"
			    :style "background-image: url(img/slides/slide-2-layer-back.jpg);")
		      (:div :class "slider__layer"
			    :data-swiper-parallax "25%"
			    :style "background-image: url(img/slides/slide-2-layer-middle.png);")
		      (:div :class "slider__layer"
			    :data-swiper-parallax "14%"
			    :style "background-image: url(img/slides/slide-2-layer-front.png);"))
		(:div :class "swiper-slide slider__item"
		      (:div :class "slider__layer"
			    :data-swiper-parallax "35%"
			    :style "background-image: url(img/slides/slide-3-layer-back.jpg);")
		      (:div :class "slider__layer"
			    :data-swiper-parallax "25%"
			    :style "background-image: url(img/slides/slide-3-layer-middle.png);")
		      (:div :class "slider__layer"
			    :data-swiper-parallax "14%"
			    :style "background-image: url(img/slides/slide-3-layer-front.png);"))))))


(defmethod reblocks/dependencies:get-dependencies ((app app))
  (list* (reblocks/dependencies:make-dependency "libs/btn/anim-menu-btn.css"
	   :system :grow-website)
	 (reblocks/dependencies:make-dependency "libs/btn/anim-menu-btn.min.js"
	   :system :grow-website
	   :defer t)
	 (reblocks/dependencies:make-dependency "libs/swiper/swiper-bundle.min.css"
						:system :grow-website)
	 (reblocks/dependencies:make-dependency "libs/swiper/swiper-bundle.min.js"
	   :system :grow-website
	   :defer t)
	 (reblocks/dependencies:make-dependency "css/main.css"
						:system :grow-website)
	 (reblocks/dependencies::make-dependency "js/app.js"
	   :defer t	   
	   :system :grow-website)
	 (reblocks/dependencies:make-dependency "css/grid.css"
	   :system :grow-website)
	 (reblocks/dependencies:make-dependency "css/vars.css"
	   :system :grow-website)
	 (reblocks/dependencies:make-dependency "libs/code/letters.js"
	   :system :grow-website
	   :defer t)
	 (reblocks-parenscript:make-dependency
	   (defparameter name "Vlad")
	   (defun hello (name)
	     (ps:chain console (log "Heelloooo!!!"))
	     (ps:chain console (log name)))
	   (hello name))	 
         (call-next-method)))
		 
		 

(defmethod initialize-instance ((app app) &rest args)
  (declare (ignorable args))  
  (reblocks-file-server:make-route
   :root (asdf:system-relative-pathname "grow-website" "img/slides/")
   :uri "/img/slides/")
  (reblocks-file-server:make-route
   :root (asdf:system-relative-pathname "grow-website" "libs/swiper/")
   :uri "/libs/swiper/")
  (reblocks-file-server:make-route
   :root (asdf:system-relative-pathname "grow-website" "img/")
   :uri "/img/")
  (reblocks-file-server:make-route
   :root (asdf:system-relative-pathname "grow-website" "fonts/")
   :uri "/fonts/")
  (call-next-method))

;; (defmethod get-dependencies ((widget page))
;;   (list
;;    (make-dependency
;;      '(.page
;;        :width 60%
;;        :margin 3rem auto 3rem auto) )))


;; (defmethod get-dependencies ((widget multi-pages))
;;   (list
;;    (make-dependency
;;      '(.multi-pages
;;        :display flex
;;        :lex-direction row
;;        :gap 3rem
;;        :margin-left 3rem
;;        :margin-right 3rem) )))



(defun start ()
  (reblocks/server:start :port 40000
                         :apps (list 'app))
  (log:config :info))
  
(defun stop ()
	(reblocks/server:stop))
