let create_newdir path perm =
  if not (Sys.file_exists path) then Sys.mkdir path perm

let test_example name () =
  let greeting = "Hello " ^ name ^ "!" in
  let expected = Printf.sprintf "Hello %s!" name in
  Alcotest.check Alcotest.string "same string" greeting expected



let test_reference_tree_to_json from_dir to_file () =
  let _ = print_endline (Sys.getcwd()) in
  let _ = create_newdir "../../../test/testresults" 0o777 in
  Vyos1x.Generate.reference_tree_to_json from_dir to_file

let interfaceDefinitionSuite =
  [ 
    "can greet Tom", `Quick, test_example "Tom";
    "Generate xml to json cache", `Quick, test_reference_tree_to_json "../../../test/testdata/interface-definitions" "../../../test/testresults/xml_cache.json";
  ]

let () =
  Alcotest.run "Test Suite" [ "InterfaceDefinitions", interfaceDefinitionSuite ]