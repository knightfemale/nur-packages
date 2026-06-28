/*
  功能:
    递归校验 attrs 树的类型
    遍历 schema 的 key, 当 attrs 中存在同名 key 时检查类型; 缺失 key 静默通过
    不匹配则 builtins.trace 警告, 不阻断求值
  输入参数:
    prefix:  用于校验错误提示的路径前缀 (递归时自动拼接)
    schema:  嵌套 attrs, 叶子为 lib.types.* 值
    attrs:    待校验的 attrs
  返回值:
    原始 attrs (不变), 校验结果通过 builtins.trace 输出
  示例:
    functions.checkAttrs "" { foo.enable = lib.types.bool } { foo.enable = "true"; }
     trace: WARNING: foo.enable: expected type bool, but "true" is string
    => { foo.enable = "true"; }
*/
inputs:
let
  inherit (inputs.nixpkgs) lib;
  function =
    prefix: schema: attrs:
    let
      checkOne =
        key:
        let
          fullKey = if prefix == "" then key else "${prefix}.${key}";
          schemaVal = schema.${key};
        in
        if attrs ? ${key} then
          let
            val = attrs.${key};
          in
          if builtins.isAttrs schemaVal && !(schemaVal ? check) then
            function fullKey schemaVal val
          else if !schemaVal.check val then
            builtins.trace "WARNING: ${fullKey}: expected type ${schemaVal.name}, ${toString val} is ${builtins.typeOf val}" true
          else
            true
        else
          true;
    in
    builtins.seq (lib.foldl' (acc: key: checkOne key) true (builtins.attrNames schema)) attrs;
in
function
