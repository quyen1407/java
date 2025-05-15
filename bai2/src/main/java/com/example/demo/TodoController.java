package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/todos")
public class TodoController {
    private List<Todo> todos = new ArrayList<>();
    private Long idCounter = 1L;

    // GET /todos: Hiển thị danh sách công việc
    @GetMapping
    public String listTodos(Model model) {
        model.addAttribute("todos", todos);
        return "index";
    }

    // GET /todos/new: Hiển thị form thêm công việc mới
    @GetMapping("/new") 
    public String showAddTodoForm(Model model) {
        model.addAttribute("todo", new Todo());
        return "add-todo";
    }

    // POST /todos: Thêm công việc mới
    @PostMapping
    public String addTodo(@ModelAttribute Todo todo) {
        todo.setId(idCounter++);
        todos.add(todo);
        return "redirect:/todos";
    }

    // GET /todos/{id}: Hiển thị chi tiết công việc
    @GetMapping("/{id}")
    public String viewTodo(@PathVariable Long id, Model model) {
        Todo todo = todos.stream()
                .filter(t -> t.getId().equals(id))
                .findFirst()
                .orElse(null);
        model.addAttribute("todo", todo);
        return "todo-detail";
    }

    // GET /todos/delete/{id}: Xóa công việc
    @GetMapping("/delete/{id}")
    public String deleteTodo(@PathVariable Long id) {
        todos.removeIf(todo -> todo.getId().equals(id));
        return "redirect:/todos";
    }
}