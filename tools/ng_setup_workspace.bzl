# Copyright Google Inc. All Rights Reserved.
#
# Use of this source code is governed by an MIT-style license that can be
# found in the LICENSE file at https://angular.io/license

"Install angular source dependencies"

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")
load("@angular//packages/bazel/src:ng_setup_workspace.bzl", _ng_setup_workspace = "ng_setup_workspace")

def ng_setup_workspace():
    """This repository rule should be called from your WORKSPACE file.

    It creates some additional Bazel external repositories that are used internally
    to build angular
    """
    yarn_install(
        name = "angular_deps",
        package_json = "@angular//:package.json",
        yarn_lock = "@angular//:yarn.lock",
        data = ["@angular//:tools/yarn/check-yarn.js", "@angular//:tools/postinstall-patches.js"],
        node_modules_filegroup = """
filegroup(
    name = "node_modules",
    srcs = glob(["/".join([
        "node_modules",
        pkg,
        "**",
        ext,
    ]) for pkg in [
        "adm-zip",
        "ajv",
        "angular",
        "angular-1.5",
        "angular-1.6",
        "angular-mocks",
        "angular-mocks-1.5",
        "angular-mocks-1.6",
        "anymatch",
        "arr-diff",
        "arr-flatten",
        "arr-union",
        "array-unique",
        "asn1",
        "assert-plus",
        "assign-symbols",
        "async-each",
        "asynckit",
        "atob",
        "aws-sign2",
        "aws4",
        "balanced-match",
        "base",
        "base64-js",
        "binary-extensions",
        "blocking-proxy",
        "brace-expansion",
        "braces",
        "bytebuffer",
        "cache-base",
        "caseless",
        "chokidar",
        "class-utils",
        "co",
        "collection-visit",
        "convert-source-map",
        "combined-stream",
        "component-emitter",
        "concat-map",
        "copy-descriptor",
        "core-util-is",
        "debug",
        "decode-uri-component",
        "define-property",
        "delayed-stream",
        "domino",
        "expand-brackets",
        "expand-range",
        "extend",
        "extend-shallow",
        "extglob",
        "extsprintf",
        "fast-deep-equal",
        "fast-json-stable-stringify",
        "filename-regex",
        "fill-range",
        "for-in",
        "for-own",
        "forever-agent",
        "form-data",
        "fragment-cache",
        "fs.realpath",
        "get-value",
        "glob",
        "glob-base",
        "glob-parent",
        "graceful-fs",
        "hammerjs",
        "har-schema",
        "har-validator",
        "has-value",
        "has-values",
        "http-signature",
        "https-proxy-agent",
        "inflight",
        "inherits",
        "is-accessor-descriptor",
        "is-binary-path",
        "is-buffer",
        "is-data-descriptor",
        "is-descriptor",
        "is-dotfile",
        "is-equal-shallow",
        "is-extendable",
        "is-extglob",
        "is-glob",
        "is-number",
        "is-plain-object",
        "is-posix-bracket",
        "is-primitive",
        "is-typedarray",
        "is-windows",
        "isarray",
        "isobject",
        "isstream",
        "jasmine",
        "jasmine-core",
        "jasminewd2",
        "json-schema",
        "json-schema-traverse",
        "json-stable-stringify",
        "json-stringify-safe",
        "jsprim",
        "kind-of",
        "long",
        "lru-cache",
        "magic-string",
        "map-cache",
        "map-visit",
        "math-random",
        "micromatch",
        "mime-db",
        "mime-types",
        "minimatch",
        "minimist",
        "mixin-deep",
        "mock-fs",
        "nanomatch",
        "normalize-path",
        "oauth-sign",
        "object.omit",
        "object.pick",
        "object-copy",
        "object-visit",
        "once",
        "optimist",
        "options",
        "os-tmpdir",
        "parse-glob",
        "pascalcase",
        "path-dirname",
        "path-is-absolute",
        "performance-now",
        "posix-character-classes",
        "preserve",
        "process-nextick-args",
        "protobufjs",
        "protractor",
        "qs",
        "randomatic",
        "readable-stream",
        "readdirp",
        "reflect-metadata",
        "regex-cache",
        "regex-not",
        "remove-trailing-separator",
        "repeat-element",
        "repeat-string",
        "request",
        "ret",
        "rimraf",
        "safe-buffer",
        "safe-regex",
        "safer-buffer",
        "sax",
        "semver",
        "set-immediate-shim",
        "set-value",
        "shelljs",
        "sigmund",
        "snapdragon",
        "snapdragon-node",
        "snapdragon-util",
        "source-map",
        "source-map-resolve",
        "source-map-support",
        "source-map-url",
        "sourcemap-codec",
        "split-string",
        "sshpk",
        "static-extend",
        "stringstream",
        "tmp",
        "to-object-path",
        "to-regex",
        "to-regex-range",
        "tough-cookie",
        "tsickle",
        "tslib",
        "tsutils",
        "tunnel-agent",
        "typescript",
        "union-value",
        "unset-value",
        "upath",
        "uri-js",
        "urix",
        "use",
        "util-deprecate",
        "uuid",
        "verror",
        "webdriver-js-extender",
        "webdriver-manager",
        "wordwrap",
        "wrappy",
        "xhr2",
        "xml2js",
        "xmlbuilder",
        "zone.js",
        "@angular-devkit/core",
        "@angular-devkit/schematics",
        "@types",
        "@webcomponents/custom-elements",
    ] for ext in [
        "*.js",
        "*.json",
        "*.d.ts",
    ]] + [
        "node_modules/protractor/**",
        "node_modules/@schematics/angular/**",
    ]))
""",
    )

    yarn_install(
        name = "ts-api-guardian_runtime_deps",
        package_json = "//tools/ts-api-guardian:package.json",
        yarn_lock = "//tools/ts-api-guardian:yarn.lock",
    )

    yarn_install(
        name = "http-server_runtime_deps",
        package_json = "//tools/http-server:package.json",
        yarn_lock = "//tools/http-server:yarn.lock",
    )

    _ng_setup_workspace()
