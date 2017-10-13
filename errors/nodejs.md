
## node-gyp
> node-gyp is a cross-platform command-line tool written in Node.js for compiling native addon modules for Node.js. It bundles the gyp project used by the Chromium team and takes away the pain of dealing with the various differences in build platforms.It is the replacement to the node-waf program which is removed for node v0.8. If you have a native addon for node that still has a wscript file, then you should definitely add a binding.gyp file to support the latest versions of node.

> node-gyp用于将工具源码编译成 ndoejs add-on
  
#### node-gyp rebuild 错误

有时安装 nodejs 插件时会出现以下错误：

    > node-gyp rebuild


    E:\ArangoDB3e-3.2.1-2_win64\var\lib\arangodb3-apps\_db\arango_gpro\my\gpro\APP\node_modules\nodejieba>if not defined npm_config_node_gyp (node "C:\Program Files\nodejs\node_modules\npm\bin\node-gyp-bin\\..\..\node_modules\node-gyp\bin\node-gyp.js" rebuild )  else (node "" rebuild )
    gyp ERR! configure error
    gyp ERR! stack Error: Can't find Python executable "python", you can set the PYTHON env variable.
    gyp ERR! stack     at failNoPython (C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\configure.js:449:14)
    gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\configure.js:404:11
    gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\graceful-fs\polyfills.js:264:29
    gyp ERR! stack     at FSReqWrap.oncomplete (fs.js:123:15)
    gyp ERR! System Windows_NT 6.1.7601
    gyp ERR! command "C:\\Program Files\\nodejs\\node.exe" "C:\\Program Files\\nodejs\\node_modules\\npm\\node_modules\\node-gyp\\bin\\node-gyp.js" "rebuild"
    gyp ERR! cwd E:\ArangoDB3e-3.2.1-2_win64\var\lib\arangodb3-apps\_db\arango_gpro\my\gpro\APP\node_modules\nodejieba
    gyp ERR! node -v v6.10.0
    gyp ERR! node-gyp -v v3.4.0
    gyp ERR! not ok

原因是 node-gyp 安装失败。 node-gyp 用来编译原生C++模块，可能是下载那几个模块的时候 node-gyp 会编译那些模块。

解决方法： 
Windows 下安装以下工具，以管理员的身份启动 powershell，输入以下命令：
    npm --add-python-to-path --python-mirror=https://npm.taobao.org/mirrors/python/ install --global windows-build-tools

> windows-build-tools@1.3.2 postinstall C:\Users\Administrator.hank-PC\AppData\R
oaming\npm\node_modules\windows-build-tools

