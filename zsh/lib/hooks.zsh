function hook {
  if [[ $# == 2 ]]; then
    local function_name=$2
    if (( ! $+functions[$function_name] )); then
      print -P "%F{1}Cannot add undefined function as $1 hook: $function_name%f"
      return 1
    fi
  elif [[ $# == 3 ]]; then
    local function_name=".hook.$1.$2"
    eval "function $function_name { $3; }"
  else
    echo 'Usage: hook TYPE FUNCTION_NAME\n       hook TYPE ID COMMANDS' >&2
    return 2
  fi

  eval "${1}_functions=(\${${1}_functions:#$function_name} $function_name)"

  run-hooks hook_added $1 $function_name
}

function unhook {
  if [[ $# != 2 ]]; then
    echo 'Usage: unhook TYPE FUNCTION_NAME\n       unhook TYPE ID' >&2
    return 1
  fi

  local function_name=$2
  if (( $+functions[.hook.$1.$2] )); then
    function_name=".hook.$1.$2"
    unfunction $function_name
  elif ! (( $+functions[$function_name] )); then
    return
  fi

  eval "${1}_functions=(\${${1}_functions:#$function_name})"
}

function run-hooks {
  eval "for f (\$$1_functions) \$f \${(q)@:2}"
}
