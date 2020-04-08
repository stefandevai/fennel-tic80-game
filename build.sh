#!/bin/bash

compile()
{
  echo "Compiling fennel to lua..."
  cat source/main.fnl >> build/out.fnl
  fennel --compile build/out.fnl > build/main.lua
}

run()
{
  echo "Running with Tic 80..."
}

while [ "$1" != "" ]; do
  case $1 in
    -c | --compile )
      shift
      compile
      ;;
    -r | --run )
      shift
      run
      ;;
    * )
      usage
      exit 1
  esac
  shift
done

