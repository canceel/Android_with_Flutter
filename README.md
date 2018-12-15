# native_with_flutter

------

安卓原生APP集成Flutter Demo，及Flutter使用帮助

#### 一. 集成文档

1. [集成文档](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps#experiment-turn-the-flutter-project-into-a-module)

#### 二. 报错解决

1. Native调用Flutter存在这个奔溃报错，

```
    /**
     * 2018-12-15 12:05:22.403 7902-7902/com.shenme.example E/flutter: [ERROR:flutter/runtime/dart_vm.cc(259)] VM snapshot must be valid.
     * 2018-12-15 12:05:22.403 7902-7902/com.shenme.example A/flutter: [FATAL:flutter/shell/common/shell.cc(212)] Check failed: vm. Must be able to initialize the VM.
     *
     *
     *     --------- beginning of crash
     * 2018-12-15 12:05:22.403 7902-7902/com.shenme.example A/libc: Fatal signal 6 (SIGABRT), code -6 in tid 7902 (.shenme.example), pid 7902 (.shenme.example)
     */
```

发现是因为app/build.gradle配置了gradle渠道打包引起的，目前注释了可以使用，配置待定