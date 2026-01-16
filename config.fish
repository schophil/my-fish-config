function check-ssh-agent
    if uname -r | grep -q 'microsoft'
        echo "This is wsl!"
        if test -z "$SSH_AGENT_PID"
            if test -e "/tmp/schophil-ssh-agent"
                echo "Restoring env from backup file"
                source /tmp/schophil-ssh-agent
            else 
                echo 'Starting ssh agent'
                eval (ssh-agent -c)
                echo 'Creating backup file'
                echo "set -gx SSH_AGENT_PID $SSH_AGENT_PID" > /tmp/schophil-ssh-agent
                echo "set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK" >> /tmp/schophil-ssh-agent
            end
        else
            echo 'SSH agent already running on ' $SSH_AGENT_PID
        end
        function ee
            subl.exe $argv
        end
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    check-ssh-agent
end

fish_add_path ~/bin
