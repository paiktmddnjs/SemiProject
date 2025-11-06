package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WorkspaceController {

    @GetMapping("/workspace/new")
    public String getNewWorkspaceForm() {
        return "new_workspace";
    }

    @GetMapping("/workspace")
    public String getWorkspaceForm() {
        return "workspace";
    }

    @GetMapping("/layout")
    public String getLayoutForm() {
        return "layout";
    }

    @GetMapping("/project/new")
    public String getNewProjectForm() {
        return "new_project";
    }

    @GetMapping("/member/new")
    public String getNewMemberForm() {
        return "new_member";
    }

    @GetMapping("/project")
    public String getProjectForm() {
        return "project";
    }

    @GetMapping("/projectdetail")
    public String getProjectdetailForm() {
        return "projectdetail";
    }

    @GetMapping("/workspace/set")
    public String getSetWorkspaceForm() {
        return "set_workspace";
    }


}
