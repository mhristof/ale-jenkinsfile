function! JenkinsfileCommand(buffer) abort
    let l:image = 'mhristof/jenkins'
    let l:docker = "vim-ale-jenkinsfile"
    let l:port = '28080'
    return '('
    \ . 'docker inspect ' . l:docker . ' || docker run --rm --detach -p ' . l:port . ':8080 --name ' . l:docker . ' ' . l:image . ') &>/dev/null && '
    \ . 'curl -X POST -F "jenkinsfile=<'
    \ . bufname(a:buffer)
    \ . '" localhost:' . l:port . '/pipeline-model-converter/validate'
endfunction


function! Jenkinsfile(buffer, lines) abort
    " Matches patterns line the following:
    " WorkflowScript:  12: expecting '}', found '' @ line 12, column 1.
    let l:pattern = '^\vWorkflowScript:\s*(\d*):\s*(.*)\s*\@\s*line (\d*),\s*column (\d*)\.$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:item = {
        \   'lnum': l:match[3] + 0,
        \   'col': 0,
        \   'text': l:match[2],
        \   'type': 'E',
        \}
        call add(l:output, l:item)
    endfor

    return l:output
endfunction

call ale#linter#Define('groovy', {
\   'name': 'jenkinsfile',
\   'executable': 'curl',
\   'command': function('JenkinsfileCommand'),
\   'callback': 'Jenkinsfile',
\})
