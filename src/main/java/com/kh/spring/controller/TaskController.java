package com.kh.spring.Controller;

import com.kh.spring.model.service.TaskService;
import com.kh.spring.model.vo.TaskVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/task")
public class TaskController {

    private static final Logger log = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;

    @GetMapping("/new")
    public String getNewTaskForm(@RequestParam("projectId") int projectId, Model model) {
        log.info("GET /task/new - projectId: {}", projectId);
        Map<String, Object> formData = taskService.getNewTaskFormData(projectId);
        model.addAllAttributes(formData);
        return "new_task";
    }

    @PostMapping("/create")
    public String createTask(@RequestParam("projectId") int projectId,
                             @RequestParam("taskName") String taskName,
                             @RequestParam(value = "workspaceMemberId", required = false) Integer workspaceMemberId,
                             @RequestParam("taskAssign") String taskAssign,
                             @RequestParam(value = "taskDeadline", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date taskDeadline) {
        TaskVo task = new TaskVo();
        task.setProjectId(projectId);
        task.setTaskName(taskName);
        if (workspaceMemberId != null) {
            task.setWorkspaceMemberId(workspaceMemberId);
        }
        task.setTaskAssign(taskAssign);
        task.setTaskDeadline(taskDeadline);
        taskService.createTask(task);
        return "redirect:/project/detail?projectId=" + projectId;
    }

    @PostMapping("/update/status")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateTaskStatus(@RequestParam("taskId") int taskId,
                                                                @RequestParam("status") String status) {
        log.info("POST /task/update/status - taskId: {}, status: {}", taskId, status);
        try {
            int result = taskService.updateTaskStatus(taskId, status);
            if (result > 0) {
                return ResponseEntity.ok(Map.of("success", true, "message", "상태가 업데이트되었습니다."));
            } else {
                return ResponseEntity.badRequest().body(Map.of("success", false, "message", "작업을 찾을 수 없습니다."));
            }
        } catch (Exception e) {
            log.error("상태 업데이트 오류", e);
            return ResponseEntity.internalServerError().body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }

    @PostMapping("/update/assignee")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateTaskAssignee(@RequestParam("taskId") int taskId,
                                                                  @RequestParam(value = "workspaceMemberId", required = false) Integer workspaceMemberId) {
        log.info("POST /task/update/assignee - taskId: {}, workspaceMemberId: {}", taskId, workspaceMemberId);
        try {
            int result = taskService.updateTaskAssignee(taskId, workspaceMemberId);
            if (result > 0) {
                return ResponseEntity.ok(Map.of("success", true, "message", "담당자가 업데이트되었습니다."));
            } else {
                return ResponseEntity.badRequest().body(Map.of("success", false, "message", "작업을 찾을 수 없습니다."));
            }
        } catch (Exception e) {
            log.error("담당자 업데이트 오류", e);
            return ResponseEntity.internalServerError().body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }
}
