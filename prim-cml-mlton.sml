open CML

fun prog () =
    let
	val ch : int chan = channel ()
    in
	spawn (fn () => send (ch, 100));
	spawn (fn () => print (Int.toString (recv ch) ^ "\n"));
	print "main thread done\n"
    end

val _ =
    RunCML.doit (prog, NONE)