> node ./lib/index.js

    Downloading BuildTools_Full.exe
    [============================================>] 100.0% of 3.29 MB (2.63 MB/s)
    Downloading python-2.7.13.msi
    [============================================>] 100.0% of 19.16 MB (1.63 MB/s)
    Downloaded python-2.7.13.msi. Saved to C:\Users\Administrator.hank-PC\.windows-b
    uild-tools\python-2.7.13.msi.
    Starting installation...
    Launched installers, now waiting for them to finish.
    This will likely take some time - please be patient!
    Waiting for installers... \Successfully installed Python 2.7
    Waiting for installers... |Successfully installed Visual Studio Build Tools.
    C:\Users\Administrator.hank-PC\AppData\Roaming\npm
        `-- windows-build-tools@1.3.2
          +-- chalk@1.1.3
          | +-- ansi-styles@2.2.1
          | +-- escape-string-regexp@1.0.5
          | +-- has-ansi@2.0.0
          | | `-- ansi-regex@2.1.1
          | +-- strip-ansi@3.0.1
          | `-- supports-color@2.0.0
          +-- cli-spinner@0.2.6
          +-- debug@2.6.8
          | `-- ms@2.0.0
          +-- fs-extra@3.0.1
          | +-- graceful-fs@4.1.11
          | +-- jsonfile@3.0.1
          | `-- universalify@0.1.1
          `-- nugget@2.0.1
            +-- minimist@1.2.0
            +-- pretty-bytes@1.0.4
            | +-- get-stdin@4.0.1
            | `-- meow@3.7.0
            |   +-- camelcase-keys@2.1.0
            |   | `-- camelcase@2.1.1
            |   +-- decamelize@1.2.0
            |   +-- loud-rejection@1.6.0
            |   | +-- currently-unhandled@0.4.1
            |   | | `-- array-find-index@1.0.2
            |   | `-- signal-exit@3.0.2
            |   +-- map-obj@1.0.1
            |   +-- normalize-package-data@2.4.0
            |   | +-- hosted-git-info@2.5.0
            |   | +-- is-builtin-module@1.0.0
            |   | | `-- builtin-modules@1.1.1
            |   | +-- semver@5.4.1
            |   | `-- validate-npm-package-license@3.0.1
            |   |   +-- spdx-correct@1.0.2
            |   |   | `-- spdx-license-ids@1.2.2
            |   |   `-- spdx-expression-parse@1.0.4
            |   +-- object-assign@4.1.1
            |   +-- read-pkg-up@1.0.1
            |   | +-- find-up@1.1.2
            |   | | +-- path-exists@2.1.0
            |   | | `-- pinkie-promise@2.0.1
            |   | |   `-- pinkie@2.0.4
            |   | `-- read-pkg@1.1.0
            |   |   +-- load-json-file@1.1.0
            |   |   | +-- parse-json@2.2.0
            |   |   | | `-- error-ex@1.3.1
            |   |   | |   `-- is-arrayish@0.2.1
            |   |   | +-- pify@2.3.0
            |   |   | `-- strip-bom@2.0.0
            |   |   |   `-- is-utf8@0.2.1
            |   |   `-- path-type@1.1.0
            |   +-- redent@1.0.0
            |   | +-- indent-string@2.1.0
            |   | | `-- repeating@2.0.1
            |   | |   `-- is-finite@1.0.2
            |   | `-- strip-indent@1.0.1
            |   `-- trim-newlines@1.0.0
            +-- progress-stream@1.2.0
            | +-- speedometer@0.1.4
            | `-- through2@0.2.3
            |   +-- readable-stream@1.1.14
            |   | +-- core-util-is@1.0.2
            |   | +-- inherits@2.0.3
            |   | +-- isarray@0.0.1
            |   | `-- string_decoder@0.10.31
            |   `-- xtend@2.1.2
            |     `-- object-keys@0.4.0
            +-- request@2.81.0
            | +-- aws-sign2@0.6.0
            | +-- aws4@1.6.0
            | +-- caseless@0.12.0
            | +-- combined-stream@1.0.5
            | | `-- delayed-stream@1.0.0
            | +-- extend@3.0.1
            | +-- forever-agent@0.6.1
            | +-- form-data@2.1.4
            | | `-- asynckit@0.4.0
            | +-- har-validator@4.2.1
            | | +-- ajv@4.11.8
            | | | +-- co@4.6.0
            | | | `-- json-stable-stringify@1.0.1
            | | |   `-- jsonify@0.0.0
            | | `-- har-schema@1.0.5
            | +-- hawk@3.1.3
            | | +-- boom@2.10.1
            | | +-- cryptiles@2.0.5
            | | +-- hoek@2.16.3
            | | `-- sntp@1.0.9
            | +-- http-signature@1.1.1
            | | +-- assert-plus@0.2.0
            | | +-- jsprim@1.4.1
            | | | +-- assert-plus@1.0.0
            | | | +-- extsprintf@1.3.0
            | | | +-- json-schema@0.2.3
            | | | `-- verror@1.10.0
            | | |   `-- assert-plus@1.0.0
            | | `-- sshpk@1.13.1
            | |   +-- asn1@0.2.3
            | |   +-- assert-plus@1.0.0
            | |   +-- bcrypt-pbkdf@1.0.1
            | |   +-- dashdash@1.14.1
            | |   | `-- assert-plus@1.0.0
            | |   +-- ecc-jsbn@0.1.1
            | |   +-- getpass@0.1.7
            | |   | `-- assert-plus@1.0.0
            | |   +-- jsbn@0.1.1
            | |   `-- tweetnacl@0.14.5
            | +-- is-typedarray@1.0.0
            | +-- isstream@0.1.2
            | +-- json-stringify-safe@5.0.1
            | +-- mime-types@2.1.17
            | | `-- mime-db@1.30.0
            | +-- oauth-sign@0.8.2
            | +-- performance-now@0.2.0
            | +-- qs@6.4.0
            | +-- safe-buffer@5.1.1
            | +-- stringstream@0.0.5
            | +-- tough-cookie@2.3.2
            | | `-- punycode@1.4.1
            | +-- tunnel-agent@0.6.0
            | `-- uuid@3.1.0
            +-- single-line-log@1.1.2
            | `-- string-width@1.0.2
            |   +-- code-point-at@1.1.0
            |   `-- is-fullwidth-code-point@1.0.0
            |     `-- number-is-nan@1.0.1
            `-- throttleit@0.0.2


#### node-pre-gyp install --fallback-to-build 错误
此时，安装node-gyp

    npm install -g node-gyp

