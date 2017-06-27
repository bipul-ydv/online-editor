package com.online.editor.auth;

import com.online.editor.Notes;

import java.util.List;

/**
 * Created by bipul on 31/5/17.
 */
public class Content {
    private Long id;
    private String content;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Content(Long id, String content) {
        this.id = id;
        this.content = content;
    }

    public Content() {
    }


}
