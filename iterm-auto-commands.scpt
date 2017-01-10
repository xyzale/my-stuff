tell application "iTerm"
     activate
     set myterm to (create window with default profile)
     tell myterm
        tell current session
             write text "cd route/to/path"
             write text "docker exec -it dockercontainername bash"
             write text "cd ../route/to/cron/"
             write text "php script.php"
         end tell
     end tell
end tell
