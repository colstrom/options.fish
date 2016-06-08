function options
    switch (count $argv)
        case 0
            map options
        case '*'
            for arg in $argv
                if string match --quiet --regex '^-' -- "$arg"
                    if string match --quiet --regex '^--' -- "$arg"
                        set --query key
                        and printf "%s %s\n" "$key" ""

                        set key (string trim --left --chars - -- "$arg")
                    else
                        rest (string split '' -- "$arg")
                    end
                else
                    printf "%s %s\n" (default "$key" _) "$arg"
                    set --erase key
                end
            end
    end
    true
end
