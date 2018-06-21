(ns test-app.core
  (:gen-class)
  (:require [aleph.http :as http]))

(defn -main
  [& _]
  (http/start-server
    (constantly
      {:status 200
       :headers {"Content-Type" "text/plain"}
       :body "Hello, World!"})
    {:port 8080}))
