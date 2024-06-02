# foo

Reproduction of a Stack missed recompilation bug. Test suite, when invoked in a separate `stack` call, is not recompiled if only the lib changes.

1. `stack test` - compile everything
2. Modify the lib:

```diff
diff --git a/src/Lib.hs b/src/Lib.hs
index 33dd800..af8345d 100644
--- a/src/Lib.hs
+++ b/src/Lib.hs
@@ -1,4 +1,4 @@
 module Lib (someFunc) where
 
 someFunc :: Int -> Int
-someFunc = (+1)
+someFunc = (+2)
```

3. `stack build foo` - important: only build the lib
4. `stack test foo-tests`

The test suite should fail, but is not recompiled, and still succeeds.
