load("@aspect_rules_ts//ts:defs.bzl", "ts_project")
load("@aspect_rules_js//js:defs.bzl", "js_library")


def ts_library(name, srcs, bundle_srcs = [], deps = [], visibility = None):
    ts_project_name = name + "_tsc"

    ts_project(
        name = ts_project_name,
        srcs = srcs,
        deps = deps,
        declaration = True,
        emit_declaration_only = True,
        tsconfig = "//:tsconfig"
    )

    js_library(
        name = name,
        srcs = srcs + bundle_srcs,
        deps = [ts_project_name] + deps,
        visibility = visibility,
    )