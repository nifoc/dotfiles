def upn [] {
  let os = (uname)

  match $os {
    "Darwin" => { echo "D1" }
    "Linux" => { echo D2 }
    _ => { error make {msg: "unsupported operating system"} }
  }
}
